import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shoesappbloc/Models/banner_model.dart';
import 'package:shoesappbloc/Repositories/shoes_repository.dart';
part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    on<BannerFetched>((event, emit) async {
      emit(BannerLoading());
      try {
        final dio = Dio();
        ShoesRepository shoesRepository = ShoesRepository(httpClient: dio);
        var data = await shoesRepository.getBanner();
        emit(BannerSuccess(data: data));
      } catch (e) {
        emit(BannerFailure());
      }
    });
  }
}
