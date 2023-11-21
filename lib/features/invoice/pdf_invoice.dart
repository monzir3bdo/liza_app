import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

import '../products/domain/entities/product.dart';
import 'create_page.dart';

class PdfInvoice {
  final List<Product> products;
  final String totalPrice;

  PdfInvoice({required this.products, required this.totalPrice});
  Future<File> createPdf() async {
    Document pdf = Document();
    pdf.addPage(createPage(products: products, totalPrice: totalPrice));
    return _saveDocument(name: 'invoice', pdf: pdf);
  }

  static Future<File> _saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getExternalStorageDirectory();
    final file = File('${dir?.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static openFile(File file) async {
    final path = file.path;
    await OpenFile.open(path);
  }
}
