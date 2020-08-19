import 'package:flutter/material.dart';
import 'package:gym/Screens/home/home_tabs.dart';

class SelectGoal extends StatefulWidget {
  @override
  _SelectGoalState createState() => _SelectGoalState();
}

class _SelectGoalState extends State<SelectGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset("assets/img/welcome.png")),
          Center(
              child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Divider(
              height: 1,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "Determine your goal you want to achieve",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 3,
          //     itemBuilder: (BuildContext context, int index) {
          //       return;
          //     },
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("assets/img/1.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text('improvement'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  isThreeLine: true,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeTabs()));
            },
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("assets/img/2.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text('Bodybuilding'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  isThreeLine: true,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeTabs()));
            },
          ),
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage("assets/img/3.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text('fitness'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  isThreeLine: true,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeTabs()));
            },
          )
        ],
      ),
    );
  }
}
