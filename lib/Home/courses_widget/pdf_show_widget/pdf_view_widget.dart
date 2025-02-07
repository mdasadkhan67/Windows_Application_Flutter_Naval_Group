import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart';
import 'pdf_show_provider.dart';

class PDFViewWidget extends StatelessWidget {
  final String pdfPath;

  const PDFViewWidget({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Trigger download when clicked
              Provider.of<PdfShowProvider>(context, listen: false)
                  .downloadPDF(pdfPath, context);
            },
          ),
        ],
      ),
      body: Consumer<PdfShowProvider>(
        builder: (context, provider, child) {
          if (provider.isDownloading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SfPdfViewer.asset(
              provider.downloadedPath.isNotEmpty
                  ? provider.downloadedPath
                  : pdfPath,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                print('PDF loaded successfully!');
              },
              enableDoubleTapZooming: true,
              enableHyperlinkNavigation: true,
              enableTextSelection: true,
              canShowPaginationDialog: true,
              canShowScrollHead: true,
              canShowScrollStatus: true,
              canShowHyperlinkDialog: true,
              maxZoomLevel: 200.0,
              initialPageNumber: 1,
            );
          }
        },
      ),
    );
  }
}
