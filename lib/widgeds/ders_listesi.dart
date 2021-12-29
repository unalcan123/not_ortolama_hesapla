import 'package:flutter/material.dart';
import 'package:not_ortolama_hesapla/constans/app_constants.dart';
import 'package:not_ortolama_hesapla/helper/data_helper.dart';
import 'package:not_ortolama_hesapla/model/ders.dart';

class DersListesi extends StatefulWidget {
  const DersListesi({Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.green,
                ),
                key: UniqueKey(),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    tumDersler.removeAt(index);
                  });
                },
                direction: DismissDirection.startToEnd,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        tumDersler[index].ad,
                        style: Sabitler.listtileTitleStyle,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                        'Kredi degeri:'
                        ' ${tumDersler[index].krediDegeri}\nNot Degeri:'
                        ' ${tumDersler[index].harfDegeri}',
                        style: Sabitler.listtileStyle,
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
              child: Text(
                'Lutfen Ders Ekleyiniz',
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}
