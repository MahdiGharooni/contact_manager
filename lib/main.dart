import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Contact Manager'),
      theme: ThemeManager.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
