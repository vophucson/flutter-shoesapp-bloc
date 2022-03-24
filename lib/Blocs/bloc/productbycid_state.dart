part of 'productbycid_bloc.dart';

abstract class ProductbycidState extends Equatable {
  const ProductbycidState();

  @override
  List<Object> get props => [];
}

class ProductbycidInitial extends ProductbycidState {}

class ProductbycidLoading extends ProductbycidState {}

class ProductbycidSuccess extends ProductbycidState {
  final List<ProductModel> products;

  const ProductbycidSuccess({required this.products});
  @override
  List<Object> get props => [products];
}

class ProductbycidFailure extends ProductbycidState {}
