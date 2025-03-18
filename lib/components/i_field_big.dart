import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iFieldBig(BuildContext context, TextEditingController ctlr,
    FocusNode focusNode, String label,
    {TextInputType keybType = TextInputType.text,
    Function(String)? onChanged,
    FocusNode? nextfocusNode}) {
  return TextFormField(
    controller: ctlr,
    focusNode: focusNode,
    keyboardType: keybType,
    decoration: InputDecoration(
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
        maxLines: 3,
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff3b7d24), width: 2),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xff3b7d24), width: 2),
      ),
    ),
    cursorColor: Color(0xff3b7d24),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
    ],
    style: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    onChanged: onChanged,
    onFieldSubmitted: (_) {
      FocusScope.of(context).requestFocus(nextfocusNode);
    },
    validator: (value) =>
        value == null || value.isEmpty ? 'Campo requerido' : null,
  );
}
