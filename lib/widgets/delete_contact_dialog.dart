import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:flutter/material.dart';

class DeleteContactDialog extends StatelessWidget {
  const DeleteContactDialog({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(deleteContact),
      content: Column(
        children: const [
          Text(areYouSureFromDeletingThisContact),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          child: const Text(no),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            BlocProvider.of<ContactManagerBloc>(context)
                .add(DeleteContactEvent(id: id));
          },
          child: const Text(yes),
        ),
      ],
      contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
