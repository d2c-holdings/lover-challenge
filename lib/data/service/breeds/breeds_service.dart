import 'package:get/get.dart';
import 'package:lover_challenge/data/model/breed/breed.dart';
import 'package:lover_challenge/data/model/breed/breed_model.dart';
import 'package:lover_challenge/data/provider/breeds_provider.dart';
import 'package:lover_challenge/data/service/breeds/breeds_service_contract.dart';

class BreedsService extends GetxService implements BreedsServiceContract {
  var isLoading = false;
  final _loaded = false.obs;
  final _breedModelCache = List<BreedModel>.empty().obs;
  BreedsProvider get _provider => Get.find();

  @override
  RxList<Breed> get breeds =>
      _breedModelCache.map((element) => Breed(element)).toList().obs;

  @override
  RxBool get loaded => _loaded;

  BreedsService() {
    Get.lazyPut(() => BreedsProvider());
  }

  @override
  void deleteBreed(Breed breed) {
    _breedModelCache.removeWhere((element) => element.id == breed.id);
  }

  @override
  Future fetchBreeds() async {
    if (_loaded.value || isLoading) {
      return;
    }

    isLoading = true;

    try {
      final response = await _provider.getBreeds();

      if (response != null) {
        _breedModelCache.addAll(response);
        _loaded.value = true;
      }

      isLoading = false;
    } on Exception catch (_) {
      isLoading = false;
      return;
    }
  }
}
