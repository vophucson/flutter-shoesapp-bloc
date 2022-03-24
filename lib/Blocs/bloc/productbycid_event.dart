part of 'productbycid_bloc.dart';

abstract class ProductbycidEvent extends Equatable {
  const ProductbycidEvent();

  @override
  List<Object> get props => [];
}

class ProductbycidFetched extends ProductbycidEvent {
  final int categoryId;
  const ProductbycidFetched({required this.categoryId});
  @override
  List<Object> get props => [categoryId];
}
