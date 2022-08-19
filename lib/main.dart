import 'package:flutter/material.dart';
import 'package:newsprovider/src/pages/tabs_page.dart';
import 'package:newsprovider/src/theme/darktheme.dart';
import 'package:newsprovider/src/theme/lighttheme.dart';

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
      title: 'Flutter Demo',
      home:  TabsPage(), 
      theme: DarkTheme//DarkTheme,
       );
  }
}

