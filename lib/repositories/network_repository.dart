import 'dart:convert';

import 'package:contact_manager/helpers/urls.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/models/response_base.dart';
import 'package:contact_manager/repositories/network_repository_base.dart';
import 'package:http/http.dart';

class NetworkRepository extends NetworkRepositoryBase {
  Future<ResponseBase> getAllContacts() async {
    final Response res = await getJSON(path: getAllContactsUrl);

    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      List<Contact> _contacts = [];
      for (Map<String, dynamic> element in data) {
        _contacts.add(Contact.fromJson(element));
      }
      return ResponseBase(data: _contacts, statusCode: res.statusCode);
    } else {
      return ResponseBase(data: [], statusCode: res.statusCode);
    }
  }
}
