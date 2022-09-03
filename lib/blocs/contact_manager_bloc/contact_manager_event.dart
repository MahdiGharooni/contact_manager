import 'package:contact_manager/models/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ContactManagerEvent extends Equatable {
  const ContactManagerEvent();

  @override
  List<Object> get props => [];
}

/// get all contacts
class GetAllContactsEvent extends ContactManagerEvent {}

/// add new contact
class AddContactEvent extends ContactManagerEvent {
  const AddContactEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.notes,
    this.image = '',
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String notes;
  final String image;
}

/// delete contact
class DeleteContactEvent extends ContactManagerEvent {
  const DeleteContactEvent({required this.id});

  final String id;
}

/// edit contact
class EditContactEvent extends ContactManagerEvent {
  const EditContactEvent({required this.contact});

  final Contact contact;
}
