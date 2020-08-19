import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym/Screens/traning/traning.dart';
import 'package:gym/component/components/Header.dart';
import 'package:gym/component/components/daily_tip.dart';
import 'package:gym/component/components/main_card_programs.dart';
import 'package:gym/component/drawer.dart';
import 'package:gym/component/flat_app_bar.dart';
import 'package:gym/component/side_menu.dart';
import 'package:gym/store/appstore.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double percent = 0.5;
  int _count = 1;
  void _add() {
    setState(() {
      if (_count < 16) {
        _count++;
      } else {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: flatAppBar(
          title: Text(
        "All Day Is Healthy Ahmed",
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey[700]),
      )),
      backgroundColor: Colors.white,
      drawer: LightDrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: MainCardPrograms(
                title: 'For You Day 1',
                time: '30 min',
                image: 'assets/img/image008.jpg',
                textButton: "Start Traning",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return TraningPage();
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.17,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  // margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 8,
                      ),
                      CircularPercentIndicator(
                        radius: 70.0,
                        lineWidth: 9.0,
                        animation: true,
                        percent: percent,
                        center: new Text(
                          "${percent.toString()}%",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        backgroundColor: Colors.grey[300],
                        circularStrokeCap: CircularStrokeCap.round,
                        linearGradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(190, 130, 255, 1.0),
                            Color.fromRGBO(105, 139, 255, 1.0),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Home Julie Gable',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'You completed 25% from the first level',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: 25,
                              child: FlatButton(
                                onPressed: () {},
                                child: Text("Program Details"),
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        color: Colors.white70,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              FontAwesomeIcons.fistRaised,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "good",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                // margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "How many Drink Cup today?",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "You should drink 16 cups of water every day",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          FlatButton.icon(
                            icon: Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                            onPressed: _add,
                            label: Text(
                              "add",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: GridView.count(
                            crossAxisCount: 7,
                            children: List.generate(_count, (index) {
                              return Center(
                                child: Icon(
                                  FontAwesomeIcons.glassWhiskey,
                                  color: Colors.blue,
                                ),
                              );
                            })))
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Topics interest you',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: new ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 7,
                            itemBuilder: (BuildContext context, int) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DailyTip(),
                              );
                            }))
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
