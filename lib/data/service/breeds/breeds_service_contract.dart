import 'package:get/get.dart';
import 'package:lover_challenge/data/model/breed/breed.dart';

abstract class BreedsServiceContract {
  RxList<Breed> get breeds => throw UnimplementedError();
  RxBool get loaded => throw UnimplementedError();

  void deleteBreed(Breed breed) {
    throw UnimplementedError();
  }

  Future fetchBreeds() async {
    throw UnimplementedError();
  }
}
