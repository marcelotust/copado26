import 'package:equatable/equatable.dart';

class Sticker extends Equatable {
  const Sticker({
    required this.id,
    required this.section,
    required this.number,
    required this.quantity,
    required this.isSpecial,
  });

  /// Canonical identifier, e.g. "MAR_4".
  final String id;

  /// Team / section abbreviation, e.g. "MAR".
  final String section;

  /// Sticker number within the section.
  final int number;

  /// How many copies the user owns (0 = missing).
  final int quantity;

  /// Shinies / foil stickers.
  final bool isSpecial;

  bool get isOwned => quantity > 0;
  bool get isDuplicate => quantity > 1;

  Sticker copyWith({
    String? id,
    String? section,
    int? number,
    int? quantity,
    bool? isSpecial,
  }) =>
      Sticker(
        id: id ?? this.id,
        section: section ?? this.section,
        number: number ?? this.number,
        quantity: quantity ?? this.quantity,
        isSpecial: isSpecial ?? this.isSpecial,
      );

  @override
  List<Object> get props => [id, section, number, quantity, isSpecial];
}
