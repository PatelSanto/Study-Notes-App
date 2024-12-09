import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/handwritten_notes_screens/notes_lists.dart';
import 'package:study_notes/utils/constants.dart';

class HandWrittenNotesScreen extends StatelessWidget {
  const HandWrittenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AnimationLimiter(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(w / 60),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: notescards.length,
                  itemBuilder: ((context, int index) {
                    return AnimationConfiguration.staggeredGrid(
                      duration: const Duration(milliseconds: 500),
                      position: index,
                      columnCount: 3,
                      child: ScaleAnimation(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: NotesGrid(
                            title: notescards[index].title,
                            w: w,
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => NotesLists(
                                            title: notescards[index].title,
                                          ))));
                            },
                          ),
                        ),
                      ),
                    );
                  }))),
        ),
      ),
    );
  }
}

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
    required this.title,
    required this.w,
    required this.onPress,
  });

  final String title;
  final double w;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final color = Color.fromRGBO(
      random.nextInt(200),
      random.nextInt(200),
      random.nextInt(200),
      1,
    );
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(ebooks),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotesCards {
  final String title;

  NotesCards({required this.title});
}

final List<NotesCards> notescards = [
  // Sem1
  NotesCards(title: 'Communication Techniques'),
  NotesCards(title: 'Engg. Mathematics-I'),
  NotesCards(title: 'Engg. Physics-I'),
  NotesCards(title: 'Chemistry & Environmental Engg-I'),
  NotesCards(title: 'Engg. Mechanics'),
  NotesCards(title: 'Instrumentation Engg.'),
// Sem2
  NotesCards(title: 'Communicative English'),
  NotesCards(title: 'Engg. Mathematics-II'),
  NotesCards(title: 'Engg. Physics-II'),
  NotesCards(title: 'Chemistry & Environmental Engg-II'),
  NotesCards(title: 'Computer System & Programming'),
  NotesCards(title: 'Electrical & Electronics Engg.'),
//Sem3
  NotesCards(title: 'Digital Electronics'),
  NotesCards(title: 'Electronic Devices & Circuits'),
  NotesCards(title: 'Data Structure and Algorithms'),
  NotesCards(title: 'Discrete Mathematical Structures'),
  NotesCards(title: 'Mathematics III'),
  NotesCards(title: 'Management Information Systems'),
//Sem4
  NotesCards(title: 'Principles of Programming Languages'),
  NotesCards(title: 'Microprocessor and Interfaces'),
  NotesCards(title: 'Object Oriented Programming'),
  NotesCards(title: 'System Software'),
  NotesCards(title: 'Statistics and Probability Theory'),
  NotesCards(title: 'Analog & Digital Communication'),
//Sem5
  NotesCards(title: 'Software Engineering'),
  NotesCards(title: 'Computer Architecture'),
  NotesCards(title: 'Database Management Systems'),
  NotesCards(title: 'Computer Graphics'),
  NotesCards(title: 'Telecommunication Fundamentals'),
  NotesCards(title: 'Advanced Data Structure'),
// Sem6
  NotesCards(title: 'Operating Systems'),
  NotesCards(title: 'Computer Networks'),
  NotesCards(title: 'Design & Analysis of Algorithms'),
  NotesCards(title: 'Embedded Systems'),
  NotesCards(title: 'Theory Of Computation'),
  NotesCards(title: 'Advanced Software Engineering'),
//Sem7
  NotesCards(title: 'Compiler Construction'),
  NotesCards(title: 'Data Mining And Ware Housing'),
  NotesCards(title: 'Introduction To Web Technology'),
  NotesCards(title: 'Artificial Intelligence'),
  NotesCards(title: 'Multimedia Systems'),
  NotesCards(title: 'Real Time Systems'),
//Sem8
  NotesCards(title: 'Information System and Securities'),
  NotesCards(title: 'CAD FOR VLSI Design'),
  NotesCards(title: 'Advanced computer Architectures'),
  NotesCards(title: 'Distributed Systems')
];
