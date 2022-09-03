import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/blocs/contact_manager_bloc/contact_manager_bloc.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/helpers/widget_utils.dart';
import 'package:contact_manager/widgets/text_form_fields/email_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/name_text_form_field.dart';
import 'package:contact_manager/widgets/text_form_fields/phone_text_form_field.dart';
import 'package:flutter/material.dart';

class ContactAddPage extends StatelessWidget with WidgetUtils {
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
      body: BlocListener<ContactManagerBloc, ContactManagerState>(
        listener: (context, state) {
          if (state is AddContactLoadingState) {
            showLoading(context);
          }
          if (state is AddContactErrorState) {
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.getTheme().errorColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is AddContactSuccessfulState) {
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.secondaryColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            BlocProvider.of<ContactManagerBloc>(context)
                .add(GetAllContactsEvent());
            Navigator.pop(context);
          }
        },
        child: Card(
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
                        bloc.add(AddContactEvent(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          notes: _notesController.text,
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
        ),
      ),
    );
  }
}
