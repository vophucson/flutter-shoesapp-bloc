import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int productId;
  final String productName;
  final String categoryName;
  final String description;
  final int productPrice;
  final String imageUrl;

  const ProductModel(
      {required this.productId,
      required this.productName,
      required this.categoryName,
      required this.description,
      required this.productPrice,
      required this.imageUrl});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productId: json['productId'],
        productName: json['productName'],
        categoryName: json['categoryName'],
        description: json['description'],
        productPrice: json['productPrice'],
        imageUrl: json['imageUrl']);
  }
  @override
  List<Object?> get props => [
        productId,
        productName,
        categoryName,
        description,
        productPrice,
        imageUrl
      ];
}
