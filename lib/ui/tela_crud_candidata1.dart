import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter/material.dart';
import 'components/SimpleRoundButton.dart';

class CrudCandidata1 extends StatefulWidget {
  @override
  _CrudCandidata1State createState() => _CrudCandidata1State();
}

class _CrudCandidata1State extends State<CrudCandidata1> {
  String _cidade;
  String _estado;
  String _email;
  String _primeiraCandidatura;
  String _jaEleita;
  String _partido;
  String _nome;
  String _password;
  String _passwordConfirm;
  String _cargoEleicao;
  String _cargoEleito;
  String _cidadeResult;
  String _estadoResult;
  String _emailResult;
  String _primeiraCandidaturaResult;
  String _jaEleitaResult;
  String _partidoResult;
  String _nomeResult;
  List _causasSociais;
  List _meiosColaboracao;
  String _causasSociaisResult;
  String _meiosColaboracaoResult;
  String _passwordResult;
  String _passwordConfirmResult;
  String _cargoEleicaoResult;
  String _cargoEleitoResult;
  String _numero;
  String _numeroResult;

  void _montarPerfilCandidata(){

  }

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cidade = '';
    _estado = '';
    _email = '';
    _primeiraCandidatura = '';
    _jaEleita = '';
    _partido = '';
    _nome = '';
    _password = '';
    _passwordConfirm = '';
    _causasSociais = [];
    _meiosColaboracao = [];
    _cidadeResult = '';
    _estadoResult = '';
    _emailResult = '';
    _primeiraCandidaturaResult = '';
    _jaEleitaResult = '';
    _partidoResult = '';
    _nomeResult = '';
    _causasSociaisResult = '';
    _meiosColaboracaoResult = '';
    _passwordResult = '';
    _passwordConfirmResult = '';
    _cargoEleicao = '';
    _cargoEleicaoResult = '';
    _cargoEleito = '';
    _cargoEleitoResult = '';
    _numero = '';
    _numeroResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _cidadeResult = _cidade;
        _estadoResult = _estado;
        _emailResult = _email;
        _primeiraCandidaturaResult = _primeiraCandidatura;
        _jaEleitaResult = _jaEleita;
        _partidoResult = _partido;
        _nomeResult = _nome;
        _causasSociaisResult = _causasSociais.toString();
        _meiosColaboracaoResult = _meiosColaboracao.toString();
        _passwordResult = _password;
        _passwordConfirmResult = _passwordConfirm;
        _cargoEleicaoResult = _cargoEleicao;
        _numeroResult = _numero;
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
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Número",
                          hintText: "Digite seu número de candidatura",
                          icon: Icon(Icons.code),
                        ),
                        onChanged: (value) {
                          if (value != null && value.length > 0) {
                            setState(() {
                              _numero = value;
                            });
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _numero = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nome",
                          hintText: "Digite seu nome",
                          icon: Icon(Icons.person),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          hintText: "Digite seu E-mail",
                          icon: Icon(Icons.mail),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Confirmação de senha",
                          hintText: "Digite novamente a sua senha",
                          icon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _passwordConfirm = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _passwordConfirm = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: DropDownFormField(
                            required: false,
                            filled: false,
                            titleText: 'Estado onde concorre',
                            hintText: 'Escolha seu Estado',
                            value: _estado,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _estado = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
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
                          padding: EdgeInsets.all(2),
                          child: DropDownFormField(
                            required: false,
                            filled: false,
                            titleText: 'Cidade onde concorre',
                            hintText: 'Escolha sua cidade',
                            value: _cidade,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _cidade = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
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
                          padding: EdgeInsets.all(2),
                          child: DropDownFormField(
                            required: false,
                            filled: false,
                            titleText: 'Cargo a que concorre',
                            hintText: 'Escolha o cargo a que concorre',
                            value: _cargoEleicao,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _cargoEleicao = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _cargoEleicao = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Vereadora",
                                "value": "Vereadora",
                              },
                              {
                                "display": "Prefeita",
                                "value": "Prefeita",
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
                          padding: EdgeInsets.all(2),
                          child: DropDownFormField(
                            required: false,
                            filled: false,
                            titleText: 'Primeira Candidatura?',
                            hintText: 'Selecione',
                            value: _primeiraCandidatura,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _primeiraCandidatura = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                _primeiraCandidatura = value;
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
                      Visibility(
                        visible: _primeiraCandidatura == 'Não',
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: DropDownFormField(
                              required: false,
                              filled: false,
                              titleText: 'Já foi eleita antes?',
                              hintText: 'Selecione',
                              value: _jaEleita,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _jaEleita = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _jaEleita = value;
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
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _jaEleita == 'Sim',
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: DropDownFormField(
                              filled: false,
                              required: false,
                              titleText: 'Para qual cargo?',
                              hintText: 'Selecione',
                              value: _cargoEleito,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _cargoEleito = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _cargoEleito = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Vereadora",
                                  "value": "Vereadora",
                                },
                                {
                                  "display": "Prefeita",
                                  "value": "Prefeita",
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
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
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
                      required: false,
                      change: (value) {
                        if (value == null) return;
                        setState(() {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _causasSociais = value;
                        });
                      },
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          FocusScope.of(context).requestFocus(new FocusNode());
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
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                        child: MultiSelectFormField(
                      textField: 'display',
                      valueField: 'value',
                      titleText: 'Meios de Colaboração',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCELAR',
                      hintText: 'Selecione um ou mais meios de colaboração',
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Please select one or more options';
                        }
                      },
                      required: false,
                      change: (value) {
                        if (value == null) return;
                        setState(() {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _meiosColaboracao = value;
                        });
                      },
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          _meiosColaboracao = value;
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
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    //only(top: (_deviceHeight / 20).floor().floorToDouble()),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SimpleRoundButton(
                            onPressed: () => null,
                            buttonText: Text(
                              "Cadastrar",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
