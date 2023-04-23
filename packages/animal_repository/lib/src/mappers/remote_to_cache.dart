import 'package:local_storage/local_storage.dart';
import 'package:petfinder_api/petfinder_api.dart';

extension AnimalTypesRMToCM on AnimalTypesRM {
  AnimalTypeCM toCacheModel() {
    return AnimalTypeCM()
      ..name = name
      ..coats = coats.toList()
      ..colors = colors.toList()
      ..genders = genders.toList();
  }
}

extension AnimalRMToCM on AnimalRM {
  AnimalCM toCacheModel() {
    return AnimalCM()
      ..id = id!
      ..organizationId = organizationId
      ..url = url
      ..type = type
      ..species = species
      ..breeds = breeds?.toCacheModel()
      ..colors = colors?.toCacheModel()
      ..age = age
      ..gender = gender
      ..size = size
      ..coat = coat
      ..name = name
      ..description = description
      ..photos = photos?.map((e) => e.toCacheModel()).toList()
      ..videos = videos?.map((e) => e.toCacheModel()).toList()
      ..status = status
      ..attributes = attributes?.toCacheModel()
      ..environment = environment?.toCacheModel()
      ..tags = tags
      ..publishedAt = publishedAt
      ..distance = distance;
  }
}

extension BreedsRMToCM on BreedsRM {
  BreedsCM toCacheModel() {
    return BreedsCM()
      ..primary = primary
      ..secondary = secondary
      ..mixed = mixed
      ..unknown = unknown;
  }
}

extension ColorsRMToCM on ColorsRM {
  ColorsCM toCacheModel() {
    return ColorsCM()
      ..primary = primary
      ..secondary = secondary
      ..tertiary = tertiary;
  }
}

extension VideosRMToCM on VideosRM {
  VideosCM toCacheModel() {
    return VideosCM()..embed = embed;
  }
}

extension AttributesRMToCM on AttributesRM {
  AttributesCM toCacheModel() {
    return AttributesCM()
      ..spayedNeutered = spayedNeutered
      ..houseTrained = houseTrained
      ..declawed = declawed
      ..specialNeeds = specialNeeds
      ..shotsCurrent = shotsCurrent;
  }
}

extension EnvironmentRMToCM on EnvironmentRM {
  EnvironmentCM toCacheModel() {
    return EnvironmentCM()
      ..children = children
      ..dogs = dogs
      ..cats = cats;
  }
}

extension OrganizationRMToCM on OrganizationRM {
  OrganizationCM toCacheModel() {
    return OrganizationCM()
      ..id = int.tryParse(id!)
      ..name = name
      ..email = email
      ..phone = phone
      ..address = address?.toCacheModel()
      ..url = url
      ..missionStatement = missionStatement
      ..website = website
      ..distance = distance
      ..photos = photos?.map((e) => e.toCacheModel()).toList();
  }
}

extension AddressRMToCM on AddressRM {
  AddressCM toCacheModel() {
    return AddressCM()
      ..address1 = address1
      ..address2 = address2
      ..city = city
      ..state = state
      ..postcode = postcode
      ..country = country;
  }
}

extension PhotosRMToCM on PhotosRM {
  PhotosCM toCacheModel() {
    return PhotosCM()
      ..small = small
      ..medium = medium
      ..large = large
      ..full = full;
  }
}
