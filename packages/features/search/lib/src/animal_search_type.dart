enum AnimalSearchType {
  none(null),
  cat("cat"),
  dog("dog"),
  rabbit("rabbit"),
  smallAndFurry("smallAndFurry"),
  horse("horse"),
  bird("bird"),
  scalesFinsAndOther("scalesFinsAndOther"),
  barnyard("barnyard");

  const AnimalSearchType(this.value);
  final String? value;

  // get card label
  String get label {
    switch (this) {
      case AnimalSearchType.none:
        return "None";
      case AnimalSearchType.cat:
        return "Cat";
      case AnimalSearchType.dog:
        return "Dog";
      case AnimalSearchType.rabbit:
        return "Rabbit";
      case AnimalSearchType.smallAndFurry:
        return "Small & Furry";
      case AnimalSearchType.horse:
        return "Horse";
      case AnimalSearchType.bird:
        return "Bird";
      case AnimalSearchType.scalesFinsAndOther:
        return "Scales, Fins & Other";
      case AnimalSearchType.barnyard:
        return "Barnyard";
    }
  }
}
