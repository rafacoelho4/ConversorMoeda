import 'package:conversor_moeda/constants.dart';
import 'package:conversor_moeda/screens/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoadedPage extends StatefulWidget {
  final double dolar, euro;

  LoadedPage(this.dolar, this.euro);

  @override
  _LoadedPageState createState() => _LoadedPageState();
}

class _LoadedPageState extends State<LoadedPage> {
  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / widget.dolar).toStringAsFixed(2);
    euroController.text = (real / widget.euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * widget.dolar).toStringAsFixed(2);
    euroController.text =
        (dolar * widget.dolar / widget.euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * widget.euro).toStringAsFixed(2);
    dolarController.text =
        (euro * widget.euro / widget.dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.grey[800], kBackgroundColor])),
        child: Column(
          children: <Widget>[
            Divider(),
            // Icon(
            //   Icons.monetization_on,
            //   color: kPrimaryColor,
            //   size: 110.0,
            // ),
            Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/money_jar.png'),
                ))),
            Divider(),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  buildTextField('Reais', 'R\$', realController, _realChanged),
                  Divider(),
                  buildTextField(
                      'Dólares', 'US\$', dolarController, _dolarChanged),
                  Divider(),
                  buildTextField('Euros', '€', euroController, _euroChanged),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
