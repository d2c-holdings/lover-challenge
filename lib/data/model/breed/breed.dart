import 'package:lover_challenge/data/model/breed/breed_model.dart';

class Breed {
  late final String id;
  late final String name;
  late final String description;
  late final String? imageUrl;
  late final String temperament;

  Breed(BreedModel model) {
    id = model.id ?? "";
    name = model.name ?? "";
    imageUrl = model.image?.url;
    description = model.description ?? "";
    temperament = model.temperament ?? "";
  }
}
