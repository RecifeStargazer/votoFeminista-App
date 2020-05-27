import 'package:flutter/material.dart';

import 'components/SimpleRoundButton.dart';

class TelaTipoCadastro extends StatefulWidget {
  @override
  _TelaTipoCadastroState createState() => _TelaTipoCadastroState();
}

class _TelaTipoCadastroState extends State<TelaTipoCadastro> {
  @override
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
                padding: const EdgeInsets.all(12.0),
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
                                  buttonText: Text("Cadastrar como aliada",
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
                                  buttonText: Text("Cadastrar como candidata",
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

