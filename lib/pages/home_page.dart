import 'package:contact_manager/blocs/blocs.dart';
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
                          return Container(
                            child: Text(state.contacts[index].firstName),
                            padding: const EdgeInsets.all(24),
                          );
                        },
                        itemCount: state.contacts.length,
                      )
                    : Container(),
          );
        },
        listener: (context, state) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
