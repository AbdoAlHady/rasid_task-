import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  const PdfApi._();

  static Future<File> generateCenteredText(String text) async {
    final pdf = Document(); // create a new pdf document
    // add a page to the pdf
    pdf.addPage(Page(build: (context) {
      return Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 40),
        ),
      );
    }));

    // save the pdf to a file
    return saveDocument(pdfName: 'my_example.pdf', pdf: pdf);
  }

// save the pdf to a file

  static Future<File> saveDocument(
      {required String pdfName, required Document pdf}) async {
    // save the pdf and get the file bytes
    final bytes = await pdf.save();

    // Apllication directory
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$pdfName');
    await file.writeAsBytes(bytes);

    return file;
  }

  // Open the PDF file

  static Future openFile(File file) async {
    // file path
    final path = file.path;

    await OpenFile.open(path);
  }
}
