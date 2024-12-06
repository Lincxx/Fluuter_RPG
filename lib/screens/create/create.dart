// create screen widget

import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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

  // handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocationSelection(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handelSubmit() {
    if (_nameController.text.trim().isEmpty) {
      //print('name must not be empty');
      //show error dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const StyledHeading('Missing Character Name'),
          content: const StyledText('Please enter a name for your character'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const StyledHeading('close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      //print('slogan must not be empty');
      //show error dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const StyledHeading('Missing Slogan'),
          content: const StyledText('Please enter a slogan for your character'),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const StyledHeading('close'),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      return;
    }

    //create character
    // characters.add(Character(
    //   name: _nameController.text.trim(),
    //   slogan: _sloganController.text.trim(),
    //   vocation: selectedVocation,
    //   id: uuid.v4(),
    // ));

    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(),
    ));

    // print('name: ${_nameController.text}');
    // print('slogan: ${_sloganController.text}');

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
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
        child: SingleChildScrollView(
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

              // Select vocation title
              const Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Choose a Vocation'),
              ),
              const Center(
                child: StyledText('This determines your available skills'),
              ),
              const SizedBox(
                height: 30,
              ),

              // vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocationSelection,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocationSelection,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocationSelection,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                onTap: updateVocationSelection,
                vocation: Vocation.wizard,
              ),

              // good luck message
              const Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Good Luck'),
              ),
              const Center(
                child: StyledText('And enjoy the journey!'),
              ),
              const SizedBox(
                height: 30,
              ),

              // submit button
              Center(
                  child: StyledButton(
                onPressed: handelSubmit,
                child: const StyledHeading('Create Character'),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
