import 'package:copado26/domain/entities/sticker.dart';

/// Plain Dart model stored as Map in Hive.
/// Key in the Hive box = [canonicalId], e.g. "MAR_4".
class StickerModel {
  const StickerModel({
    required this.canonicalId,
    required this.stickerSection,
    required this.stickerNumber,
    required this.quantity,
    required this.isSpecial,
  });

  factory StickerModel.fromMap(String id, Map<dynamic, dynamic> map) =>
      StickerModel(
        canonicalId: id,
        stickerSection: map['section'] as String,
        stickerNumber: map['number'] as int,
        quantity: map['quantity'] as int,
        isSpecial: map['isSpecial'] as bool,
      );

  factory StickerModel.fromEntity(Sticker entity) => StickerModel(
        canonicalId: entity.id,
        stickerSection: entity.section,
        stickerNumber: entity.number,
        quantity: entity.quantity,
        isSpecial: entity.isSpecial,
      );

  final String canonicalId;
  final String stickerSection;
  final int stickerNumber;
  final int quantity;
  final bool isSpecial;

  Map<String, dynamic> toMap() => {
        'section': stickerSection,
        'number': stickerNumber,
        'quantity': quantity,
        'isSpecial': isSpecial,
      };

  StickerModel copyWith({int? quantity}) => StickerModel(
        canonicalId: canonicalId,
        stickerSection: stickerSection,
        stickerNumber: stickerNumber,
        quantity: quantity ?? this.quantity,
        isSpecial: isSpecial,
      );

  Sticker toEntity() => Sticker(
        id: canonicalId,
        section: stickerSection,
        number: stickerNumber,
        quantity: quantity,
        isSpecial: isSpecial,
      );
}
