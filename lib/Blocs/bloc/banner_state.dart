part of 'banner_bloc.dart';

@immutable
abstract class BannerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final List<BannerModel> data;
  BannerSuccess({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class BannerFailure extends BannerState {}
