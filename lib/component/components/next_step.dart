import 'package:flutter/material.dart';

class NextStep extends StatelessWidget {
  final String image, title;
  final int seconds;
  final Color titleColor;
  final Color subTitleColor;

  NextStep({
    @required this.image,
    @required this.title,
    @required this.seconds,
    this.titleColor,
    this.subTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _settingModalBottomSheet(context);
      },
      child: Row(
        children: <Widget>[
          Container(
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.only(
              right: 20.0,
              bottom: 20.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  this.image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 65.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: subTitleColor,
                  ),
                ),
                Text(
                  '${this.seconds} sec',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: subTitleColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
