
import 'package:flutter/material.dart';

import 'components/SimpleRoundButton.dart';

class TelaLoginCadastro extends StatefulWidget {
  @override
  _TelaLoginCadastroState createState() => _TelaLoginCadastroState();
}

class _TelaLoginCadastroState extends State<TelaLoginCadastro> {
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/background.jpeg',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: (_deviceHeight/5).floor().floorToDouble()
                ),
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
                                  onPressed: () => null,
                                  buttonText: Text("Entrar",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),),
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
                                  onPressed: () => null,
                                  buttonText: Text("Cadastre-se",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),),
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
          )),
    );
  }
}
