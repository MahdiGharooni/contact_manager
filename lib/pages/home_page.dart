import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/pages/contact_add_page.dart';
import 'package:contact_manager/widgets/empty_page.dart';
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
                : _bloc.contacts.isNotEmpty
                    ? RefreshIndicator(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final Contact _contact = _bloc.contacts[index];
                            return HomeCardWidget(
                                contact: _contact, key: Key(_contact.id));
                          },
                          itemCount: _bloc.contacts.length,
                        ),
                        onRefresh: () async {
                          _bloc.add(GetAllContactsEvent());
                        },
                      )
                    : const EmptyPage(),
          );
        },
        listener: (context, state) {
          //todo
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
