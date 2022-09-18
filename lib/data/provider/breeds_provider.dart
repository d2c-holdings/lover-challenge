import 'package:get/get.dart';

import '../model/breed/breed_model.dart';

class BreedsProvider extends GetConnect {
  final String baseApiUrl;

  BreedsProvider({this.baseApiUrl = 'https://api.thecatapi.com/v1/'});

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      final List<dynamic> data = map;
      List<BreedModel> list = data.map((e) => BreedModel.fromJson(e)).toList();

      return list;
    };
    httpClient.baseUrl = baseApiUrl;
  }

  Future<List<BreedModel>?> getBreeds() async {
    final response = await get(
      'breeds',
      headers: {"x-api-key": "c344c695-60f6-4665-86a9-3d9f88c0445b"},
    );

    return response.body;
  }
}
