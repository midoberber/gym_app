// import 'package:flutter/material.dart';
// import 'package:my_project/component/page_container.dart';
// import 'package:my_project/component/password_field.dart';
// import 'package:provider/provider.dart';

// class ChangePassword extends StatefulWidget {
//   @override
//   _ChangePasswordState createState() => _ChangePasswordState();
// }

// class _ChangePasswordState extends State<ChangePassword> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController renewController = TextEditingController();
//   // TextEditingController reNewController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chanage Password"),
//       ),
//       body: SingleChildScrollView(
//         child: PageContainer(
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: 200,
//                 height: 200,
//                 child: Image.asset('assets/img/change_password.png'),
//               ),
//               Card(
//                   color: Colors.white,
//                   margin: EdgeInsets.all(5.0),
//                   elevation: 0.15,
//                   child: Container(
//                       padding: EdgeInsets.all(9.0),
//                       // margin: EdgeInsets.all(6.0),
//                       child: Form(
//                         key: _formKey,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.max,
//                           children: <Widget>[
                           
//                             PasswordField(
                              
//                               labelText:
//                                "   AppLocalizations.of(context).newPassowrd",
//                             ),
//                             PasswordField(
//                               controller: renewController,
//                               labelText: AppLocalizations.of(context)
//                                   .repeatNewPassowrd,
//                               reNewPassword: true,
//                             ),
//                             RaisedButton(
//                               child: new Text(
//                                 AppLocalizations.of(context).changePaSSword,
//                                 style: new TextStyle(color: Colors.white),
//                               ),
//                               onPressed: () async {
//                                 if (_formKey.currentState.validate()) {
//                                   Provider.of<GeneralProvider>(context)
//                                       .setIsLoading(true);
//                                   if (renewController.text ==
//                                       Provider.of<GeneralProvider>(context)
//                                           .newController
//                                           .text) {
//                                     var results =
//                                         await appRepository.updatePassword(
//                                             Provider.of<AppStore>(context)
//                                                 .appData
//                                                 .user
//                                                 .username,
//                                             renewController.text,
//                                             Provider.of<GeneralProvider>(
//                                                     context)
//                                                 .newController
//                                                 .text);
//                                     if (results) {
//                                       Toast.show(
//                                           AppLocalizations.of(context)
//                                               .updateInfoSuccess,
//                                           context,
//                                           duration: Toast.LENGTH_LONG,
//                                           gravity: Toast.BOTTOM);
//                                     } else {
//                                       Toast.show(
//                                           AppLocalizations.of(context)
//                                               .updateInfoError,
//                                           context,
//                                           duration: Toast.LENGTH_LONG,
//                                           gravity: Toast.BOTTOM);
//                                     }
//                                   } else {
//                                     print("object");
//                                   }
//                                   Provider.of<GeneralProvider>(context)
//                                       .setIsLoading(false);
//                                 }
//                               },
//                               color: Colors.blue,
//                             ),
//                           ],
//                         ),
//                       ))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
