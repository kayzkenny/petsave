import 'package:json_annotation/json_annotation.dart';

part 'attributes_rm.g.dart';

@JsonSerializable(createToJson: false)
class AttributesRM {
  AttributesRM({
    required this.spayedNeutered,
    required this.houseTrained,
    required this.declawed,
    required this.specialNeeds,
    required this.shotsCurrent,
  });

  @JsonKey(name: 'spayed_neutered')
  final bool? spayedNeutered;
  @JsonKey(name: 'house_trained')
  final bool? houseTrained;
  final bool? declawed;
  @JsonKey(name: 'special_needs')
  final bool? specialNeeds;
  @JsonKey(name: 'shots_current')
  final bool? shotsCurrent;

  static const fromJson = _$AttributesRMFromJson;
}
