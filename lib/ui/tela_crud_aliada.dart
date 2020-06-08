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
import 'package:aliadasapp/services/perfil_aliada_cadastro_service.dart';
import 'package:aliadasapp/ui/components/SimpleRoundButton.dart';
import 'package:aliadasapp/ui/components/custom_dropdown_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:aliadasapp/ui/components/custom_multiselect_formfield.dart';

class CrudAliada extends StatefulWidget {
  @override
  _CrudAliadaState createState() => _CrudAliadaState();
}

class _CrudAliadaState extends State<CrudAliada> {
  ScrollController _scrollController = ScrollController();
  Cidade _cidade;
  List<Cidade> _cidadeData;
  Cidade _cidadeResult;
  Estado _estado;
  List<Estado> _estadoData = [];
  Estado _estadoResult;
  String _email;
  String _militancia;
  String _filiada;
  Partido _partido;
  List<Partido> _partidoData;
  Partido _partidoResult;
  String _nome;
  String _emailResult;
  String _militanciaResult;
  String _filiadaResult;
  String _nomeResult;
  List<CausaSocial> _causasSociaisData;
  List<CausaSocial> _causasSociais;
  List<CausaSocial> _causasSociaisResult;
  List<MeioColaboracao> _meiosColaboracaoData;
  List<MeioColaboracao> _meiosColaboracao;
  List<MeioColaboracao> _meiosColaboracaoResult;
  String _password;
  String _passwordConfirm;
  String _passwordResult;
  String _passwordConfirmResult;
  String _descricaoPerfil;
  String _descricaoPerfilResult;
  PerfilAliada _perfilAliada = PerfilAliada();

  final formKey = new GlobalKey<FormState>();

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
    _descricaoPerfil = '';
    _descricaoPerfilResult;
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
      _descricaoPerfilResult = _descricaoPerfil;
      _criarPerfilAliada();
    });
  }

  _postCadastrarPerfil(PerfilAliada perfilAliada){
    Future<PerfilAliada> perfilAliadaCadastrado = CadastroAliadaService.postCadastrarAliada(perfilAliada);
    debugPrint(perfilAliadaCadastrado.toString());
  }

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
    _perfilAliada.senha = _passwordResult==_passwordConfirmResult && _password.length>0?_passwordResult: _password;
    if(_perfilAliada.filiadaAPartido){
      _perfilAliada.partido = _partidoResult;
    }
    _perfilAliada.causasApoiadas = _causasSociaisResult;
    _perfilAliada.meiosColaboracao = _meiosColaboracaoResult;
    _perfilAliada.cidade = _cidadeResult;
    _perfilAliada.descricaoPerfil = _descricaoPerfilResult;
    _postCadastrarPerfil(_perfilAliada);

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
          controller: _scrollController,
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
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.message),
                            labelText: "Quer nos falar um pouco de você?",
                            hintText: "Digite uma pequena biografia"
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _descricaoPerfil = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _descricaoPerfil = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Visibility(
                        visible: _estadoData!=null && _estadoData.length>0,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: CustomDropDownFormField(
                              filled: false,
                              titleText: 'Estado onde vota',
                              hintText: 'Escolha seu Estado',
                              value: _estado!=null?_estado.id: null,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _estado = value!=null && _estadoData.where((estadoData) => value==(estadoData.id)).toList().isNotEmpty?
                                  _estadoData.where((estadoData) => value==(estadoData.id)).toList().elementAt(0): null;
                                  _cidadeData = _getCidade(value);
                                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _estado = value!=null && _estadoData.where((estadoData) => value==(estadoData.id)).toList().isNotEmpty?
                                  _estadoData.where((estadoData) => value==(estadoData.id)).toList().elementAt(0): null;
                                  _cidadeData = _getCidade(value);
                                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                });
                              },
                              dataSource: _estadoData,
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
                      Visibility(
                        visible: _estado!=null && _cidadeData!=null && _cidadeData.isNotEmpty,
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.all(6),
                            child: CustomDropDownFormField(
                              filled: false,
                              titleText: 'Cidade onde vota',
                              hintText: 'Escolha sua cidade',
                              value:  _cidade!=null?_cidade.id: null,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _cidade = value!=null && _cidadeData.where((cidadeData) => value==(cidadeData.id)).toList().isNotEmpty?
                                  _cidadeData.where((cidadeData) => value==(cidadeData.id)).toList().elementAt(0): null;
                                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _cidade = value!=null && _cidadeData.where((cidadeData) => value==(cidadeData.id)).toList().isNotEmpty?
                                  _cidadeData.where((cidadeData) => value==(cidadeData.id)).toList().elementAt(0): null;
                                  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
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
                            child: CustomDropDownFormField(
                              filled: false,
                              required: true,
                              titleText: 'Partido',
                              hintText: 'Selecione',
                              value: _partido!=null?_partido.id: null,
                              onSaved: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _partido = value!=null && _partidoData.where((partidoData) => value==(partidoData.id)).toList().isNotEmpty?
                                  _partidoData.where((partidoData) => value==(partidoData.id)).toList().elementAt(0): null;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(
                                      new FocusNode());
                                  _partido = value!=null && _partidoData.where((partidoData) => value==(partidoData.id)).toList().isNotEmpty?
                                  _partidoData.where((partidoData) => value==(partidoData.id)).toList().elementAt(0): null;
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
                      child: CustomMultiSelectFormField(
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
                              _causasSociais = value!=null && _causasSociaisData.where((causaSocialData) => value.contains(causaSocialData.id)).toList().isNotEmpty?
                              _causasSociaisData.where((causaSocialData) => value.contains(causaSocialData.id)).toList(): null;
                            });
                          },
                          onSaved: (value) {
                            if (value == null) return;
                            setState(() {
                              FocusScope.of(context).requestFocus(
                                  new FocusNode());
                              _causasSociais = value!=null && _causasSociaisData.where((causaSocialData) => value.contains(causaSocialData.id)).toList().isNotEmpty?
                              _causasSociaisData.where((causaSocialData) => value.contains(causaSocialData.id)).toList(): null;
                            });
                          },
                          dataSource: _causasSociaisData
                      )
                  ),
                  Container(
                      child: CustomMultiSelectFormField(
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
                            _meiosColaboracao = value!=null && _meiosColaboracaoData.where((meioColaboracaoData) => value.contains(meioColaboracaoData.id)).toList().isNotEmpty?
                            _meiosColaboracaoData.where((meioColaboracaoData) => value.contains(meioColaboracaoData.id)).toList(): null;
                          });
                        },
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            FocusScope.of(context).requestFocus(
                                new FocusNode());
                            _meiosColaboracao = value!=null && _meiosColaboracaoData.where((meioColaboracaoData) => value.contains(meioColaboracaoData.id)).toList().isNotEmpty?
                            _meiosColaboracaoData.where((meioColaboracaoData) => value.contains(meioColaboracaoData.id)).toList(): null;
                          });
                        },
                        dataSource: _meiosColaboracaoData,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
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
