import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesappbloc/models/product_model.dart';
import 'package:shoesappbloc/repositories/shoes_repository.dart';

part 'productbycid_event.dart';
part 'productbycid_state.dart';

class ProductbycidBloc extends Bloc<ProductbycidEvent, ProductbycidState> {
  ProductbycidBloc() : super(ProductbycidInitial()) {
    on<ProductbycidFetched>((event, emit) async {
      emit(ProductbycidLoading());
      try {
        final dio = Dio();
        var data = await ShoesRepository(httpClient: dio)
            .getProductById(event.categoryId);
        emit(ProductbycidSuccess(products: data));
      } catch (e) {
        emit(ProductbycidFailure());
      }
    });
  }
}
