import 'package:dio/dio.dart';
import 'package:shoesappbloc/Models/category_model.dart';
import 'package:shoesappbloc/config_api.dart';
import 'package:shoesappbloc/Models/banner_model.dart';
import 'package:shoesappbloc/models/product_model.dart';

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

  Future<List<CategoryModel>> getCategory() async {
    final response =
        await httpClient.get(Config.url + Config.category + Config.allCategory);
    final data = <CategoryModel>[];
    for (var json in response.data['data']) {
      data.add(CategoryModel.fromJson(json));
    }
    return data;
  }

  Future<List<ProductModel>> getAllProduct() async {
    final response =
        await httpClient.get(Config.url + Config.product + Config.allProduct);
    final data = <ProductModel>[];
    for (var json in response.data['data']) {
      data.add(ProductModel.fromJson(json));
    }
    return data;
  }

  Future<List<ProductModel>> getProductById(int categoryId) async {
    final response = await httpClient.get(Config.url +
        Config.product +
        Config.productByCategoryId +
        categoryId.toString());
    final data = <ProductModel>[];
    for (var json in response.data['data']) {
      data.add(ProductModel.fromJson(json));
    }
    return data;
  }
}
