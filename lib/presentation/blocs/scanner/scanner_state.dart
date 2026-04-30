part of 'scanner_bloc.dart';

sealed class ScannerState {
  const ScannerState();
}

final class ScannerIdle extends ScannerState {
  const ScannerIdle();
}

final class ScannerReady extends ScannerState {
  const ScannerReady();
}

final class ScannerProcessing extends ScannerState {
  const ScannerProcessing();
}

final class ScannerSuccess extends ScannerState {
  const ScannerSuccess(this.sticker);
  final Sticker sticker;
}

final class ScannerError extends ScannerState {
  const ScannerError(this.failure);
  final Failure failure;
}
