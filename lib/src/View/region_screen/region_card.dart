import 'package:flutter/material.dart';

import 'package:mvc_recipe/src/Models/region/region_model.dart';

class RegionCard extends StatelessWidget {
  final RegionModel region;
  final GestureTapCallback onTap;
  final bool reverse;
  const RegionCard({
    Key key,
    @required this.region,
    this.onTap,
    this.reverse = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 40, maxWidth: MediaQuery.of(context).size.width*0.5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: reverse? 
          [
            Theme.of(context).accentColor,
            Theme.of(context).accentColor.withAlpha(100),
          ] :
          [
            Theme.of(context).accentColor.withAlpha(100),
            Theme.of(context).accentColor
          ]
        ),
        border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid, color: Colors.black54)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 15.0),
        title: Text("${region.area}", textAlign: TextAlign.center,),
        onTap:  onTap,
      ));
  }
}
