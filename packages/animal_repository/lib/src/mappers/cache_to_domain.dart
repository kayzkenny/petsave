import 'package:domain_models/domain_models.dart';
import 'package:local_storage/local_storage.dart';

extension AnimalTypeCMToDomain on AnimalTypeCM {
  AnimalTypes toDomainModel() {
    return AnimalTypes(
      name: name,
      coats: coats,
      colors: colors,
      genders: genders,
    );
  }
}

extension AnimalCMToDomain on AnimalCM {
  Animal toDomainModel() {
    return Animal(
      id: id,
      organizationId: organizationId,
      url: url,
      type: type,
      species: species,
      breeds: breeds?.toDomainModel(),
      colors: colors?.toDomainModel(),
      age: age,
      gender: gender,
      size: size,
      coat: coat,
      name: name,
      description: description,
      photos: photos?.map((e) => e.toDomainModel()).toList(),
      videos: videos?.map((e) => e.toDomainModel()).toList(),
      status: status,
      attributes: attributes?.toDomainModel(),
      environment: environment?.toDomainModel(),
      tags: tags,
      publishedAt: publishedAt,
      distance: distance,
      contact: contact?.toDomainModel(),
    );
  }
}

extension BreedsCMToDomain on BreedsCM {
  Breeds toDomainModel() {
    return Breeds(
      primary: primary,
      secondary: secondary,
      mixed: mixed,
      unknown: unknown,
    );
  }
}

extension ColorsCMToDomain on ColorsCM {
  AnimalColors toDomainModel() {
    return AnimalColors(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
    );
  }
}

extension PhotoCMToDomain on PhotosCM {
  Photos toDomainModel() {
    return Photos(
      small: small,
      medium: medium,
      large: large,
      full: full,
    );
  }
}

extension VideosCMToDomain on VideosCM {
  Videos toDomainModel() {
    return Videos(
      embed: embed,
    );
  }
}

extension AttributeCMToDomain on AttributesCM {
  Attributes toDomainModel() {
    return Attributes(
      spayedNeutered: spayedNeutered,
      houseTrained: houseTrained,
      declawed: declawed,
      specialNeeds: specialNeeds,
      shotsCurrent: shotsCurrent,
    );
  }
}

extension EnvironmentCMToDomain on EnvironmentCM {
  Environment toDomainModel() {
    return Environment(
      children: children,
      dogs: dogs,
      cats: cats,
    );
  }
}

extension OrganizationCMToDomain on OrganizationCM {
  Organization toDomainModel() {
    return Organization(
      id: id.toString(),
      name: name,
      email: email,
      phone: phone,
      address: address?.toDomainModel(),
      url: url,
      photos: photos?.map((e) => e.toDomainModel()).toList(),
      website: website,
    );
  }
}

extension AddressCMToDomain on AddressCM {
  Address toDomainModel() {
    return Address(
      address1: address1,
      address2: address2,
      city: city,
      state: state,
      postcode: postcode,
      country: country,
    );
  }
}

extension ContactCMToDomain on ContactCM {
  Contact toDomainModel() {
    return Contact(
      email: email,
      phone: phone,
      address: address?.toDomainModel(),
    );
  }
}
