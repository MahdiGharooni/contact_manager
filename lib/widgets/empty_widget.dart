import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Icon(Icons.person_off),
          Text('You Don\'t Have Any Contacts '),
        ],
      ),
    );
  }
}
