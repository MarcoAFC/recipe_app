import 'package:mvc_recipe/src/Models/region/region_model.dart';

class RegionList{
  final List<RegionModel> regions;

  RegionList(this.regions);

  factory RegionList.fromJson(Map<String, dynamic> json){
    List<RegionModel> regions = List();

    json['meals'].forEach((area){
      regions.add(RegionModel.fromJson(area));
    });
    return RegionList(regions);
  }
}