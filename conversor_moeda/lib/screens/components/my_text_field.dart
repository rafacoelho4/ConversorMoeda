import 'package:flutter/material.dart';

import '../../constants.dart';

Widget buildTextField(
    String moeda, String prefix, TextEditingController c, Function f) {
  return TextFormField(
    autofocus: false,
    controller: c,
    onChanged: f,
    cursorColor: kPrimaryColor,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    style: TextStyle(color: kPrimaryColor),
    decoration: new InputDecoration(
      prefixText: prefix,
      fillColor: Colors.transparent,
      filled: true,
      contentPadding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      labelText: moeda,
      labelStyle: TextStyle(color: kPrimaryColor),
    ),
  );
}
