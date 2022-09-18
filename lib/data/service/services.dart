import 'package:get/get.dart';
import 'package:lover_challenge/data/service/analytics/analytics_service.dart';
import 'package:lover_challenge/data/service/analytics/analytics_service_contract.dart';
import 'package:lover_challenge/data/service/breeds/breeds_service.dart';
import 'package:lover_challenge/data/service/breeds/breeds_service_contract.dart';

abstract class Services {
  static Future initServices() async {
    Get.put<BreedsServiceContract>(BreedsService());
    Get.put<AnalyticsServiceContract>(await AnalyticsService.create());
  }
}
