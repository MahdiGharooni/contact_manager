import 'dart:convert';

import 'package:contact_manager/helpers/urls.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/models/response_base.dart';
import 'package:contact_manager/repositories/network_repository_base.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class NetworkRepository extends NetworkRepositoryBase {
  Future<ResponseBase> getAllContacts() async {
    final Response res = await getJSON(path: contactsUrl);

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

  Future<ResponseBase> addContact(String firstName, String lastName,
      String email, String phone, String notes,
      XFile? image ) async {
    final dynamic res = await postJSON(
      path: contactsUrl,
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "notes": notes,
      },
      image: image,
    );

    if (res.statusCode == 201) {
      final Contact data = Contact.fromJson(jsonDecode(res.body) );
      return ResponseBase(data: data, statusCode: res.statusCode);
    } else {
      return ResponseBase(
          data: [],
          statusCode: res.statusCode,
          message: jsonDecode(res.body)['message'] ?? '');
    }
  }


  Future<ResponseBase> deleteContact(String id) async {
    final Response res = await deleteJSON(
      path: '$contactsUrl/$id',
    );

    if (res.statusCode == 200) {
      return ResponseBase(data: {}, statusCode: res.statusCode);
    } else {
      return ResponseBase(
          data: {},
          statusCode: res.statusCode,
          message: jsonDecode(res.body)['message'] ?? '');
    }
  }

    Future<ResponseBase> editContact(Contact contact) async {
    final Response res = await putJSON(
      path: '$contactsUrl/${contact.id}',
      body:  {
        "firstName": contact.firstName ,
        "lastName": contact.lastName ,
        "email": contact.email ,
        "phone": contact.phone ,
        "notes": contact.notes ,
      },
    );

    if (res.statusCode == 200) {
      return ResponseBase(data: jsonDecode(res.body), statusCode: res.statusCode);
    } else {
      return ResponseBase(
          data: {},
          statusCode: res.statusCode,
          message: jsonDecode(res.body)['message'] ?? '');
    }
  }


}
