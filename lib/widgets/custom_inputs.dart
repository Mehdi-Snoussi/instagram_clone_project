import 'package:flutter/material.dart';

class CustomInputs extends StatelessWidget {
  const CustomInputs(
      {Key? key,
      required this.hintText,
      required this.prefix,
      this.onsaved,
      required this.validator,
      required this.textInputType,
      required this.obscureText})
      : super(key: key);

  final String hintText;
  final Widget prefix;
  final Function(String?)? onsaved;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.2))
          ]),
      child: TextFormField(
        validator: validator,
        onChanged: onsaved,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1.0)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: hintText,
            prefixIcon: prefix),
      ),
    );
  }
}
