import 'package:HTH_Exp/pages/home.dart';
import 'package:HTH_Exp/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holy Trinity Healthcare',
      theme: ThemeData(
        fontFamily: 'HindSiliguri',
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
      ),
      home: Home(),
    );
  }
}
