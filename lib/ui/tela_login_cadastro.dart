import 'package:aliadasapp/ui/tela_login.dart';
import 'package:aliadasapp/ui/tela_selec_tipo_cadastro.dart';
import 'package:flutter/material.dart';

import 'components/SimpleRoundButton.dart';

class TelaLoginCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromRGBO(247, 247, 247, 50),
      child: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 70, right: 8, left: 8, bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'asset/background.png',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: (_deviceHeight / 7).floor().floorToDouble()),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SimpleRoundButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaLogin()),
                                );
                              },
                              buttonText: Text(
                                "Entrar",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              backgroundColor: Color.fromRGBO(95, 35, 99, 10),
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SimpleRoundButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaTipoCadastro()),
                                );
                              },
                              buttonText: Text(
                                "Cadastre-se",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              backgroundColor: Color.fromRGBO(95, 35, 99, 10),
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
