import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/pages/contact_details_page.dart';
import 'package:contact_manager/widgets/contact_avatar.dart';
import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    required this.contact,
    required Key key,
  }) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          child: Row(
            children: [
              ContactAvatar(
                url: contact.images.isNotEmpty ? contact.images[0] : '',
                key: Key(contact.id),
                size: 50,
              ),
              const SizedBox(width: 24),
              Column(
                children: [
                  SizedBox(
                      child: Text(
                        contact.firstName + ' ' + contact.lastName,
                        style: ThemeManager.getTheme()
                            .textTheme
                            .subtitle2!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      width: MediaQuery.of(context).size.width / 2),
                  Text(contact.phone),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ContactDetailsPage(
            contact: contact,
            key: Key(contact.id),
          ),
        ),
      ),
    );
  }
}
