import 'package:dio/dio.dart';
import 'package:mvc_recipe/src/Models/networking/providers/region/interface_region_provider.dart';
import 'package:mvc_recipe/src/Models/region/region_list.dart';

class RegionProvider implements IRegionProvider{
  Dio dio;

  RegionProvider({String apiKey = "1"}){
    dio = Dio(BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/$apiKey",
    ));
  }

  @override
  Future<RegionList> getAllRegions() async {
    var response = await dio.get("/list.php?a=list");
    if(response.statusCode != 200){
      throw Exception("Request error: ${response.statusCode} - ${response.statusMessage}");
    }
    return RegionList.fromJson(response.data);
  }

}