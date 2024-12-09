import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:study_notes/screens/programming%20languages%20screens/language_view_screen.dart';
import 'package:study_notes/screens/programming%20languages%20screens/language_description.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Programming Languages'),
        centerTitle: true,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
            padding: EdgeInsets.all(w / 30),
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: languages.length,
            itemBuilder: ((BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 2000),
                    child: Container(
                      margin: EdgeInsets.only(bottom: w / 20),
                      height: w / 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                                    builder: ((context) => DisplayModel(
                                          image: languagemodel[index].image,
                                          title1: languagemodel[index].title,
                                          details: languagemodel[index].details,
                                        ))));
                          },
                          title: Text(
                            languages[index].languageTitle,
                            style: const TextStyle(color: Colors.black),
                          ),
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

class LanguageList {
  final String languageTitle;

  LanguageList({required this.languageTitle});
}

final List<LanguageList> languages = [
  LanguageList(languageTitle: 'C'),
  LanguageList(languageTitle: 'C#'),
  LanguageList(languageTitle: 'C++'),
  LanguageList(languageTitle: 'Python'),
  LanguageList(languageTitle: 'Flutter/Dart'),
  LanguageList(languageTitle: 'JavaScript'),
  LanguageList(languageTitle: 'React'),
  LanguageList(languageTitle: 'Java'),
  LanguageList(languageTitle: 'Rust'),
  LanguageList(languageTitle: 'Perl'),
  LanguageList(languageTitle: 'Go'),
  LanguageList(languageTitle: 'Swift'),
  LanguageList(languageTitle: 'Ruby'),
  LanguageList(languageTitle: 'Kotlin'),
  LanguageList(languageTitle: 'Bash'),
  LanguageList(languageTitle: 'R'),
  LanguageList(languageTitle: '.NET'),
  LanguageList(languageTitle: 'SQL'),
  LanguageList(languageTitle: 'PHP'),
  LanguageList(languageTitle: 'Assembly Language'),
];
