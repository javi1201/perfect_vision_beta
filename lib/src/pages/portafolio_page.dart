import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PortafolioPage extends StatefulWidget {
  const PortafolioPage({Key? key});

  @override
  State<PortafolioPage> createState() => _PortafolioPageState();
}

class _PortafolioPageState extends State<PortafolioPage> {
  late final PdfController pdfController;
  late final PdfControllerPinch pdfPinchController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfController(
      document: PdfDocument.openAsset('data/assets/pdf/revista.pdf'),
    );
    pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openAsset('data/assets/pdf/revista.pdf'),
    );
  }

  @override
  void dispose() {
    pdfController.dispose();
    pdfPinchController.dispose();
    super.dispose();
  }

  void jumpToFirstPage() {
    pdfController.jumpToPage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portafolio PV'),
        backgroundColor: const Color.fromRGBO(0, 67, 130, 1.0),
        actions: [
          IconButton(
            icon: const Icon(Icons.first_page, size: 30),
            onPressed: jumpToFirstPage,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('Simple PDF Viewer'),
            //SizedBox(height: 16),
            Expanded(
              child: PdfView(
                controller: pdfController,
                scrollDirection: Axis.vertical,
                onPageChanged: (page) {
                  //print('Current page: $page');
                },
              ),
            ),
            /*SizedBox(height: 32),
            Text('PDF Viewer with Pinch Zoom'),
            SizedBox(height: 16),
            Expanded(
              child: PdfViewPinch(
                controller: pdfPinchController,
                onPageChanged: (zoom) {
                  print('Current zoom: $zoom');
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
