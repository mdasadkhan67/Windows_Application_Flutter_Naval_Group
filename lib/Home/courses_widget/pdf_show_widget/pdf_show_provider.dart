import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfShowProvider with ChangeNotifier {
  bool _isDownloading = false;
  String _downloadedPath = '';

  bool get isDownloading => _isDownloading;
  String get downloadedPath => _downloadedPath;

  Future<void> downloadPDF(String pdfPath, BuildContext context) async {
    // Start downloading the PDF
    _isDownloading = true;
    notifyListeners();

    // Request storage permissions for Android
    if (await Permission.storage.request().isGranted) {
      // Get the app's document directory
      final Directory directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/downloaded_pdf.pdf';

      // Download PDF (copying from assets or any source to app directory)
      final File file = File(filePath);
      final ByteData data = await rootBundle.load(pdfPath);
      final List<int> bytes = data.buffer.asUint8List();

      await file.writeAsBytes(bytes);

      _downloadedPath = filePath;
      _isDownloading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF Downloaded to $filePath')),
      );
    } else {
      // If permission is not granted
      _isDownloading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission to access storage denied')),
      );
    }
  }
}
