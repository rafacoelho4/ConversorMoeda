import 'package:conversor_moeda/constants.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
          Divider(),
          // Icon(
          //   Icons.monetization_on,
          //   color: kPrimaryColor,
          //   size: 110.0,
          // ),
          Divider(),
          Text(
            'Erro ao carregar aplicação',
            style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
          Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/404_not_found.png'),
              ))),
        ],
      ),
    );
  }
}
