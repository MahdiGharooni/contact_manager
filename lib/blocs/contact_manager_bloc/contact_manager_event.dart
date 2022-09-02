import 'package:equatable/equatable.dart';

abstract class ContactManagerEvent extends Equatable {
  const ContactManagerEvent();

  @override
  List<Object> get props => [];
}

class GetAllContactsEvent extends ContactManagerEvent {}
