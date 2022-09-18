import 'package:get/get.dart';
import 'package:lover_challenge/data/model/analytics/events/breed_removed_event.dart';
import 'package:lover_challenge/data/model/analytics/events/fetched_breeds_event.dart';
import 'package:lover_challenge/data/model/analytics/properties/empty_list_property.dart';
import 'package:lover_challenge/data/model/breed/breed.dart';
import 'package:lover_challenge/data/service/analytics/analytics_service_contract.dart';
import 'package:lover_challenge/data/service/breeds/breeds_service_contract.dart';

class CatsPageController extends GetxController {
  final BreedsServiceContract service = Get.find<BreedsServiceContract>();
  final AnalyticsServiceContract analyticsService =
      Get.find<AnalyticsServiceContract>();

  bool get loading => service.loaded.isFalse;
  List<Breed> get breeds => service.breeds;

  CatsPageController() {
    setEmptyListUserProp();
    sendFetchedBreedsEvent();
  }

  void setEmptyListUserProp() {
    var prop = EmptyListProp(isEmpty: breeds.isEmpty);
    analyticsService.setPeopleProperty(prop);
  }

  void sendFetchedBreedsEvent() {
    var event = FetchedBreedsEvent(fetchedCount: breeds.length);
    analyticsService.trackEvent(event);
  }

  Future fetchBreeds() async {
    if (service.loaded.isFalse) {
      await service.fetchBreeds();
      setEmptyListUserProp();
      sendFetchedBreedsEvent();
    }
  }

  void deleteBreed(Breed breed) {
    service.deleteBreed(breed);
    var event = BreedRemovedEvent(breedId: breed.id);
    analyticsService.trackEvent(event);
  }
}
