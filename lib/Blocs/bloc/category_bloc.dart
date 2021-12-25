import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesappbloc/Models/category_model.dart';
import 'package:shoesappbloc/Repositories/shoes_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryFetched>((event, emit) async {
      emit(CategoryLoading());
      try {
        final dio = Dio();
        final data = await ShoesRepository(httpClient: dio)
            .getCategory()
            .timeout(const Duration(seconds: 10), onTimeout: () {
          throw Exception('Timeout');
        });
        emit(CategorySuccess(categories: data));
      } catch (_) {
        emit(CategoryFailure());
      }
    });
  }
}
