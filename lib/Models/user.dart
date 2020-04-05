import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String email;
  final String photoUrl;

  UserModel(
      {Key hey,
      @required this.name,
      @required this.email,
      @required this.photoUrl});
}
