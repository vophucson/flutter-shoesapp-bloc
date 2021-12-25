import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  const CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        categoryImage: json['categoryImage']);
  }
  @override
  List<Object?> get props => [categoryId, categoryName, categoryImage];
}
