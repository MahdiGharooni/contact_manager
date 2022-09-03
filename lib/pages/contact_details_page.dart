import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/helpers/widget_utils.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/widgets/contact_avatar.dart';
import 'package:flutter/material.dart';

class ContactDetailsPage extends StatelessWidget with WidgetUtils{
  const ContactDetailsPage({
    required this.contact,
    required Key key,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<ContactManagerBloc>(context)
                  .add(DeleteContactEvent(id: contact.id));
            },
          )
        ],
      ),
      body: BlocListener<ContactManagerBloc , ContactManagerState>(
        listener: (context, state) {
          if(state is DeleteContactLoadingState){
            showLoading(context);
          }
          if(state is DeleteContactErrorState){
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.getTheme().errorColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if(state is DeleteContactSuccessfulState){
            hideLoading(context);
            final snackBar = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.secondaryColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            BlocProvider.of<ContactManagerBloc>(context).add(GetAllContactsEvent());
            Navigator.pop(context);
          }
        },
        child: Card(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ContactAvatar(
                    url: contact.images.isNotEmpty ? contact.images[0] : '',
                    size: 150,
                    key: Key(contact.id),
                  ),
                  const SizedBox(height: 24),
                  _getInfo('FirstName:', contact.firstName, Icons.person),
                  _getInfo('LastName:', contact.lastName, Icons.person),
                  _getInfo('Phone:', contact.phone, Icons.phone),
                  _getInfo('Email:', contact.email, Icons.email),
                  _getInfo('Notes:', contact.notes, Icons.description, false),
                ],
              ),
            ),
            padding: const EdgeInsets.all(24),
          ),
        ),
      ),
    );
  }

  Widget _getInfo(String title, String value, IconData icon,
      [hasDivider = true]) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: ThemeManager.getTheme().textTheme.bodyText1,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            const SizedBox(width: 32),
            Expanded(
              child: Text(
                value.isNotEmpty ? value : '-',
                style: ThemeManager.getTheme()
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        if (hasDivider) const Divider(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
