import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/auth/login.dart';
import 'package:pdfreader/pdfall/pdfassets.dart';
import 'package:pdfreader/pdfall/pdfstorage.dart';
import 'package:pdfreader/pdfall/pdfurl.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:pdfreader/helper/uihelper.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  TextEditingController urlcontroller = TextEditingController();
  void pdfviewer() {
    if (urlcontroller.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pdfurl(pdfurl: urlcontroller.text),
        ),
      );
    } else {
      Uihelper.customAlertBox(context, "Enter enter valid url");
    }
  }

  logOut() async {
    FirebaseAuth.instance.signOut();

    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyloginPage()),
    );
  }

  late File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("PDF VIEWER", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 190, 16, 3),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            logOut();
          });
        },
        label: Text("logut"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: urlcontroller,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Enter PDF URL',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: pdfviewer,
              icon: Icon(Icons.picture_as_pdf),
              label: Text("Open PDF"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pdfassets()),
                    );
                  },
                  icon: Icon(Icons.file_copy_sharp),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),

                  label: Text("Files"),
                ),
                SizedBox(width: 10),

                ElevatedButton.icon(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      file = File(result.files.single.path!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pdfstorage(file: file),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  label: Text("Storage"),
                  icon: Icon(Icons.storage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
