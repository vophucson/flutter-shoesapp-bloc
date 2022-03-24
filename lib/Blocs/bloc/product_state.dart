part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  const ProductSuccess({
    required this.products,
  });
  @override
  List<Object> get props => [products];
}

class ProductFailure extends ProductState {}
