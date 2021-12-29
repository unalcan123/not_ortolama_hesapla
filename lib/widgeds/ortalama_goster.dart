import 'package:flutter/material.dart';
import 'package:not_ortolama_hesapla/constans/app_constants.dart';

class OrtalamamGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamamGoster(
      {Key? key, required this.dersSayisi, required this.ortalama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders girildi' : 'Ders Seciniz',
          style: Sabitler.ortalamaGosterStyle,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          'Ortalama',
          style: Sabitler.ortalamaGosterStyle,
        ),
      ],
    );
  }
}
