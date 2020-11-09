import 'package:mvc_recipe/src/Models/region/region_list.dart';

abstract class IRegionProvider{
  Future<RegionList> getAllRegions();
}