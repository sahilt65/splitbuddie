// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class ContactsModel {
  String name;
  String number;
  bool isSelected;
  Uint8List? avatar;
  ContactsModel({
    required this.name,
    required this.number,
    required this.isSelected,
    this.avatar,
  });
}
