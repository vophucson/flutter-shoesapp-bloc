part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  const CategorySuccess({required this.categories});
  @override
  List<Object> get props => [categories];
  CategorySuccess copyWith({List<CategoryModel>? categories}) {
    return CategorySuccess(categories: categories ?? this.categories);
  }
}

class CategoryFailure extends CategoryState {}
