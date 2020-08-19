import 'package:flutter/material.dart';
import 'package:gym/Screens/auth/signup/select_gwa.dart';
import 'package:gym/component/const.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _name;
  String _email;
  String _password;
  String _confirmPass;

  bool passwordVisible = true;
  bool confirmPassVisible = true;
  @override
  void initState() {
    passwordVisible = true;
    confirmPassVisible = true;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Account Registeration',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        '1/3',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),

                //==================================== From Starts here
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //============================================= Name Box

                          _textField(
                            labelText: "Name",
                            textValdiation: 'Please enter your name',
                            onChanged: ((String name) {
                              setState(() {
                                _name = name;
                                print(_name);
                              });
                            }),
                          ),
                          //============================================= Email Box

                          _textField(
                            labelText: "Email Address",
                            textValdiation: 'Please enter your email address',
                            onChanged: ((String email) {
                              setState(() {
                                _email = email;
                                print(_email);
                              });
                            }),
                          ),

                          //============================================= Password Box

                          _passwordField(
                              labelText: "Password",
                              obscureText: passwordVisible,
                              onChanged: ((String pass) {
                                setState(() {
                                  _password = pass;
                                  print(_password);
                                });
                              }),
                              textValadition: 'Please enter password'),

                          //============================================= Password Box

                          _passwordField(
                              labelText: "ConFirm Password",
                              obscureText: confirmPassVisible,
                              onChanged: ((String pass) {
                                setState(() {
                                  _confirmPass = pass;
                                  print(_confirmPass);
                                });
                              }),
                              textValadition: 'Please enter confirm password'),
                        ]),
                  ),
                ),

                // Container(
                //   padding: EdgeInsets.only(top: 130, bottom: 20),
                //   child:,
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 130, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text(
                'GO BACK',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CustomButton(
              text: 'NEXT',
              callback: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PinPage(),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _textField(
      {String labelText, String textValdiation, Function onChanged}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textAlign: TextAlign.start,
        validator: (value) {
          if (value.isEmpty) {
            return textValdiation;
          }
          return null;
        },
      ),
    );
  }

  Widget _passwordField(
      {String labelText,
      bool obscureText,
      String textValadition,
      Function onChanged}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Colors.black54,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
                confirmPassVisible = !confirmPassVisible;
              });
            },
          ),
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        textAlign: TextAlign.start,
        validator: (value) {
          if (value.isEmpty) {
            return textValadition;
          }
          return null;
        },
      ),
    );
  }
}
