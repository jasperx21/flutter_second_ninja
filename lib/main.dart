import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fluttersecondninja/pages/choose_location.dart';
import 'package:fluttersecondninja/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}