import 'package:flutter/material.dart';

TextField inputLogin(TextEditingController controller, bool obscureText,
    String? text, String? pass, TextStyle style) {
  return TextField(
    controller: controller,
    onChanged: (val) => pass = val,
    obscureText: obscureText,
    //autofocus: obscureText,
    style: style,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.blueGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );
}
