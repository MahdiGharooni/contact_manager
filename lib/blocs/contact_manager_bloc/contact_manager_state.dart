import 'package:contact_manager/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactManagerState extends Equatable {
  const ContactManagerState();

  @override
  List<Object> get props => [];
}

class InitialState extends ContactManagerState {}

/// get all contacts
class GetAllContactsLoadingState extends ContactManagerState {}

class GetAllContactsErrorState extends ContactManagerState {
  const GetAllContactsErrorState({required this.msg});

  final String msg;
}

class GetAllContactsSuccessfulState extends ContactManagerState {
  const GetAllContactsSuccessfulState({required this.contacts});

  final List<Contact> contacts;
}
