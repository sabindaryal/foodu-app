import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidgets extends StatelessWidget {
  const TextFormFieldWidgets(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      required this.keyboardType,
      required this.obscureText});

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
         isCollapsed: true,
    contentPadding: EdgeInsets.all(9),
        prefix: Icon(icon),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 92, 87, 87), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        suffix: obscureText ? const Icon(Icons.remove_red_eye) : null,
        hintText: hintText,
      ),
    );
  }
}
