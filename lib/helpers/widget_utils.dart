import 'dart:ui';

import 'package:contact_manager/widgets/general_loading_widget.dart';
import 'package:flutter/material.dart';

mixin WidgetUtils {
  void showLoading(BuildContext context) {
    _showGeneralLoadingDialog(context, false);
  }

  void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _showGeneralLoadingDialog(BuildContext context, bool dismissible) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) {
        return WillPopScope(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: const GeneralLoadingWidget(),
            ),
          ),
          onWillPop: () async {
            return await false;
          },
        );
      },
      barrierDismissible: dismissible,
    );
  }
}
