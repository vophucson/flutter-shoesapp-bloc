class BannerModel {
  int? success;
  List<Data>? data;
  BannerModel({this.success,this.data});
  BannerModel.fromJson(Map<String,dynamic> json)
  {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}
class Data {
  int? bannerId;
  String? content;
  String? image;
  Data({this.bannerId,this.content,this.image});
   Data.fromJson(Map<String,dynamic> json) {
     bannerId = json['bannerId'];
     content = json['content'];
     image = json['bannerImage'];
  }
}