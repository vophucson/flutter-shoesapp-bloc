part of 'banner_bloc.dart';

@immutable
abstract class BannerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BannerFetched extends BannerEvent {}
