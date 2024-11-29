// create screen widget

import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // text editing controller
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  //free up memeory when not in use
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // submit handler
  void handelSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print('name must not be empty');
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print('slogan must not be empty');
      return;
    }

    print('name: ${_nameController.text}');
    print('slogan: ${_sloganController.text}');
  }

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
              controller: _nameController,
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
              controller: _sloganController,
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.chat_bubble,
                  ),
                  label: StyledText('Character Slogan')),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: StyledButton(
              onPressed: handelSubmit,
              child: const StyledHeading('Create Character'),
            ))
          ],
        ),
      ),
    );
  }
}
