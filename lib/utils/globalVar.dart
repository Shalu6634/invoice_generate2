import 'package:flutter/material.dart';


class IinvoiceModel {
  String? itemName;
  double? price;
  String? details;

  IinvoiceModel({this.itemName, this.price, this.details});
}

List invoiceListlast = [
  IinvoiceModel(itemName: 'Account Number', details: '1234 1234'),
  IinvoiceModel(itemName: 'Account Name', details: 'ADAM FAMILY TRUST'),
];


double value = 0;

class InvoiceModel {
  String? txt;
  double? txtPrice;

  InvoiceModel({this.txtPrice, this.txt});
}

List ItemList = [
  InvoiceModel(txt: 'Technical Engagement', txtPrice: 120),
  InvoiceModel(txt: 'Deployment Assistance', txtPrice: 200),
  InvoiceModel(txt: 'Develop Software Solution', txtPrice: 3020.45),
  InvoiceModel(txt: 'Produce Documentation', txtPrice: 840.5),
];

class DataModel {
  String? name;
  String? data;
  double? price;

  DataModel({this.price, this.name, this.data});
}

List DataList = [
  DataModel(
      name: 'David Thomas',
      price: 4180.95,
      data: 'Create and deploy software package'),
  DataModel(
      name: 'Michael Ambiguous',
      price: 193.55,
      data: 'Provider remote support after lunch'),
  DataModel(
      name: 'Marty McDanceFace',
      price: 561.05,
      data: 'Create software to teach robots how to dance'),
];

int selectIndex = 0;