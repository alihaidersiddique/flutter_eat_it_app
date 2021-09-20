import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eat_it_app/strings/restaurant_home_strings.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesMenuWidget extends StatelessWidget {
  const CategoriesMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.list, color: Colors.white),
            SizedBox(width: 30),
            Text(
              categoryText,
              style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
