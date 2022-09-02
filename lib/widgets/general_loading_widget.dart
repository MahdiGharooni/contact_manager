import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:flutter/material.dart';

class GeneralLoadingWidget extends StatelessWidget {
  const GeneralLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: ThemeManager.primaryColorLight,
        valueColor: AlwaysStoppedAnimation(
          ThemeManager.primaryColorLight,
        ),
      ),
    );
  }
}
