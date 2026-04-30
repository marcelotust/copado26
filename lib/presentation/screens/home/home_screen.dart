import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/presentation/blocs/scanner/scanner_bloc.dart';
import 'package:copado26/presentation/screens/checklist/checklist_screen.dart';
import 'package:copado26/presentation/screens/scanner/scanner_platform.dart';
import 'package:copado26/presentation/screens/stats/stats_screen.dart';
import 'package:copado26/presentation/screens/swaps/swaps_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const _tabs = [
    ChecklistScreen(),
    SwapsScreen(),
    StatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Copado 26'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            tooltip: 'Registrar figurinha',
            onPressed: _openScanner,
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.grid_view), label: 'Álbum'),
          NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'Trocas'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),
    );
  }

  void _openScanner() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider.value(
          value: context.read<ScannerBloc>(),
          child: const ScannerScreen(),
        ),
      ),
    );
  }
}
