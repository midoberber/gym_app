// import 'package:flutter/material.dart';
// import 'package:gender_selection/gender_selection.dart';
// import 'package:gym/Screens/auth/signup/input_page.dart/card_title.dart';
// import 'package:gym/Screens/auth/signup/input_page.dart/height/height_card.dart';
// import 'package:gym/Screens/auth/signup/input_page.dart/weight/weight_card.dart';
// import 'package:gym/utils/widget_utils.dart';

// class InputPage extends StatefulWidget {
//   @override
//   InputPageState createState() {
//     return new InputPageState();
//   }
// }

// class InputPageState extends State<InputPage> {
//   int height = 170;
//   int weight = 70;
//   Gender gender;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("data"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           InputSummaryCard(
//             gender: gender,
//             weight: weight,
//             height: height,
//           ),
//           Expanded(child: _buildCards(context)),
//           // _buildBottom(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildCards(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Card(
//                   child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,

//                     children: <Widget>[
//                       CardTitle(
//                         "GENDER",
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: GenderSelection(
//                             femaleImage: AssetImage("assets/img/male.jpg"),
//                             maleImage: AssetImage("assets/img/female.jpg"),
//                             selectedGenderIconBackgroundColor: Colors.amber,
//                             selectedGenderTextStyle: TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.bold),
//                             onChanged: (val) => setState(() => gender = val),
//                             size: 120,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: WeightCard(
//                   weight: weight,
//                   onChanged: (val) => setState(() => weight = val),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: HeightCard(
//             height: height,
//             onChanged: (val) => setState(() => height = val),
//           ),
//         )
//       ],
//     );
//   }
// }

// class InputSummaryCard extends StatelessWidget {
//   final int height;
//   final int weight;
//   final Gender gender;
//   const InputSummaryCard({Key key, this.height, this.weight, this.gender})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(screenAwareSize(16.0, context)),
//       child: SizedBox(
//         // height: screenAwareSize(32.0, context),
//         child: Row(
//           children: <Widget>[
//             Expanded(child: _genderText()),
//             _divider(),
//             Expanded(child: _text("${weight}kg")),
//             // _divider(),
//             // Expanded(child: _text("${height}cm")),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _genderText() {
//     String genderText =
//         gender == null ? '-' : (gender == Gender.Male ? 'Male' : 'Female');
//     return _text(genderText);
//   }

//   Widget _text(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: Color.fromRGBO(143, 144, 156, 1.0),
//         fontSize: 15.0,
//       ),
//       textAlign: TextAlign.center,
//     );
//   }

//   Widget _divider() {
//     return Container(
//       width: 1.0,
//       color: Color.fromRGBO(151, 151, 151, 0.1),
//     );
//   }
// }
