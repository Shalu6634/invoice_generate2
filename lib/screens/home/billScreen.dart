import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../utils/globalVar.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => genratepdf(),
      ),
    );
  }
}

Future<Uint8List> genratepdf() async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        children: [
          pw.SizedBox(
            height: 10,
          ),
          pw.SizedBox(
            height: 50,
          ),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(20),
                    child: pw.Text('INVOICE FOR PAYMENT',
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold)),
                  ),
                  pw.SizedBox(width: 150)
                ],
              ),
              ...List.generate(
                ItemList.length,
                    (index) => pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text('${ItemList[index].txt.toString()}',
                          style: pw.TextStyle(fontSize: 20)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text('\$${ItemList[index].txtPrice}',
                          style: pw.TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('TEX',
                        textAlign: pw.TextAlign.end,
                        style: pw.TextStyle(fontSize: 20)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child:
                    pw.Text('\$418.10', style: pw.TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('TOTAL',
                        textAlign: pw.TextAlign.end,
                        style: pw.TextStyle(fontSize: 20)),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(10),
                    child: pw.Text('\$${DataList[selectIndex].price + 418.10}',
                        style: pw.TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 30),
          pw.Text(
            'THANK YOU FOR YOUR BUSINESS!',
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(
              fontSize: 17.5,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'Please forward the below slip to your accounts payable department',
            textAlign: pw.TextAlign.center,
            style: const pw.TextStyle(fontSize: 15),
          ),
          pw.Divider(),
          pw.SizedBox(height: 30),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.black),
            children: [
              ...List.generate(
                invoiceListlast.length,
                    (index) => pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(invoiceListlast[index].itemName.toString(),
                          style: pw.TextStyle(fontSize: 20)),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(
                          '${(index != 2) ? invoiceListlast[index].details : invoiceListlast[index].price}',
                          style: pw.TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Text('Total Amount to be Paid',
                        style: pw.TextStyle(fontSize: 20)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(5),
                    child: pw.Text(
                      '\$${DataList[selectIndex].price + 418.10}',
                      style: const pw.TextStyle(
                          fontSize: 20, color: PdfColors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
          pw.SizedBox(height: 30),
          pw.Padding(
            padding: pw.EdgeInsets.all(10),
            child: pw.Text(
              'Please ensure all checks are payable to the ADAM FAMILY\nTRUST',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
  return pdf.save();
}
