import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter/material.dart';
import 'components/SimpleRoundButton.dart';

class CrudCandidata extends StatefulWidget {
  @override
  _CrudCandidataState createState() => _CrudCandidataState();
}

class _CrudCandidataState extends State<CrudCandidata> {
  String _cidade;
  String _estado;
  String _email;
  String _militancia;
  String _filiada;
  String _partido;
  String _nome;
  String _cidadeResult;
  String _estadoResult;
  String _emailResult;
  String _militanciaResult;
  String _filiadaResult;
  String _partidoResult;
  String _nomeResult;
  List _causasSociais;
  String _causasSociaisResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cidade = '';
    _estado = '';
    _email = '';
    _militancia = '';
    _filiada = '';
    _partido = '';
    _nome = '';
    _causasSociais = [];
    _cidadeResult = '';
    _estadoResult = '';
    _emailResult = '';
    _militanciaResult = '';
    _filiadaResult = '';
    _partidoResult = '';
    _nomeResult = '';
    _causasSociaisResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _cidadeResult = _cidade;
        _estadoResult = _estado;
        _emailResult = _email;
        _militanciaResult = _militancia;
        _filiadaResult = _filiada;
        _partidoResult = _partido;
        _nomeResult = _nome;
        _causasSociaisResult = _causasSociais.toString();
      });
      debugPrint(_causasSociaisResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Candidata'),
        backgroundColor: Color.fromRGBO(95, 35, 99, 10),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            required: true,
                            filled: false,
                            titleText: 'Estado onde vota',
                            hintText: 'Escolha seu Estado',
                            value: _estado,
                            onSaved: (value) {
                              setState(() {
                                _estado = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _estado = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Pernambuco",
                                "value": "Pernambuco",
                              },
                              {
                                "display": "Alagoas",
                                "value": "Alagoas",
                              }
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            required: true,
                            filled: false,
                            titleText: 'Cidade onde vota',
                            hintText: 'Escolha sua cidade',
                            value: _cidade,
                            onSaved: (value) {
                              setState(() {
                                _cidade = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _cidade = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Recife",
                                "value": "Recife",
                              },
                              {
                                "display": "JoaoPessoa",
                                "value": "JoaoPessoa",
                              }
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            required: true,
                            filled: false,
                            titleText: 'Fez militancia?',
                            hintText: 'Selecione',
                            value: _militancia,
                            onSaved: (value) {
                              setState(() {
                                _militancia = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _militancia = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Sim",
                                "value": "Sim",
                              },
                              {
                                "display": "Não",
                                "value": "Não",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            required: true,
                            filled: false,
                            titleText: 'É filiada a partido',
                            hintText: 'Selecione',
                            value: _filiada,
                            onSaved: (value) {
                              setState(() {
                                _filiada = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _filiada = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Sim",
                                "value": "Sim",
                              },
                              {
                                "display": "Não",
                                "value": "Não",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _filiada=='Sim',
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(

                            padding: EdgeInsets.all(6),
                            child: DropDownFormField(
                              filled: false,
                              required: true,
                              titleText: 'Partido',
                              hintText: 'Selecione',
                              value: _partido,
                              onSaved: (value) {
                                setState(() {
                                  _partido = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  _partido = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "PT",
                                  "value": "PT",
                                },
                                {
                                  "display": "PCB",
                                  "value": "PCB",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: MultiSelectFormField(
                        textField: 'display',
                        valueField: 'value',
                        titleText: 'Causas Sociais',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCELAR',
                        hintText: 'Selecione uma ou mais causas que apoia',
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return 'Please select one or more options';
                          }
                        },
                        required: true,
                        change: (value){
                          if (value == null) return;
                          setState(() {
                            _causasSociais = value;
                          });
                        },
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _causasSociais = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "Aborto",
                            "value": "Aborto",
                          },
                          {
                            "display": "Igualdade",
                            "value": "Igualdade",
                          },
                          {
                            "display": "Oportunidades",
                            "value": "Oportunidades",
                          },
                          {
                            "display": "Liberdade",
                            "value": "Liberdade",
                          },
                        ],
                      )
                  ),
                  Container(
                      child: MultiSelectFormField(
                        textField: 'display',
                        valueField: 'value',
                        titleText: 'Meios de Colaboracao',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCELAR',
                        hintText: 'Selecione um ou mais meios de colaboracao',
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return 'Please select one or more options';
                          }
                        },
                        required: true,
                        change: (value){
                          if (value == null) return;
                          setState(() {
                            _causasSociais = value;
                          });
                        },
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _causasSociais = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "Panfletagem",
                            "value": "Panfletagem",
                          },
                          {
                            "display": "Passeatas",
                            "value": "Passeatas",
                          },
                          {
                            "display": "Apoio em mídias sociais",
                            "value": "Midias",
                          },
                          {
                            "display": "Doação para campanha",
                            "value": "Doação",
                          },
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Digite seu E-mail"
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Digite seu nome"
                      ),
                      onChanged: (value) {
                        setState(() {
                          _nome = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _nome = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: (_deviceHeight/6).floor().floorToDouble()
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SimpleRoundButton(
                            onPressed: () => null,
                            buttonText: Text("Cadastrar",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
