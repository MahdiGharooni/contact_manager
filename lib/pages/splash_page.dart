import 'package:contact_manager/helpers/local_repository.dart';
import 'package:contact_manager/pages/home_page.dart';
import 'package:contact_manager/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _checkLoginStatus(context);
    return Center(
      child: Image.asset('assets/images/logo.png'),
    );
  }

  void _checkLoginStatus(BuildContext context) async {
    bool res = await LocalRepository.getUserLoginStatus();
    await Future.delayed(const Duration(seconds: 2));
    if (res) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (ctx) => const HomePage(title: 'Contact Manager')),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (ctx) => LoginPage()),
      );
    }
  }
}
