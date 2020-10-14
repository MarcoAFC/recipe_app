import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: ValueKey("SearchBar"),
      height: MediaQuery.of(context).size.height*0.15,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], 
            border: Border.all(color:  Colors.grey[800]),
            borderRadius: BorderRadius.circular(15)  
          ),
          constraints: BoxConstraints(
            minHeight: 40
          ),
          height: MediaQuery.of(context).size.height*0.058,
          width: MediaQuery.of(context).size.width*0.8,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.black54),
              prefixIcon: Icon(Icons.search, size: 20.0, color: Colors.black87,),
              focusedBorder: InputBorder.none
            ),
          )
        ),
      ),
    );
  }
}