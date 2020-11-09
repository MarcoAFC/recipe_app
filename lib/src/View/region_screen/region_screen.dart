import 'package:flutter/material.dart';
import 'package:mvc_recipe/src/Models/networking/providers/region/region_provider.dart';
import 'package:mvc_recipe/src/Models/region/region_list.dart';
import 'package:mvc_recipe/src/View/region_results/region_results.dart';
import 'package:mvc_recipe/src/View/region_screen/region_card.dart';
import 'package:mvc_recipe/src/utils/string_utils.dart';

class RegionScreen extends StatefulWidget {
  RegionScreen({Key key}) : super(key: key);

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  final RegionProvider provider = RegionProvider();
  Future<RegionList> regions;
  @override
  void initState() {
    regions = provider.getAllRegions();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(StringUtil.REGION_APPBAR_TITLE),
            centerTitle: true, 
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) {
                return FutureBuilder<RegionList>(
                  future: regions,
                  builder: (_, snapshot){
                    if(snapshot.hasData){
                      var children = List.generate(
                        ((snapshot.data.regions.length)/2).ceil(),
                        (index) {
                          return Row(
                            children: [
                              RegionCard(region: snapshot.data.regions[index*2],
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => 
                                      RegionResultScreen(region: snapshot.data.regions[index*2],))
                                  );
                                },
                                reverse: true,
                              ),
                              if(index*2+1 < snapshot.data.regions.length) RegionCard(region: snapshot.data.regions[index*2+1],
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => 
                                      RegionResultScreen(region: snapshot.data.regions[index*2+1],))
                                  );
                                },
                              ),
                            ],
                          );
                        });
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end ,
                        children: children,
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  });
              },
              childCount: 1
            )
          )
        ]
      )
    );
  }
}