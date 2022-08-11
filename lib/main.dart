import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'view/home.dart';

void main() {
  runApp(const StartView());
}


class StartView extends StatelessWidget {
  const StartView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input member info',
      theme: ThemeData(

      ),
      home: const HomeView(),
    );
  }
}