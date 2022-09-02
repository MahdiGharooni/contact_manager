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
      yield AddContactsLoadingState();
      final ResponseBase res = await networkRepository.addContact(
        event.firstName,
        event.lastName,
        event.email,
        event.phone,
        event.notes,
        event.image,
      );
      if (res.statusCode == 201) {
        yield const AddContactsSuccessfulState(msg: contactAddedSuccessfully);
      } else {
        yield AddContactsErrorState(msg: res.message ?? connectionError);
      }
    }
  }

  List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  set contacts(List<Contact> value) {
    _contacts = value;
  }
}
