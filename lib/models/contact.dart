class Contact {
  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.notes,
    this.images = const [],
  });

  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String notes;
  final List<String> images;

  factory Contact.fromJson(Map<String, dynamic> json) {
    List<String> _images = [];

    if (json.containsKey('images') && (json['images'] is List)) {
      final List<dynamic> _list = json['images'];
      for (String? value in _list) {
        if ((value?.isNotEmpty ?? false) && value != 'NULL') {
          _images.add(value!);
        }
      }
    }
    return Contact(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      notes: json['notes'] ?? '',
      images: _images,
    );
  }
}
