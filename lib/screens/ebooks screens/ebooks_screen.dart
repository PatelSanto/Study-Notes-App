import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/ebooks%20screens/ebooks_grid_screen.dart';

class EBooksScreen extends StatelessWidget {
  const EBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Books'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
            padding: EdgeInsets.all(w / 30),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: semlist.length,
            itemBuilder: ((BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: -300,
                  verticalOffset: -850,
                  child: Container(
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => EBooksGrid(
                                        title: semlist[index].title,
                                      ))));
                        },
                        title: Text(
                          semlist[index].title,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}

class SemList {
  final String title;

  SemList({required this.title});
}

final List<SemList> semlist = [
  SemList(title: 'Semester I'),
  SemList(title: 'Semester II'),
  SemList(title: 'Semester III'),
  SemList(title: 'Semester IV'),
  SemList(title: 'Semester V'),
  SemList(title: 'Semester VI'),
  SemList(title: 'Semester VII'),
  SemList(title: 'Semester VIII'),
];
