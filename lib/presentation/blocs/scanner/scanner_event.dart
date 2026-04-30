part of 'scanner_bloc.dart';

sealed class ScannerEvent {
  const ScannerEvent();
}

final class ScannerStarted extends ScannerEvent {
  const ScannerStarted();
}

final class ScannerStopped extends ScannerEvent {
  const ScannerStopped();
}

final class ScannerCodeDetected extends ScannerEvent {
  const ScannerCodeDetected(this.rawCode);
  final String rawCode;
}
