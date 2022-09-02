import 'package:equatable/equatable.dart';

abstract class ContactManagerEvent extends Equatable {
  const ContactManagerEvent();

  @override
  List<Object> get props => [];
}

class GetAllContactsEvent extends ContactManagerEvent {}

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
