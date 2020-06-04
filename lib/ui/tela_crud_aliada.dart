import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:aliadasapp/classesDto/cidade.dart';
import 'package:aliadasapp/classesDto/estado.dart';
import 'package:aliadasapp/classesDto/meios_colaboracao.dart';
import 'package:aliadasapp/classesDto/partido.dart';
import 'package:aliadasapp/classesDto/perfil_aliada.dart';
import 'package:aliadasapp/services/causas_sociais_service.dart';
import 'package:aliadasapp/services/cidade_service.dart';
import 'package:aliadasapp/services/estado_service.dart';
import 'package:aliadasapp/services/meios_colaboracao_service.dart';
import 'package:aliadasapp/services/partido_service.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:flutter/material.dart';
import 'components/SimpleRoundButton.dart';
import 'dart:convert';

class CrudAliada extends StatefulWidget {
  @override
  _CrudAliadaState createState() => _CrudAliadaState();
}

class _CrudAliadaState extends State<CrudAliada> {
  int _cidade;
  List _cidadeData;
  int _cidadeResult;
  int _estado;
  List _estadoData;
  int _estadoResult;
  String _email;
  String _militancia;
  String _filiada;
  int _partido;
  List _partidoData;
  int _partidoResult;
  String _nome;
  String _emailResult;
  String _militanciaResult;
  String _filiadaResult;
  String _nomeResult;
  List _causasSociaisData;
  List _causasSociais;
  List _causasSociaisResult;
  List _meiosColaboracaoData;
  List _meiosColaboracao;
  List _meiosColaboracaoResult;
  String _password;
  String _passwordConfirm;
  String _passwordResult;
  String _passwordConfirmResult;
  PerfilAliada _perfilAliada = PerfilAliada();

  final formKey = new GlobalKey<FormState>();

  _getCausasSociais() {
    CausasSociaisService.getCausasSociais().then((response) {
      setState(() {
        _causasSociaisData = response;
      });
    });
  }

  _getMeiosColaboracao() {
    MeiosColaboracaoService.getMeiosColaboracao().then((response) {
      setState(() {
        _meiosColaboracaoData = response;
      });
    });
  }

  _getEstado() {
    EstadoService.getEstado().then((response) {
      setState(() {
        _estadoData = response;
      });
    });
  }

  _getCidade(int codigoEstado) {
    CidadeService.getCidade(codigoEstado).then((response) {
      setState(() {
        _cidadeData = response;
      });
    });
  }
  _getPartidos() {
    PartidoService.getPartidos().then((response) {
      setState(() {
        _partidoData = response;
      });
    });
  }

  void _criarPerfilAliada() {
    _perfilAliada.nomeCompleto = _nomeResult;
    _perfilAliada.email = _emailResult;
    _perfilAliada.id = 0;
    _perfilAliada.filiadaAPartido = _filiadaResult == "Sim" ? true : false;
    _perfilAliada.fezMilitancia = _militanciaResult == "Sim" ? true : false;
    _perfilAliada.flagCompromisso = true;
    _perfilAliada.senha = _passwordResult;
    if(_perfilAliada.filiadaAPartido){
      _perfilAliada.partido = partidoDto();
    }
    _perfilAliada.causasApoiadas = causasSociaisDto();
    _perfilAliada.meiosColaboracao = meiosColaboracaoDTO();
    _perfilAliada.cidade = cidadeEstadoDTO();
  }

  Cidade cidadeEstadoDTO(){
    var filtered = _cidadeData.where((cidadeData) => _cidadeResult==(cidadeData['id'])).toList().elementAt(0);
    Cidade cidade = Cidade.init(filtered['id'], filtered['nome'], estadoDto() );
    return cidade;
  }

  Estado estadoDto(){
    var filtered = _estadoData.where((estadoData) => _estadoResult==(estadoData['id'])).toList().elementAt(0);
    Estado estado = Estado.init(filtered['id'], filtered['nome'], filtered['sigla']);
    return estado;
  }

  List<MeioColaboracao> meiosColaboracaoDTO() {
    List <MeioColaboracao> meiosColaboracaoDTO= [];
    List filtered = _meiosColaboracaoData.where((meioColaboracaoData) => _meiosColaboracaoResult.contains(meioColaboracaoData['id'])).toList();
    if(filtered!=null && filtered.length>0){
      for (var meioFiltrado in filtered) {
        MeioColaboracao meio = MeioColaboracao.init(meioFiltrado['id'], meioFiltrado['titulo'], meioFiltrado['descricao']);
        meiosColaboracaoDTO.add(meio);
      }
    }
    return meiosColaboracaoDTO;
  }

