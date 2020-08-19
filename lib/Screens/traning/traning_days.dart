import 'package:flutter/material.dart';
import 'package:gym/Screens/traning/pages/activity_timer.dart';
import 'package:gym/component/components/next_step.dart';

class TraningDays extends StatefulWidget {
  final int selectedDate;
  final String weekNumber;
  const TraningDays({Key key, this.selectedDate, this.weekNumber})
      : super(key: key); // this is immutable

  @override
  _TraningDaysState createState() => _TraningDaysState();
}

class _TraningDaysState extends State<TraningDays> {
  final bool selected = false;

  int selectedDay; // this is mutable

  @override
  void initState() {
    selectedDay = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.weekNumber,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              letterSpacing: 2.0),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: HeaderWidget(
        header: Container(
          width: MediaQuery.of(context).size.width * 0.99,
          height: MediaQuery.of(context).size.height * 0.14,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              index = index + 1;

              return DayWidget(
                day: index,
                dayName: "Day",
                selected: selectedDay == index ? true : false,
                callback: (int day) {
                  selectedDay = day;
                  setState(() {});
                  print(selectedDay);
                },
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTaskWithDate(),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(100, 140, 255, 1.0),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(100, 140, 255, 0.5),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                ),
              ]),
          child: Text(
            'Start',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return ActivityTimer();
            }),
          );
        },
      ),
    );
  }

  Column _buildTaskWithDate() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Heating",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(231, 241, 255, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 55.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey[600]),
                              ),
                              Text(
                                '5 min',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 45.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Intensity',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.blueGrey[400],
                                ),
                              ),
                              Text(
                                "Difficult",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: <Widget>[
                        NextStep(
                          image: 'assets/img/image005.jpg',
                          title: 'Plank',
                          seconds: 50,
                          titleColor: Colors.white,
                          subTitleColor: Colors.white,
                        ),
                        NextStep(
                          image: 'assets/img/image006.jpg',
                          title: 'Push-ups',
                          seconds: 50,
                          titleColor: Colors.white,
                          subTitleColor: Colors.white,
                        ),
                        NextStep(
                          image: 'assets/img/image007.jpg',
                          title: 'Lateral Raise',
                          seconds: 50,
                          titleColor: Colors.white,
                          subTitleColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final Widget body;
  final Widget header;
  final Color headerColor;
  final Color backColor;

  const HeaderWidget(
      {Key key,
      this.body,
      this.header,
      this.headerColor = Colors.white,
      this.backColor = Colors.deepPurple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Stack _buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          width: 10,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: backColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20.0))),
          ),
        ),
        Positioned(
          right: 0,
          top: 100,
          width: 50,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backColor,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            (header != null)
                ? Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20.0)),
                      color: headerColor,
                    ),
                    child: header)
                : Container(),
            (body != null)
                ? Expanded(
                    child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0))),
                        elevation: 0,
                        color: backColor,
                        child: body),
                  )
                : Expanded(child: Material())
          ],
        ),
      ],
    );
  }
}

class DayWidget extends StatelessWidget {
  final int day;
  final String dayName;
  final bool selected;
  final Function(int) callback;
  DayWidget({
    this.day,
    this.dayName,
    this.selected = false,
    this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: 0,
        elevation: 0,
        highlightElevation: 0,
        textColor: Colors.pink,
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        color: selected ? Colors.white : Colors.transparent,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15.0),
          side: BorderSide(
              color: selected ? Colors.red : Colors.white,
              width: 1,
              style: BorderStyle.solid),
        ),
        onPressed: () {
          callback(day);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              dayName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: selected ? Colors.red : Colors.black),
            ),
            const SizedBox(height: 5.0),
            Text(
              day.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: selected ? Colors.red : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
