import 'package:flutter/material.dart';

class GridListView extends StatelessWidget {
  final List<String> _listViewData = [
    "A List View with many Text - Here's one!",
    "A List View with many Text - Here's another!",
    "A List View with many Text - Here's more!",
    "A List View with many Text - Here's more!",
  ];
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
       
        children: _listViewData
            .map((data) => Card(
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(data),
                  )),
                ))
            .toList(),
      );
    
  }
}