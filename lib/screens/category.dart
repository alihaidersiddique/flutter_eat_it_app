import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/strings/restaurant_home_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryText,
          style: GoogleFonts.jetBrainsMono(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 10,
      ),
      body: Center(),
    );
  }
}
