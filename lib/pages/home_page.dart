import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/pages/contact_add_page.dart';
import 'package:contact_manager/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<ContactManagerBloc>(context);
    _bloc.add(GetAllContactsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<ContactManagerBloc, ContactManagerState>(
        builder: (context, state) {
          return Center(
            child: (state is GetAllContactsLoadingState)
                ? const CircularProgressIndicator()
                : (state is GetAllContactsSuccessfulState)
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          final Contact _contact = state.contacts[index];
                          return HomeCardWidget(
                              contact: _contact, key: Key(_contact.id));
                        },
                        itemCount: state.contacts.length,
                      )
                    : Container(),
          );
        },
        listener: (context, state) {
          if (state is AddContactsSuccessfulState) {
            final snackBar  = SnackBar(
              content: Text(state.msg),
              backgroundColor: ThemeManager.secondaryColor,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _bloc.add(GetAllContactsEvent());
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ContactAddPage(),
            ),
          );
        },
        tooltip: 'Add Contact',
        icon: const Icon(Icons.add),
        label: const Text('Add Contact'),
      ),
    );
  }
}
