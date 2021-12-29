import 'package:flutter/material.dart';
import 'package:not_ortolama_hesapla/constans/app_constants.dart';
import 'package:not_ortolama_hesapla/widgeds/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ortalama Hesapla',
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesapla(title: Sabitler.baslikText),
      debugShowCheckedModeBanner: false,
    );
  }
}
