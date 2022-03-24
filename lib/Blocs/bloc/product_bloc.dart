import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesappbloc/models/product_model.dart';
import 'package:shoesappbloc/repositories/shoes_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductFetched>((event, emit) async {
      emit(ProductLoading());
      try {
        final dio = Dio();
        final data = await ShoesRepository(httpClient: dio).getAllProduct();
        emit(ProductSuccess(products: data));
      } catch (_) {
        emit(ProductFailure());
      }
    });
    on<ProductRefresh>((event, emit) async {
      try {
        final dio = Dio();
        final data = await ShoesRepository(httpClient: dio).getAllProduct();
        emit(ProductSuccess(products: data));
      } catch (e) {
        emit(ProductFailure());
      }
    });
  }
}
