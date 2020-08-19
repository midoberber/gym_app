import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class PageContainer extends StatelessWidget {
  const PageContainer(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          // SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: child,
      ),
    );
  }
}
