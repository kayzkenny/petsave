import 'package:petfinder_api/petfinder_api.dart';
import 'package:domain_models/domain_models.dart';

extension AnimalListPageRMToDomain on AnimalListPageRM {
  AnimalListPage toDomainModel() {
    return AnimalListPage(
      pagination: pagination.toDomainModel(),
      animalList: animalList.map((e) => e.toDomainModel()).toList(),
    );
  }
}

extension OrganizationListPageRMToDomain on OrganizationListPageRM {
  OrganizationListPage toDomainModel() {
    return OrganizationListPage(
      pagination: pagination.toDomainModel(),
      organizationList: organizationList.map((e) => e.toDomainModel()).toList(),
    );
  }
}

extension PaginationRMToDomain on PaginationRM {
  Pagination toDomainModel() {
    return Pagination(
      countPerPage: countPerPage!,
      totalCount: totalCount!,
      currentPage: currentPage!,
      totalPages: totalPages!,
    );
  }
}

extension AnimalRMToDomain on AnimalRM {
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
    );
  }
}

extension BreedsRMToDomain on BreedsRM {
  Breeds toDomainModel() {
    return Breeds(
      primary: primary,
      secondary: secondary,
      mixed: mixed,
      unknown: unknown,
    );
  }
}

extension ColorsRMToDomain on ColorsRM {
  AnimalColors toDomainModel() {
    return AnimalColors(
      primary: primary,
      secondary: secondary,
      tertiary: tertiary,
    );
  }
}

extension VideosRMToDomain on VideosRM {
  Videos toDomainModel() {
    return Videos(
      embed: embed,
    );
  }
}

extension AttributesRMToDomain on AttributesRM {
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

extension EnvironmentRMToDomain on EnvironmentRM {
  Environment toDomainModel() {
    return Environment(
      children: children,
      dogs: dogs,
      cats: cats,
    );
  }
}

extension OrganizationRMToDomain on OrganizationRM {
  Organization toDomainModel() {
    return Organization(
      id: id!,
      name: name,
      url: url,
      email: email,
      phone: phone,
      address: address?.toDomainModel(),
      missionStatement: missionStatement,
      photos: photos?.map((e) => e.toDomainModel()).toList(),
    );
  }
}

extension AddressRMToDomain on AddressRM {
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

extension PhotosRMToDomain on PhotosRM {
  Photos toDomainModel() {
    return Photos(
      small: small,
      medium: medium,
      large: large,
      full: full,
    );
  }
}
