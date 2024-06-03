import 'package:flutter/material.dart';
import 'package:invoice_generate2/screens/home/billScreen.dart';
import 'package:invoice_generate2/screens/home/detailScreen.dart';
import 'package:invoice_generate2/screens/home/homePage.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)>routes = {
    '/':(context)=>HomeScreen(),
    '/detail':(context)=>DetailScreen(),
    '/pdf':(context)=>BillScreen(),

  };
}