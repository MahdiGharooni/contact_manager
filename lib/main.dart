import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/pages/offline_page.dart';
import 'package:contact_manager/pages/splash_page.dart';
import 'package:contact_manager/repositories/network_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription subscription;
  bool _hasInternet = false;

  @override
  void initState() {
    super.initState();
    _checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactManagerBloc(
        initialState: InitialState(),
        networkRepository: NetworkRepository(),
      ),
      child: MaterialApp(
        home: _hasInternet
            ? const SplashPage()
            : const OfflinePage(title: 'Contact Manager'),
        theme: ThemeManager.getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  void _checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _hasInternet = false;
      });
    } else if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        _hasInternet = true;
      });
    }

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          _hasInternet = false;
        });
      } else if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          _hasInternet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
