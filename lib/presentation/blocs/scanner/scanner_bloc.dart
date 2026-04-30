import 'dart:async';

import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/core/errors/failures.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/domain/usecases/scan_sticker_code.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc(this._scanStickerCode) : super(const ScannerIdle()) {
    on<ScannerStarted>(_onStarted);
    on<ScannerStopped>(_onStopped);
    on<ScannerCodeDetected>(_onCodeDetected);
  }

  final ScanStickerCode _scanStickerCode;
  DateTime? _lastScanTime;

  void _onStarted(ScannerStarted event, Emitter<ScannerState> emit) {
    emit(const ScannerReady());
  }

  void _onStopped(ScannerStopped event, Emitter<ScannerState> emit) {
    _lastScanTime = null;
    emit(const ScannerIdle());
  }

  Future<void> _onCodeDetected(
    ScannerCodeDetected event,
    Emitter<ScannerState> emit,
  ) async {
    if (_isWithinDebounce()) return;
    _lastScanTime = DateTime.now();

    emit(const ScannerProcessing());
    final (sticker, failure) = await _scanStickerCode(event.rawCode);

    if (failure != null) {
      emit(ScannerError(failure));
      return;
    }

    emit(ScannerSuccess(sticker!));
  }

  bool _isWithinDebounce() {
    if (_lastScanTime == null) return false;
    return DateTime.now().difference(_lastScanTime!) < AppConstants.scanDebounce;
  }
}
