import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulkeler/ulke.dart';

class DetaySayfasi extends StatefulWidget {

  final Ulke _ulke;
  DetaySayfasi(this._ulke);
  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
      title: Text(widget._ulke.isim,style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
    );
  }
  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 32,
        ),
        _buildBayrak(),
        SizedBox(height: 24,),
        _buildUlkeIsmiText(),
        SizedBox(height: 36,),
        _buildTumDetaylar(),
      ],
    );
  }
  Widget _buildTumDetaylar(){
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Column(
        children: [
        _buildUlkeIsmiRow("Ülke İsmi:",widget._ulke.isim),
        _buildUlkeIsmiRow("Başkent:",widget._ulke.baskent),
        _buildUlkeIsmiRow("Bölge:",widget._ulke.bolge),
        _buildUlkeIsmiRow("Nüfus:",widget._ulke.nufus.toString()),
        _buildUlkeIsmiRow("Dil:",widget._ulke.dil),
        ],
        ),
    );
}
  Widget _buildBayrak(){
    return Image.network(
        widget._ulke.bayrak,
      width: MediaQuery.sizeOf(context).width/2,
    );
  }
  Widget _buildUlkeIsmiText(){
    return Text(widget._ulke.isim,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
  }
  Widget _buildUlkeIsmiRow(String baslik,String detay){

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
              baslik,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(width: 32),
        Expanded(
          flex: 3,
            child: Text(
          detay,
          style: TextStyle(
            fontSize: 22,
          ),
        )),
      ],
    );
  }
}