  List<CausaSocial> causasSociaisDto() {
    List <CausaSocial> causasSociaisDto= [];
    List filtered = _causasSociaisData.where((causaSocialData) => _causasSociaisResult.contains(causaSocialData['id'])).toList();
    if(filtered!=null && filtered.length>0){
      for (var causaFiltrada in filtered) {
        CausaSocial causa = CausaSocial.init(causaFiltrada['id'], causaFiltrada['titulo'], causaFiltrada['descricao']);
        causasSociaisDto.add(causa);
      }
    }
    return causasSociaisDto;
  }

  Partido partidoDto() {
    var filtered = _partidoData.where((partidoData) => _partidoResult==(partidoData['id'])).toList().elementAt(0);
    Partido partido = Partido.init(filtered['id'], filtered['numero'], filtered['sigla'], filtered['descricao']);
    return partido;
  }

  @override
  void initState() {
    super.initState();
    _cidade = null;
    _estado = null;
    _email = '';
    _militancia = '';
    _filiada = '';
    _partido = null;
    _nome = '';
    _causasSociais = [];
    _cidadeResult = null;
    _estadoResult = null;
    _emailResult = '';
    _militanciaResult = '';
    _filiadaResult = '';
    _partidoResult = null;
    _nomeResult = '';
    _causasSociaisResult = [];
    _password = '';
    _passwordConfirm = '';
    _passwordResult = '';
    _passwordConfirmResult = '';
    _getCausasSociais();
    _getMeiosColaboracao();
    _getEstado();
    _getPartidos();
  }

  _saveForm() {
    var form = formKey.currentState;
    setState(() {
      _cidadeResult = _cidade;
      _estadoResult = _estado;
      _emailResult = _email;
      _militanciaResult = _militancia;
      _filiadaResult = _filiada;
      _partidoResult = _partido;
      _nomeResult = _nome;
      _passwordResult = _password;
      _passwordConfirmResult = _passwordConfirm;
      _causasSociaisResult = _causasSociais;
      _meiosColaboracaoResult = _meiosColaboracao;
      _criarPerfilAliada();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Aliada'),
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
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Nome",
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail),
                            labelText: "E-mail",
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Senha",
                            hintText: "Digite sua senha"
                        ),
                        obscureText: true,
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
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: "Confirmar senha",
                            hintText: "Digite sua senha novamente"
                        ),
                        obscureText: true,
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            filled: false,
                            titleText: 'Estado onde vota',
                            hintText: 'Escolha seu Estado',
                            value: _estado,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _estado = value;
                                _cidadeData = _getCidade(value);
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _estado = value;
                                _cidadeData = _getCidade(value);
                              });
                            },
                            dataSource: _estadoData,
                            textField: 'nome',
                            valueField: 'id',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Visibility(
                        visible: _estado!=null && _cidadeData!=null && _cidadeData.isNotEmpty,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: DropDownFormField(
                              filled: false,
                              titleText: 'Cidade onde vota',
                              hintText: 'Escolha sua cidade',
                              value: _cidade,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _cidade = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _cidade = value;
                                });
                              },
                              dataSource: _cidadeData,
                              textField: 'nome',
                              valueField: 'id',
                            ),
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
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _militancia = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
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
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _filiada = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
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
                    visible: _filiada == 'Sim',
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
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _partido = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _partido = value;
                                });
                              },
                              dataSource: _partidoData,
                              textField: 'sigla',
                              valueField: 'id',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: MultiSelectFormField(
                          textField: 'titulo',
                          valueField: 'id',
                          titleText: 'Causas Sociais',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCELAR',
                          hintText: 'Selecione uma ou mais causas que apoia',
                          change: (value) {
                            if (value == null) return;
                            setState(() {
                              FocusScope.of(context).requestFocus(
                                  new FocusNode());
                              _causasSociais = value;
                            });
                          },
                          onSaved: (value) {
                            if (value == null) return;
                            setState(() {
                              FocusScope.of(context).requestFocus(
                                  new FocusNode());
                              _causasSociais = value;
                            });
                          },
                          dataSource: _causasSociaisData
                      )
                  ),
                  Container(
                      child: MultiSelectFormField(
                        textField: 'titulo',
                        valueField: 'id',
                        titleText: 'Meios de Colaboração',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCELAR',
                        hintText: 'Selecione um ou mais meios de colaboração',
                        change: (value) {
                          if (value == null) return;
                          setState(() {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
                            _meiosColaboracao = value;
                          });
                        },
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
                            _meiosColaboracao = value;
                          });
                        },
                        dataSource: _meiosColaboracaoData,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SimpleRoundButton(
                            onPressed: _saveForm,
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
