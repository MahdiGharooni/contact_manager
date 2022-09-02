import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({
    required this.url,
    required this.size,
    required Key key,
  }) : super(key: key);
  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: CachedNetworkImage(
        imageUrl: url,
        cacheKey: url,
        fit: BoxFit.fill,
        height: size,
        width: size,
        errorWidget: (context, a, b) =>
            Image.asset('assets/images/contact.png'),
        placeholder: (context, a) => Image.asset('assets/images/contact.png'),
      ),
    );
  }
}
