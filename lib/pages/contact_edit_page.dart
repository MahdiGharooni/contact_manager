import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/helpers/widget_utils.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/widgets/text_form_fields/email_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/name_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/phone_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactEditPage extends StatelessWidget with WidgetUtils{
  ContactEditPage({required this.contact, Key? key}) : super(key: key);

  final Contact contact;

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _notesController;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _firstNameController = TextEditingController(text: contact.firstName);
    _lastNameController = TextEditingController(text: contact.lastName);
    _phoneController = TextEditingController(text: contact.phone);
    _emailController = TextEditingController(text: contact.email);
    _notesController = TextEditingController(text: contact.notes);

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.firstName + ' ' + contact.lastName),
      ),
      body:BlocListener<ContactManagerBloc ,ContactManagerState>(
        listener: (context ,state){
          if(state is EditContactLoadingState){
            showLoading(context);
          }
          if(state is EditContactErrorState){
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.getTheme().errorColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if(state is EditContactSuccessfulState){
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.secondaryColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          }
        },
        child:  Card(
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
                      FocusManager.instance.primaryFocus?.unfocus();
                      final ContactManagerBloc bloc =
                      BlocProvider.of<ContactManagerBloc>(context);
                      bloc.add(EditContactEvent(
                        contact: Contact(
                          id: contact.id,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          notes: _notesController.text,
                        ),
                      ));
                    }
                  },
                  child: const Text(confirm),
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.all(24),
        ),
      ),),
    );
  }
}
