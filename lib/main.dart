import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gym/Screens/auth/login/login_page.dart';
import 'package:gym/Screens/home/home_page.dart';
import 'package:gym/Screens/home/home_tabs.dart';
import 'package:gym/component/Loader/loader.dart';
import 'package:gym/component/appIntro/appIntro.dart';
import 'package:gym/models/appData.dart';
import 'package:gym/store/appstore.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:gym/component/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MultiProvider(
        providers: [
          Provider<AppStore>(
            create: (BuildContext context) => AppStore(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: HexColor('#FF2970'),
            primarySwatch: Colors.red,
            //  primaryColor: Colors.red,
            accentColor: Colors.grey[600],
//        fontFamily: 'Roboto',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  button: TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
          home: AppBuilder(),
        ),
      ),
    );
  }
}

class AppBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    store.intializeAppState();
    return Observer(
      builder: (_) {
        var future = store.loadDataFuture;
        switch (future.status) {
          case FutureStatus.rejected:
            return Center(child: Text("There is an Error "));
          case FutureStatus.pending:
            return Loader();
          case FutureStatus.fulfilled:
            final AppData data = future.result;
            if (data == null) {
              return Center(
                child: Loader(),
              );
            }
            // return Testing();
            if (data.isOnBoardingPresist == null ||
                data.isOnBoardingPresist == false) {
              return AppIntro();
            } else {
              if (data.token == null || data.token.isEmpty) {
                return LoginPage();
              } else {
                return HomeTabs();
              }
            }
            break;
          default:
        }
      },
    );
  }
}
