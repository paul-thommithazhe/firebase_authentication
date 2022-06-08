import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key, required this.controllerName, required this.hintText})
      : super(key: key);
  TextEditingController controllerName;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 214, 214), borderRadius: BorderRadius.circular(8)),
      child: TextField(
        controller: controllerName,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent)),
          fillColor: Colors.red,
        ),
      ),
    );
  }
}
