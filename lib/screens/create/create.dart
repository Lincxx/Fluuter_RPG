// create screen widget

import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Characters Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            //welcome message
            const Center(
              child: Icon(Icons.code, color: AppColors.primaryColor),
            ),
            const Center(
              child: StyledHeading('Welcome new player!'),
            ),
            const Center(
              child: StyledText('Create a name & slogan for your character'),
            ),
            const SizedBox(
              height: 30,
            ),
            //input fields
            TextField(
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2,
                  ),
                  label: StyledText('Character Name')),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.chat_bubble,
                  ),
                  label: StyledText('Character Slogan')),
            ),
          ],
        ),
      ),
    );
  }
}
