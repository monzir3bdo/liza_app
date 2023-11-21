import 'package:barcode_widget/barcode_widget.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../products/domain/entities/product.dart';

createPage({required List<Product> products, required String totalPrice}) {
  final tableHeaders = [
    'Description',
    'Quantity',
    'Unit Price',
    'Total',
  ];
  final data = products
      .map((product) => [
            product.title,
            product.quantity,
            product.price,
            product.price * product.quantity
          ])
      .toList();
  return pw.MultiPage(
    build: (context) {
      return [
        pw.Row(
          children: [
            pw.SizedBox(width: 1 * PdfPageFormat.mm),
            pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'INVOICE',
                  style: pw.TextStyle(
                    fontSize: 17.0,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'Laza App',
                  style: const pw.TextStyle(
                    fontSize: 15.0,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
            pw.Spacer(),
            pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Customer Name',
                  style: pw.TextStyle(
                    fontSize: 15.5,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'customer email',
                ),
                pw.Text(
                  DateTime.now().toString(),
                ),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.Divider(),
        pw.SizedBox(height: 1 * PdfPageFormat.mm),
        pw.SizedBox(height: 5 * PdfPageFormat.mm),
        pw.TableHelper.fromTextArray(
          headers: tableHeaders,
          data: data,
          border: null,
          headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
          cellHeight: 30.0,
          cellAlignments: {
            0: pw.Alignment.centerLeft,
            1: pw.Alignment.centerLeft,
            2: pw.Alignment.centerRight,
            3: pw.Alignment.centerRight,
          },
        ),
        pw.Divider(),
        pw.Container(
          alignment: pw.Alignment.centerRight,
          child: pw.Row(
            children: [
              pw.Spacer(flex: 6),
              pw.Expanded(
                flex: 4,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Divider(),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Text(
                            'Total amount due',
                            style: pw.TextStyle(
                              fontSize: 14.0,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                        pw.Text(
                          totalPrice,
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 2 * PdfPageFormat.mm),
                    pw.Container(height: 1, color: PdfColors.grey400),
                    pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                    pw.Container(height: 1, color: PdfColors.grey400),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];
    },
    footer: (context) {
      return pw.Column(
        mainAxisSize: pw.MainAxisSize.min,
        children: [
          pw.Divider(),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Text(
            'Laza App',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'Address: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'Sudan,East Nile',
              ),
            ],
          ),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'Email: ',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                'laza@gmail.com',
              ),
            ],
          ),
          pw.SizedBox(height: 5 * PdfPageFormat.mm),
          pw.Align(
            alignment: pw.Alignment.bottomRight,
            child: pw.SizedBox(
              height: 100,
              width: 200,
              child: pw.BarcodeWidget(
                data: 'invoice',
                color: PdfColor.fromHex("#000000"),
                barcode: Barcode.code128(),
              ),
            ),
          )
        ],
      );
    },
  );
}
