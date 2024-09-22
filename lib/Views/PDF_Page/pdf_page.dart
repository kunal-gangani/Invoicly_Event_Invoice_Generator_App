import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPreviewScreen extends StatelessWidget {
  final Map<String, dynamic> eventDetails;

  const PdfPreviewScreen({
    required this.eventDetails,
  });

  Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header Section
                pw.Container(
                  margin: const pw.EdgeInsets.only(
                    bottom: 16,
                  ),
                  width: double.infinity,
                  color: PdfColors.green,
                  child: pw.Text(
                    "INVOICLY",
                    style: pw.TextStyle(
                      fontSize: 32.sp,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.SizedBox(
                  height: 20.h,
                ),
                pw.Divider(),

                // Event Details Section
                pw.Text(
                  "Event Booking Invoice",
                  style: pw.TextStyle(
                    fontSize: 24.sp,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Text(
                  "Event: ${eventDetails['name']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.Text(
                  "Booker's Name: ${eventDetails['bookerName']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.Text(
                  "Event Date: ${eventDetails['date']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Text(
                  "Description: ${eventDetails['description']}",
                  style: pw.TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                pw.SizedBox(height: 10.h),
                pw.Divider(),

                // Billing Details Section
                pw.Text(
                  "Billing Details",
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 10.h),
                pw.Text(
                  "Expected Visitors: ${eventDetails['visitors']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Text(
                  "Total Price: \$${eventDetails['price']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.SizedBox(
                  height: 10.h,
                ),
                pw.Divider(),

                // Ratings and Notes Section
                pw.Text(
                  "Event Ratings: ${eventDetails['ratings']}",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                pw.SizedBox(
                  height: 20.h,
                ),
                pw.Text(
                  "Thank you for your booking!",
                  style: pw.TextStyle(
                    fontSize: 18.sp,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  void previewPDF(BuildContext context) async {
    final pdfData = await generatePDF();
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Invoice Generator',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            previewPDF(context);
          },
          child: const Text(
            'Generate Invoice PDF',
          ),
        ),
      ),
    );
  }
}
