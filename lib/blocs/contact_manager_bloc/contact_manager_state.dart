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

/// add contact
class AddContactLoadingState extends ContactManagerState {}

class AddContactErrorState extends ContactManagerState {
  const AddContactErrorState({required this.msg});

  final String msg;
}

class AddContactSuccessfulState extends ContactManagerState {
  const AddContactSuccessfulState({required this.msg});

  final String msg;
}

/// delete contact
class DeleteContactLoadingState extends ContactManagerState {}

class DeleteContactErrorState extends ContactManagerState {
  const DeleteContactErrorState({required this.msg});

  final String msg;
}

class DeleteContactSuccessfulState extends ContactManagerState {
  const DeleteContactSuccessfulState({required this.msg});

  final String msg;
}

/// edit contact
class EditContactLoadingState extends ContactManagerState {}

class EditContactErrorState extends ContactManagerState {
  const EditContactErrorState({required this.msg});

  final String msg;
}

class EditContactSuccessfulState extends ContactManagerState {
  const EditContactSuccessfulState({required this.msg});

  final String msg;
}