import 'package:flutter/material.dart';
import 'package:gym/Screens/traning/pages/activity_detail.dart';
import 'package:gym/Screens/traning/traning_days.dart';
import 'package:gym/component/components/Header.dart';
import 'package:gym/component/components/image_card_with_basic_footer.dart';
import 'package:gym/component/components/main_card_programs.dart';
import 'package:gym/component/drawer.dart';

class TraningPage extends StatefulWidget {
  @override
  _TraningPageState createState() => _TraningPageState();
}

class _TraningPageState extends State<TraningPage> {
  String weekNumber = "WEEK 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LightDrawerPage(),
      // appBar: flatAppBar(
      //   title: Header(
      //     'Training',
      //     rightSide: IconButton(
      //       icon: Icon(Icons.info),
      //       onPressed: () {},
      //     ),
      //   ),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                centerTitle: true,
                expandedHeight: 150.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Training'),
                  background:
                      Image.asset("assets/img/image001.jpg", fit: BoxFit.cover),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.info),
                    tooltip: 'Info',
                    onPressed: () {},
                  ),
                ]),
          ];
        },
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      child: MainCardPrograms(
                        title: weekNumber,
                        time: '60 min',
                        image: 'assets/img/image003.jpg',
                        textButton: "",
                        onPressed: null,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return TraningDays(
                                weekNumber: weekNumber,
                                selectedDate: 1,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
