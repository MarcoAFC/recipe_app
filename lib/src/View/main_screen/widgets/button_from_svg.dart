
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonFromSvg extends StatelessWidget {
  final GestureTapCallback onTap;
  final String svgPath;
  final double iconSize;
  final double splashSize;
  final Key key;
  final String label;
  ButtonFromSvg({@required this.onTap, @required this.svgPath, this.iconSize = 50, this.splashSize = 75, this.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label?? "",
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        constraints: BoxConstraints.tight(Size(splashSize, splashSize)),
        child: InkWell(
          customBorder: CircleBorder(),
          child: Center(
            child: SvgPicture.asset(
              svgPath, 
              height: iconSize, 
              width: iconSize,
            ),  
          ),
          onTap: onTap,
        )
      ),
    );
  }
}