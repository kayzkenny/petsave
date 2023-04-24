import 'package:isar/isar.dart';

part 'animal_cm.g.dart';

@collection
@Name("Animal")
class AnimalCM {
  @Name("id")
  Id? id;
  @Name("organization_id")
  String? organizationId;
  @Name("url")
  String? url;
  @Name("type")
  String? type;
  @Name("species")
  String? species;
  @Name("breeds")
  BreedsCM? breeds;
  @Name("colors")
  ColorsCM? colors;
  @Name("age")
  String? age;
  @Name("gender")
  String? gender;
  @Name("size")
  String? size;
  @Name("coat")
  String? coat;
  @Name("name")
  String? name;
  @Name("description")
  String? description;
  @Name("photos")
  List<PhotosCM>? photos;
  @Name("videos")
  List<VideosCM>? videos;
  @Name("status")
  String? status;
  @Name("attributes")
  AttributesCM? attributes;
  @Name("environment")
  EnvironmentCM? environment;
  @Name("tags")
  List<String>? tags;
  @Name("publishedAt")
  DateTime? publishedAt;
  @Name("distance")
  double? distance;
  @Name("contact")
  ContactCM? contact;
}

@embedded
class BreedsCM {
  String? primary;
  String? secondary;
  bool? mixed;
  bool? unknown;
}

@embedded
class ColorsCM {
  String? primary;
  String? secondary;
  String? tertiary;
}

@embedded
class PhotosCM {
  String? small;
  String? medium;
  String? large;
  String? full;
}

@embedded
class VideosCM {
  String? embed;
}

@embedded
class AttributesCM {
  bool? spayedNeutered;
  bool? houseTrained;
  bool? declawed;
  bool? specialNeeds;
  bool? shotsCurrent;
}

@embedded
class EnvironmentCM {
  bool? children;
  bool? dogs;
  bool? cats;
}

@embedded
class ContactCM {
  String? email;
  String? phone;
  AddressCM? address;
}

@embedded
class AddressCM {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
}
