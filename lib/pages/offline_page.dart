import 'dart:async';

import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:flutter/material.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  bool _timerStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Container()),
            const Icon(Icons.wifi_off, size: 40),
            const SizedBox(
              height: 8,
            ),
            const Text(
              networkUnavailable,
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: Container(
                  child: _timerStarted
                      ? Container(
                          child: CircularProgressIndicator(
                            color: ThemeManager.darkCursorColor.shade100,
                            strokeWidth: 3,
                          ),
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                        )
                      : Text(
                          retry,
                          style: TextStyle(
                            color: ThemeManager.darkCursorColor.shade100,
                          ),
                        ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ThemeManager.accentColor,
                  )),
              onTap: () => startTimer(),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Future<void> startTimer() async {
    setState(() {
      _timerStarted = true;
    });

    await Future.delayed(
      const Duration(seconds: 5),
    );

    setState(() {
      _timerStarted = false;
    });
  }
}
