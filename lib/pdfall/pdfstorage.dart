import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Pdfstorage extends StatelessWidget {
  Pdfstorage({super.key, required this.file});
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.file(file));
  }
}
