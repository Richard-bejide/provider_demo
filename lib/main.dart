import 'package:provider/provider.dart';
import 'package:provider_demo/providers/homepage_provider.dart';
import 'package:provider_demo/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"provider Rest",
      theme: ThemeData(
        appBarTheme:const AppBarTheme(color: Color(0xFF2F5233)),
        primaryColor:const Color(0xFF2F5233),
        backgroundColor:const Color(0xFFDCDCDC),
      ),
      home:ChangeNotifierProvider(
        create:(context) => HomePageProvider(),
        child: Home(),
    ));
  }
}
