import 'package:contact_manager/helpers/local_repository.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/pages/login_page.dart';
import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(exit),
      content: Column(
        children: const [
          Text(areYouSureFromExitingTheApp),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(no),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            LocalRepository.setUserLoginStatus(false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => LoginPage()),
            );
          },
          child: const Text(yes),
        ),
      ],
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
