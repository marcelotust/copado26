import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:copado26/presentation/widgets/scan_feedback_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Web fallback: manual code entry instead of camera.
class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerStubState();
}

class _ScannerStubState extends State<ScannerScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    context.read<ScannerBloc>().add(ScannerCodeDetected(_controller.text.trim().toUpperCase()));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Figurinha'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<ScannerBloc, ScannerState>(
        listener: (context, state) {
          if (state is ScannerSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '✓ ${state.sticker.section} ${state.sticker.number} registrada! (${state.sticker.quantity}x)',
                ),
                backgroundColor: AppColors.stickerOwned,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Digite o código do verso da figurinha',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Exemplo: MAR 4',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    autofocus: true,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'Código (ex: MAR 4)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      suffixIcon: const Icon(Icons.label_outline),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Campo obrigatório';
                      final ok = RegExp(r'^[A-Z]{3}\s\d{1,3}$').hasMatch(v.trim().toUpperCase());
                      if (!ok) return 'Formato inválido. Use: MAR 4';
                      return null;
                    },
                    onFieldSubmitted: (_) => _submit(),
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: state is ScannerProcessing ? null : _submit,
                  icon: state is ScannerProcessing
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.add_circle_outline),
                  label: const Text('Registrar'),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
                const SizedBox(height: 24),
                if (state is ScannerSuccess || state is ScannerError)
                  ScanFeedbackBanner(state: state),
              ],
            ),
          );
        },
      ),
    );
  }
}
