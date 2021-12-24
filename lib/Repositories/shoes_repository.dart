import 'package:dio/dio.dart';
import 'package:shoesappbloc/config_api.dart';
import 'package:shoesappbloc/Models/banner_model.dart';

class ShoesRepository {
  final Dio httpClient;

  ShoesRepository({required this.httpClient});
  Future<List<BannerModel>> getBanner() async {
    final response = await httpClient.get(Config.url + Config.banner);
    final data = <BannerModel>[];
    for (var json in response.data['data']) {
      data.add(BannerModel.fromJson(json));
    }
    return data;
  }
}
