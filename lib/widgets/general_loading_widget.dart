import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:flutter/material.dart';

class GeneralLoadingWidget extends StatelessWidget {
  const GeneralLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: ThemeManager.darkCursorColor.shade300,
        valueColor: AlwaysStoppedAnimation(
          ThemeManager.darkCursorColor.shade100,
        ),
      ),
    );
  }
}
