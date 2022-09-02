import 'package:cached_network_image/cached_network_image.dart';
import 'package:contact_manager/helpers/theme_manager.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:flutter/material.dart';

class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({required this.contact, Key? key}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: CachedNetworkImage(
                  imageUrl: contact.images.isNotEmpty ? contact.images[0] : '',
                  cacheKey: contact.images.isNotEmpty ? contact.images[0] : '',
                  fit: BoxFit.fill,
                  height: 150,
                  width: 150,
                  errorWidget: (context, a, b) =>
                      Image.asset('assets/images/contact.png'),
                  placeholder: (context, a) =>
                      Image.asset('assets/images/contact.png'),
                ),
              ),
              const SizedBox(height: 24),
              _getInfo('FirstName:', contact.firstName, Icons.person),
              _getInfo('LastName:', contact.lastName, Icons.person),
              _getInfo('Phone:', contact.phone, Icons.phone),
              _getInfo('Email:', contact.email, Icons.email),
              _getInfo('Notes:', contact.notes, Icons.description),
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
      ),
    );
  }

  Widget _getInfo(String title, String value, IconData icon) {
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
        const Divider(),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
