import 'package:conversor_moeda/constants.dart';
import 'package:conversor_moeda/screens/loaded_page.dart';
import 'package:conversor_moeda/screens/loading_page.dart';
import 'package:conversor_moeda/screens/not_found_page.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('\$ Conversor em tempo real \$'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: MyMainPage(),
    );
  }
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  double dolar, euro;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return NotFoundPage();
            break;
          case ConnectionState.waiting:
            return LoadingPage();
            break;
          case ConnectionState.active:
            return LoadingPage();
            break;
          case ConnectionState.done:
            dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
            euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
            return LoadedPage(dolar, euro);
            break;
          default:
            if (snapshot.hasError) {
              return Text('Erro ao carregar');
            } else {
              dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
              euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
              return LoadedPage(dolar, euro);
            }
        }
      },
    );
  }
}

Future<Map> getData() async {
  String request =
      'https://api.hgbrasil.com/finance?format=json-cors&key=f998bad4';
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
