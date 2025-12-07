import 'package:flutter/material.dart';

class Customtextformfield extends StatefulWidget {
  const Customtextformfield({
    super.key,
    required this.hintText,
    required this.isPassword,
    required this.controller,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  @override
  late bool obscureText;
  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill${widget.hintText} field';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,

                  color: Colors.white,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.transparent,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white, // White border when not focused
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white, // White border when focused
            width: 2,
          ),
        ),

        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
