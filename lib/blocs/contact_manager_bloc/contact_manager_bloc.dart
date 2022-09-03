import 'package:contact_manager/blocs/blocs.dart';
import 'package:contact_manager/helpers/strings.dart';
import 'package:contact_manager/models/contact.dart';
import 'package:contact_manager/models/response_base.dart';
import 'package:contact_manager/repositories/network_repository.dart';

class ContactManagerBloc
    extends Bloc<ContactManagerEvent, ContactManagerState> {
  ContactManagerBloc({
    required ContactManagerState initialState,
    required this.networkRepository,
  }) : super(initialState);

  final NetworkRepository networkRepository;

  @override
  Stream<ContactManagerState> mapEventToState(
      ContactManagerEvent event) async* {
    /// get all contacts
    if (event is GetAllContactsEvent) {
      yield GetAllContactsLoadingState();
      final ResponseBase res = await networkRepository.getAllContacts();
      if (res.statusCode == 200) {
        contacts = res.data as List<Contact>;
        yield GetAllContactsSuccessfulState(contacts: contacts);
      } else {
        yield const GetAllContactsErrorState(msg: connectionError);
      }

      /// add contact
    } else if (event is AddContactEvent) {
      yield AddContactLoadingState();
      final ResponseBase res = await networkRepository.addContact(
        event.firstName,
        event.lastName,
        event.email,
        event.phone,
        event.notes,
        event.image,
      );
      if (res.statusCode == 201) {
        yield const AddContactSuccessfulState(msg: contactAddedSuccessfully);
      } else {
        yield AddContactErrorState(msg: res.message ?? connectionError);
      }
    }

    /// delete contact
    else if (event is DeleteContactEvent) {
      yield DeleteContactLoadingState();
      final ResponseBase res = await networkRepository.deleteContact(
        event.id,
      );
      if (res.statusCode == 200) {
        yield const DeleteContactSuccessfulState(
            msg: contactDeletedSuccessfully);
      } else {
        yield DeleteContactErrorState(msg: res.message ?? connectionError);
      }
    }

    /// edit contact
    else if (event is EditContactEvent) {
      yield EditContactLoadingState();
      final ResponseBase res =
          await networkRepository.editContact(event.contact);
      if (res.statusCode == 200) {
        final Contact newContact = Contact.fromJson(res.data);
        _updateContactsList(newContact);
        yield EditContactSuccessfulState(
            contact: newContact, msg: contactEditedSuccessfully);
      } else {
        yield EditContactErrorState(msg: res.message ?? connectionError);
      }
    }
  }

  void _updateContactsList(Contact newContact) {
    for (Contact element in contacts) {
      if (element.id == newContact.id) {
        element.firstName = newContact.firstName;
        element.lastName = newContact.lastName;
        element.email = newContact.email;
        element.phone = newContact.phone;
        element.notes = newContact.notes;
      }
    }
  }

  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  set contacts(List<Contact> value) {
    _contacts = value;
  }
}
