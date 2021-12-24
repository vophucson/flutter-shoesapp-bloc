import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final int bannerId;
  final String content;
  final String image;
  const BannerModel(
      {required this.bannerId, required this.content, required this.image});
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        bannerId: json['bannerId'],
        content: json['content'],
        image: json['bannerImage']);
  }
  @override
  List<Object?> get props => [bannerId, content, image];
}
