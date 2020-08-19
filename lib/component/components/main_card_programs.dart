import 'package:flutter/material.dart';

class MainCardPrograms extends StatefulWidget {
  final String title;
  final String time;
  final String image;
  final String textButton;
  final Function onPressed;
  const MainCardPrograms({Key key, this.title, this.time, this.image, this.textButton, this.onPressed});

  @override
  _MainCardProgramsState createState() => _MainCardProgramsState();
}

class _MainCardProgramsState extends State<MainCardPrograms> {
  final Map<String, String> cardInfo = {
    'title': 'For You Day 1',
    'time': '30 min',
    'image': 'assets/img/image008.jpg',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              FlatButton(
                onPressed: widget.onPressed,
                child: Text(
                  widget.textButton,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[400].withOpacity(0.95),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
      ),
      width: size.width - 40,
      height: (size.width - 40) / 2,
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 25.0,
            offset: Offset(8.0, 8.0),
          ),
        ],
      ),
    );
  }
}
