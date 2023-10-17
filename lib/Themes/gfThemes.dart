// ignore_for_file: file_names, unnecessary_this, prefer_const_constructors, use_key_in_widget_constructors, no_logic_in_create_state, prefer_is_empty,  unnecessary_string_interpolations,  unnecessary_overrides, avoid_print, prefer_typing_uninitialized_variables, prefer_final_fields, sized_box_for_whitespace, deprecated_member_use, prefer_void_to_null, avoid_returning_null_for_void, constant_identifier_names, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers, prefer_adjacent_string_concatenation, prefer_if_null_operators, prefer_null_aware_operators, prefer_const_declarations, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_conditional_assignment, library_prefixes, avoid_single_cascade_in_expression_statements, prefer_collection_literals, unnecessary_const, unused_local_variable
import 'package:flutter/material.dart';

ThemeData gfTheme(BuildContext context) {
  double width = MediaQuery.of(context).size.width * 1;
  double height = MediaQuery.of(context).size.height * 1;
  return ThemeData(
    primaryColor: Color(0xFFF7941E),
    primaryColorLight: Color(0xFFFFD7D8),
    backgroundColor: Color(0XFFf2f7fa),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Color(0xFF000000), selectionHandleColor: Color(0xFF000000)),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: width*0.08, fontFamily: 'Poppins Medium'),
      headline2: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.w800, fontSize: width*0.1, fontFamily: 'Poppins Medium'),
      headline3: TextStyle(color: Colors.black26, fontWeight: FontWeight.w600, fontSize: width*0.04, fontFamily: 'Poppins Medium'),
      headline4: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: width*0.05, fontFamily: 'Poppins Medium'),
      headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: width * 0.1, fontFamily: 'Poppins Medium'),
      headline6: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.w800, fontSize: width * 0.04, fontFamily: 'Poppins Medium'),
    ),
    scaffoldBackgroundColor: Colors.white,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.normal, fontSize: 16,fontFamily:'Poppins Medium'),
      contentTextStyle:  TextStyle(color: Color(0xFF000000), fontSize: 16),

    ),
  );
}
