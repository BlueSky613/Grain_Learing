import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iField(TextEditingController ctlr, String label,
    {TextInputType keybType = TextInputType.text,
    Function(String)? onChanged}) {
  return TextFormField(
    controller: ctlr,
    keyboardType: keybType,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        color: Colors.black,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff3b7d24), width: 2),
      ),
    ),
    style: GoogleFonts.poppins(
      color: Colors.black,
    ),
    onChanged: onChanged,
    validator: (value) =>
        value == null || value.isEmpty ? 'Campo requerido' : null,
  );
}
