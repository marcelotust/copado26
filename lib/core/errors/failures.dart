sealed class Failure {
  const Failure(this.message);
  final String message;
}

final class InvalidCodeFailure extends Failure {
  const InvalidCodeFailure() : super('Código inválido. Formato esperado: "MAR 4"');
}

final class UnknownStickerFailure extends Failure {
  const UnknownStickerFailure(String id) : super('Figurinha "$id" não encontrada no álbum.');
}

final class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}

final class PermissionFailure extends Failure {
  const PermissionFailure() : super('Permissão de câmera negada.');
}
