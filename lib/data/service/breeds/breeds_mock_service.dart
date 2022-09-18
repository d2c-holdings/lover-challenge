import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lover_challenge/data/model/breed/breed.dart';
import 'package:lover_challenge/data/model/breed/breed_model.dart';
import 'package:lover_challenge/data/service/breeds/breeds_service_contract.dart';

class BreedsMockService extends GetxService implements BreedsServiceContract {
  var _isLoading = false;
  final _loaded = false.obs;
  final _breedModelCache = List<BreedModel>.empty().obs;

  RxList<Breed> get breeds =>
      _breedModelCache.map((element) => Breed(element)).toList().obs;

  RxBool get loaded => _loaded;

  @override
  void deleteBreed(Breed breed) {
    _breedModelCache.removeWhere((element) => element.id == breed.id);
  }

  @override
  Future fetchBreeds() async {
    if (_loaded.value || _isLoading) {
      return;
    }

    _isLoading = true;

    try {
      final String response =
          await rootBundle.loadString('lib/data/mock/breeds.json');
      final List<dynamic> data = await json.decode(response);

      List<BreedModel> list = data.map((e) => BreedModel.fromJson(e)).toList();

      _breedModelCache.addAll(list);

      _loaded.value = true;
      _isLoading = false;
    } on Exception catch (_) {
      _isLoading = false;
      return;
    }
  }
}
