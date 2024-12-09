import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SemesterSyllabus extends StatelessWidget {
  final String? pdfLocation;

  const SemesterSyllabus({Key? key, required this.pdfLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset(
          pdfLocation!,
          key: ValueKey(pdfLocation),
        ),
      ),
    );
  }
}
