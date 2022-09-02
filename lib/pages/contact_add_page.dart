import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/blocs/contact_manager_bloc/contact_manager_bloc.dart';
import 'package:contact_manager/widgets/text_form_fields/email_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/name_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/phone_text_form_field.dart';
import 'package:flutter/material.dart';

class ContactAddPage extends StatelessWidget {
  ContactAddPage({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                NameTextFormField(
                  controller: _firstNameController,
                  labelText: 'First Name',
                ),
                const SizedBox(height: 8),
                NameTextFormField(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                ),
                const SizedBox(height: 8),
                PhoneTextFormField(controller: _phoneController),
                const SizedBox(height: 8),
                EmailTextFormField(controller: _emailController),
                const SizedBox(height: 8),
                NameTextFormField(
                  controller: _notesController,
                  labelText: 'Notes',
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final ContactManagerBloc bloc =
                          BlocProvider.of<ContactManagerBloc>(context);
                      bloc.add(AddContactEvent(
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        notes: _notesController.text,
                      ));
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.all(24),
        ),
      ),
    );
  }
}
