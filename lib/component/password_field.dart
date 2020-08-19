import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {this.fieldKey,
      this.helperText,
      this.labelText,
      this.hintText,
      this.onFieldSubmitted,
      this.onSave,
      this.controller,
      this.reNewPassword: false});

  final fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSave;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  final bool reNewPassword;

  @override
  State<StatefulWidget> createState() {
    return _PasswordField();
  }
}

class _PasswordField extends State<PasswordField> {
  bool _obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obsecureText,
      controller: widget.controller,
      onSaved: widget.onSave,
      validator: (value) {
        if (value.isEmpty) {
          return "Enter Password";
        }
        if (value.length < 6) {
          return "Password Less Than 6 ";
        }
        // if (Provider.of<GeneralProvider>(context).newController.text != value &&
        //     widget.reNewPassword) {
        //   return AppLocalizations.of(context).passordNotMatch;
        // }

        return null;
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: new InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
          ),
          border: InputBorder.none,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          suffixIcon: new GestureDetector(
            onTap: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
            },
            child: new Icon(
                _obsecureText ? Icons.visibility : Icons.visibility_off),
          )),
    );
  }
}
