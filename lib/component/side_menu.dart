import 'package:flutter/material.dart';
import 'package:gym/component/language_dialoge.dart';
import 'package:gym/component/log_out_dialog.dart';
import 'package:gym/store/appstore.dart';

import 'package:provider/provider.dart';
// import 'package:saco/component/change_language_dialog/change_language.dart';
// import 'package:saco/component/change_language_dialog/language_dialog.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  get onSubmit => null;

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<AppStore>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              "Name",
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: Text(
              "",
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              backgroundImage: AssetImage("assets/img/3.png"),
            ),
            otherAccountsPictures: <Widget>[
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          LogoutDialog(alertMessage: "LogOut"));
                },
                icon: new Icon(Icons.exit_to_app, color: Colors.white),
              ),
            ],
          ),
          ListTile(
            title: Text("Edite Basic Inf"),
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => null()));
            },
          ),
          ListTile(
              title: Text("Chanage Password"),
              leading: Icon(Icons.change_history),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => null()));
              }),
          ListTile(
            title: Text("Chanage language"),
            leading: Icon(Icons.language),
            onTap: () =>
                showDialog(context: context, builder: (context) => MyForm()),
          ),
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(alertMessage: "Log Out"));
              // _store.logout();
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
