import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/pages/contact_add_page.dart';
import 'package:contact_manager/widgets/empty_widget.dart';
import 'package:contact_manager/widgets/exit_dialog.dart';
import 'package:contact_manager/widgets/home_card_widget.dart';
import 'package:contact_manager/widgets/home_shimmer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? _backPressedTime;

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<ContactManagerBloc>(context);
    _bloc.add(GetAllContactsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ExitDialog(),
                );
              },
              icon: const Icon(Icons.exit_to_app))
        ],
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ContactManagerBloc, ContactManagerState>(
        builder: (context, state) {
          return SafeArea(
            child: WillPopScope(
              child: Center(
                child: (state is GetAllContactsLoadingState)
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return const HomeShimmerWidget();
                        },
                        itemCount: 15,
                      )
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
              ),
              onWillPop: _onWillPop,
            ),
          );
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

  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    FocusScope.of(context).unfocus();
    bool backButton = (_backPressedTime == null) ||
        (now.difference(_backPressedTime!) > const Duration(seconds: 1));
    if (backButton) {
      _backPressedTime = now;
      const snackBar =  SnackBar(
        content:  Text(press2TimesFormExit),
        backgroundColor: ThemeManager.secondaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return false;
    } else {
      return true;
    }
  }
}
