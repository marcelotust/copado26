/// Conditional export: web → manual entry stub; native → camera scanner.
export 'scanner_stub.dart' if (dart.library.io) 'scanner_screen.dart';
