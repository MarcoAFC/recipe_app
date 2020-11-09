class RegionModel{
  final String area;

  RegionModel(this.area);

  factory RegionModel.fromJson(Map<String, dynamic> json){
    return RegionModel(json["strArea"]);
  }
}