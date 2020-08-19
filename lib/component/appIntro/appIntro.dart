import 'package:flutter/material.dart';
import 'package:gym/store/appstore.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:provider/provider.dart';

class AppIntro extends StatefulWidget {
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "RAMY GYM",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/img/image001.jpg",
        styleDescription: TextStyle(
            foreground: Paint()..shader = linearGradient, fontSize: 19.0),
        backgroundColor: Color(0xff5499C7),
      ),
    );
    slides.add(
      new Slide(
        title: "RAMY GYM",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        pathImage: "assets/img/image003.jpg",
        styleDescription: TextStyle(
            foreground: Paint()..shader = linearGradient, fontSize: 19.0),
        backgroundColor: Color(0xff5499C7),
      ),
    );
    slides.add(
      new Slide(
        title: "RAMY GYM",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "assets/img/image007.jpg",
        styleDescription: TextStyle(
            foreground: Paint()..shader = linearGradient, fontSize: 19.0),
        backgroundColor: Color(0xff5499C7),
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
  }

  void onSkipPress() {
    // TODO: go to next screen
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);

    return new IntroSlider(
      slides: this.slides,

       nameNextBtn: "Next",
      nameSkipBtn: "Skip",
      nameDoneBtn:"Done",
      onDonePress: () {
        store.setIsSeenTutorial(true);
      },
      onSkipPress: () {
        store.setIsSeenTutorial(true);
      },
      isShowDotIndicator: true,
    );
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffffffff), Color(0xfff5f5f5), Color(0xffdbdbdb)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
