import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:gym/Screens/auth/signup/height_page.dart';
import 'package:gym/Screens/auth/signup/input_page.dart/card_title.dart';
import 'package:gym/Screens/auth/signup/input_page.dart/input_page.dart.dart';
import 'package:gym/Screens/auth/signup/input_page.dart/weight/weight_card.dart';

import 'package:gym/component/const.dart';
import 'package:gym/component/round_icon_button.dart';

import 'package:gym/utils/widget_utils.dart';

class PinPage extends StatefulWidget {
  static const routName = '/pin-page';
  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  TextEditingController pinController = TextEditingController();

  int weight = 70;
  int age = 22;
  Gender value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("data"),
      // ),
      body: Column(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Select',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    '2/3',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: _buildCards(context)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  text: 'NEXT',
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Height(
                            weight: weight,
                            age: age,
                            gender: value,
                          ),
                        ));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              left: screenAwareSize(16.0, context),
              right: screenAwareSize(4.0, context),
              top: screenAwareSize(4.0, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CardTitle(
                  "Gender",
                ),
                Center(
                  child: GenderSelection(
                    femaleImage: AssetImage("assets/img/female.jpg"),
                    maleImage: AssetImage("assets/img/male.jpg"),
                    selectedGenderIconBackgroundColor: Colors.amber,
                    selectedGenderTextStyle: TextStyle(
                        color: Colors.amber,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                    onChanged: (Gender value) {
                      // setState(() {
                      //   value = gender;
                      // });
                      print(value);
                    },
                    size: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: WeightCard(
            weight: weight,
            onChanged: (val) => setState(() => weight = val),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.only(
              left: screenAwareSize(16.0, context),
              right: screenAwareSize(4.0, context),
              top: screenAwareSize(4.0, context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardTitle(
                  "AGE",
                ),
                Text(
                  age.toString(),
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                    RoundIconButton(
                      icon: FontAwesomeIcons.plus,
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
