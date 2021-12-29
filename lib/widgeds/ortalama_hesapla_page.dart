import 'package:flutter/material.dart';
import 'package:not_ortolama_hesapla/constans/app_constants.dart';
import 'package:not_ortolama_hesapla/helper/data_helper.dart';
import 'package:not_ortolama_hesapla/model/ders.dart';
import 'package:not_ortolama_hesapla/widgeds/ders_listesi.dart';
import 'package:not_ortolama_hesapla/widgeds/ortalama_goster.dart';
import '../helper/data_helper.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _OrtalamaHesaplaState createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamamGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: DersListesi(),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: Sabitler.yatayPadding8, child: _buildTextFormField()),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: _buildHarfler(),
                ),
              ),
              _buildKrediler(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    onPressed: _dersEkleveOrtalamaHesapla,
                    icon: Icon(Icons.arrow_forward),
                    color: Sabitler.anaRenk,
                    iconSize: 30,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders adini giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: 'Matematik',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        isDense: true,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            print(secilenHarfDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        isDense: true,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
            //print(secilenKrediDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Ders? eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);

      // print(eklenecekDers);

      DataHelper.dersEkle(eklenecekDers);
      // print(DataHelper.ortalamaHesapla());
      setState(() {});
    }
  }
}
