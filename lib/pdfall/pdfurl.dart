import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfurl extends StatelessWidget {
  const Pdfurl({super.key, required this.pdfurl});
  final String pdfurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SizedBox(child: SfPdfViewer.network(pdfurl)));
  }
}
