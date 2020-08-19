import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym/Screens/auth/signup/user_info.dart';
import 'package:gym/Screens/home/home_page.dart';
import 'package:gym/Screens/home/myaccount.dart';
import 'package:gym/Screens/nutrition/Diet.dart';

import 'package:gym/Screens/traning/traning.dart';
import 'package:gym/store/appstore.dart';
import 'package:provider/provider.dart';

class HomeTabs extends StatefulWidget {
  HomeTabs({Key key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    // listScreens = [HomePage(), TraningPage(), Nutrition(), Myaccount()];
  }

  int currentPage = 0;
  final List<Widget> _pages = [
    HomePage(),
    TraningPage(),
    Diet (),
    ProfileOnePage()
  ];

  @override
  Widget build(BuildContext context) {
        final store = Provider.of<AppStore>(context);

    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 60,
        circleSize: 35,
        initialSelection: currentPage,
        inactiveIconColor: Colors.grey,
        textColor: Colors.black,
        hasElevationShadows: false,
        tabs: [
          TabData(
            icon: FontAwesomeIcons.home,
            iconSize: 25,
            title: 'Home',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: FontAwesomeIcons.fire,
            iconSize: 25,
            title: 'Traning',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: FontAwesomeIcons.nutritionix,
            iconSize: 25,
            title: 'Nutrition',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: FontAwesomeIcons.personBooth,
            iconSize: 25,
            title: 'Account',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
