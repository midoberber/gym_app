import 'package:flutter/material.dart';

var flatAppBar = ({Widget title}) => AppBar(
      // centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.grey[700]),
      textTheme: TextTheme(title: TextStyle(color: Colors.grey[700])),
      backgroundColor: const Color(0xffbF2F2F2).withOpacity(0.0),
      title: title
    );
