
import 'package:flutter/material.dart';
import 'components/SimpleRoundButton.dart';


class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(
                        top: (_deviceHeight/10).floor().floorToDouble()
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(95, 35, 99, 10).withOpacity(0.5),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin:
                        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            new Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                              margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                            ),
                            new Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(95, 35, 99, 10).withOpacity(0.5),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Row(
                        children: <Widget>[
                          new Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            child: Icon(
                              Icons.lock_open,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.5),
                            margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                          ),
                          new Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: (_deviceHeight/20).floor().floorToDouble()
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
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
