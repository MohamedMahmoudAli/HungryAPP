import 'package:flutter/material.dart';

class UserTextformfield extends StatelessWidget {
  const UserTextformfield({
    super.key,
    required this.controller,
    required this.name,
  });
  final TextEditingController controller;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      cursorHeight: 15,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
