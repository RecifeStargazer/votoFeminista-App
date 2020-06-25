import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:aliadasapp/classesDto/cidade.dart';
import 'package:aliadasapp/classesDto/estado.dart';
import 'package:aliadasapp/classesDto/meio_contato.dart';
import 'package:aliadasapp/classesDto/meios_colaboracao.dart';
import 'package:aliadasapp/classesDto/partido.dart';
import 'package:aliadasapp/classesDto/perfil_candidata.dart';
import 'package:aliadasapp/services/causas_sociais_service.dart';
import 'package:aliadasapp/services/cidade_service.dart';
import 'package:aliadasapp/services/estado_service.dart';
import 'package:aliadasapp/services/meios_colaboracao_service.dart';
import 'package:aliadasapp/services/partido_service.dart';
import 'package:aliadasapp/services/perfil_candidata_cadastro_service.dart';
import 'package:aliadasapp/ui/components/SimpleRoundButton.dart';
import 'package:aliadasapp/ui/components/custom_dropdown_formfield.dart';
import 'package:aliadasapp/ui/components/custom_multiselect_formfield.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class CrudCandidata extends StatefulWidget {
  @override
  _CrudCandidataState createState() => _CrudCandidataState();
}

class _CrudCandidataState extends State<CrudCandidata> {
  ScrollController _scrollController = ScrollController();
  Cidade _cidade;
  List<Cidade> _cidadeData;
  Cidade _cidadeResult;
  Estado _estado;
  List<Estado> _estadoData = [];
  Estado _estadoResult;
  String _email;
  String _primeiraCandidatura;
  String _primeiroMandato;
  Partido _partido;
  List<Partido> _partidoData;
  Partido _partidoResult;
  String _nome;
  String _nomeSocial;
  String _emailResult;
  String _primeiraCandidaturaResult;
  String _primeiroMandatoResult;
  String _nomeResult;
  String _nomeSocialResult;
  List<CausaSocial> _causasSociaisData;
  List<CausaSocial> _causasSociais;
  List<CausaSocial> _causasSociaisResult;
  List<MeioColaboracao> _meiosColaboracaoData;
  List<MeioColaboracao> _meiosColaboracao;
  List<MeioColaboracao> _meiosColaboracaoResult;
  List<MeioContato> _meiosContato;
  String _password;
  String _passwordConfirm;
  String _passwordResult;
  String _passwordConfirmResult;
  String _descricaoPerfil;
  String _descricaoPerfilResult;
  String _numeroCandidatura;
  int _numeroCandidaturaResult;
  PerfilCandidata _perfilCandidata = PerfilCandidata();

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _cidade = null;
    _estado = null;
    _email = '';
    _primeiraCandidatura = '';
    _primeiroMandato = '';
    _partido = null;
    _nome = '';
    _causasSociais = [];
    _cidadeResult = null;
    _estadoResult = null;
    _emailResult = '';
    _primeiraCandidaturaResult = '';
    _primeiroMandatoResult = '';
    _partidoResult = null;
    _nomeResult = '';
    _causasSociaisResult = [];
    _password = '';
    _passwordConfirm = '';
    _passwordResult = '';
    _passwordConfirmResult = '';
    _descricaoPerfil = '';
    _descricaoPerfilResult = '';
    String _numeroCandidatura = '';
    int _numeroCandidaturaResult;
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
      _primeiraCandidaturaResult = _primeiraCandidatura;
      _primeiroMandatoResult = _primeiroMandato;
      _partidoResult = _partido;
      _nomeResult = _nome;
      _nomeSocialResult = _nomeSocial;
      _passwordResult = _password;
      _passwordConfirmResult = _passwordConfirm;
      _causasSociaisResult = _causasSociais;
      _meiosColaboracaoResult = _meiosColaboracao;
      _descricaoPerfilResult = _descricaoPerfil;
      _numeroCandidaturaResult = int.parse(_numeroCandidatura);
      debugPrint(_perfilCandidata.toJson().toString());
      _criarPerfilCandidata();
    });
  }

  _postCadastrarPerfil(PerfilCandidata perfilCandidata){
    Future<PerfilCandidata> perfilCandidataCadastrado = CadastroCandidataService.postCadastrarCandidata(perfilCandidata);
    debugPrint(perfilCandidataCadastrado.toString());
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

  void _criarPerfilCandidata() {
    _perfilCandidata.nomeCompleto = _nomeResult;
    _perfilCandidata.nomeSocial = _nomeSocialResult;
    _perfilCandidata.numeroCandidata = _numeroCandidaturaResult;
    _perfilCandidata.email = _emailResult;
    _perfilCandidata.id = 0;
    _perfilCandidata.primeiroMandato = _primeiroMandatoResult == "Sim" ? true : false;
    _perfilCandidata.primeiraCandidatura = _primeiraCandidaturaResult == "Sim" ? true : false;
    _perfilCandidata.flagCompromisso = true;
    _perfilCandidata.senha = _passwordResult==_passwordConfirmResult && _password.length>0?_passwordResult: _password;
    _perfilCandidata.partido = _partidoResult;
    _perfilCandidata.causasApoiadas = _causasSociaisResult;
    _perfilCandidata.meiosColaboracao = _meiosColaboracaoResult;
    _perfilCandidata.cidade = _cidadeResult;
    _perfilCandidata.descricaoPerfil = _descricaoPerfilResult;
    _postCadastrarPerfil(_perfilCandidata);

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
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            labelText: "Numero",
                            hintText: "Digite o número de sua candidatura"
                        ),
                        onChanged: (value) {
                          setState(() {
                            _numeroCandidatura = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _numeroCandidatura = value;
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
                            icon: Icon(Icons.person),
                            labelText: "Nome social/candidatura",
                            hintText: "Digite seu nome usado na candidatura"
                        ),
                        onChanged: (value) {
                          setState(() {
                            _nomeSocial = value;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _nomeSocial = value;
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
                        keyboardType: TextInputType.emailAddress,
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
                              titleText: 'Estado onde concorre',
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
                              titleText: 'Cidade onde concorre',
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
                            titleText: 'Primeira Candidatura?',
                            hintText: 'Selecione',
                            value: _primeiraCandidatura,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _primeiraCandidatura = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
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

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6),
                          child: DropDownFormField(
                            required: true,
                            filled: false,
                            titleText: 'Já foi eleita antes?',
                            hintText: 'Selecione',
                            value: _primeiroMandato,
                            onSaved: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _primeiroMandato = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                FocusScope.of(context).requestFocus(
                                    new FocusNode());
                                _primeiroMandato = value;
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
                  Row(
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
                  Container(
                      padding: EdgeInsets.all(6),
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
                      padding: EdgeInsets.all(6),
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
                            onPressed: () {
                              _saveForm();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => null),
                              );
                            },
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
