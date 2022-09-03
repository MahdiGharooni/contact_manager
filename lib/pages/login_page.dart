import 'package:contact_manager/helpers/local_repository.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/pages/home_page.dart';
import 'package:contact_manager/widgets/text_form_fields/name_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  DateTime? _backPressedTime;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        child: Center(
          child: Card(
            child: Padding(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    NameTextFormField(
                      controller: _usernameController,
                      labelText: 'Username',
                    ),
                    const SizedBox(height: 8),
                    NameTextFormField(
                      controller: _passController,
                      labelText: 'Password',
                      obscure: false,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          LocalRepository.setUserLoginStatus(true);
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  const HomePage(title: 'Contact Manager'),
                            ),
                          );
                        }
                      },
                      child: const Text(login),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
          ),
        ),
        onWillPop: () => _onWillPop(context),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    FocusScope.of(context).unfocus();
    bool backButton = (_backPressedTime == null) ||
        (now.difference(_backPressedTime!) > const Duration(seconds: 1));
    if (backButton) {
      _backPressedTime = now;
      const snackBar = SnackBar(
        content: Text(press2TimesFormExit),
        backgroundColor: ThemeManager.secondaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return false;
    } else {
      return true;
    }
  }
}
