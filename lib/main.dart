import 'package:flutter/material.dart';
//import 'package:meta_facebook/screens/home.dart';
import 'package:meta_facebook/screens/principal.dart';


void main() {
  runApp(const MaterialApp(
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    //home:Home()
    home: Principal(),
  ));
}

