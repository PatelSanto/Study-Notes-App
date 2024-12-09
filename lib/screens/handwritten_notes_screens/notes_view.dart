import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key, required this.pdfLocations});
  final String? pdfLocations;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset(
          pdfLocations!,
          pageSpacing: 2,
          key: ValueKey(pdfLocations),
        ),
      ),
    );
  }
}
