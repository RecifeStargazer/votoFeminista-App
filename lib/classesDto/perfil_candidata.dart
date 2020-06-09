import 'package:aliadasapp/classesDto/meios_colaboracao.dart';
import 'package:aliadasapp/classesDto/missao.dart';
import 'package:aliadasapp/classesDto/partido.dart';
import 'package:json_annotation/json_annotation.dart';
import 'causas_sociais.dart';
import 'cidade.dart';
import 'meio_contato.dart';

part 'perfil_candidata.g.dart';
@JsonSerializable(explicitToJson:true)
class PerfilCandidata {
  int _id;
  int _numeroCandidata;
  String _email;
  String _senha;
  String _nomeCompleto;
  String _nomeSocial;
  String _idFotoPerfil;
  String _descricaoPerfil;
  String _cargoCandidata;
  bool _flagCompromisso;
  bool _primeiraCandidatura;
  bool _primeiroMandato;
  Cidade _cidade;
  Partido _partido;
  List<CausaSocial> _causasSociais;
  List<MeioColaboracao> _meiosColaboracao;
  List<Missao> _missoes;
  List<MeioContato> _meiosContato;

  PerfilCandidata();

  PerfilCandidata.init(
      this._id,
      this._numeroCandidata,
      this._email,
      this._senha,
      this._nomeCompleto,
      this._nomeSocial,
      this._idFotoPerfil,
      this._descricaoPerfil,
      this._cargoCandidata,
      this._flagCompromisso,
      this._primeiraCandidatura,
      this._primeiroMandato,
      this._cidade,
      this._partido,
      this._causasSociais,
      this._meiosColaboracao
      );

  factory PerfilCandidata.fromJson(Map<String, dynamic> json) => _$PerfilCandidataFromJson(json);

  Map<String, dynamic> toJson() => _$PerfilCandidataToJson(this);

  List<MeioContato> get meiosContato => _meiosContato;

  set meiosContato(List<MeioContato> value) {
    _meiosContato = value;
  }

  List<Missao> get missoes => _missoes;

  set missoes(List<Missao> value) {
    _missoes = value;
  }

  List<MeioColaboracao> get meiosColaboracao => _meiosColaboracao;

  set meiosColaboracao(List<MeioColaboracao> value) {
    _meiosColaboracao = value;
  }

  List<CausaSocial> get causasApoiadas => _causasSociais;

  set causasApoiadas(List<CausaSocial> value) {
    _causasSociais = value;
  }

  Partido get partido => _partido;

  set partido(Partido value) {
    _partido = value;
  }

  Cidade get cidade => _cidade;

  set cidade(Cidade value) {
    _cidade = value;
  }

  bool get primeiroMandato => _primeiroMandato;

  set primeiroMandato(bool value) {
    _primeiroMandato = value;
  }

  bool get primeiraCandidatura => _primeiraCandidatura;

  set primeiraCandidatura(bool value) {
    _primeiraCandidatura = value;
  }

  bool get flagCompromisso => _flagCompromisso;

  set flagCompromisso(bool value) {
    _flagCompromisso = value;
  }

  String get cargoCandidata => _cargoCandidata;

  set cargoCandidata(String value) {
    _cargoCandidata = value;
  }

  String get descricaoPerfil => _descricaoPerfil;

  set descricaoPerfil(String value) {
    _descricaoPerfil = value;
  }

  String get idFotoPerfil => _idFotoPerfil;

  set idFotoPerfil(String value) {
    _idFotoPerfil = value;
  }

  String get nomeSocial => _nomeSocial;

  set nomeSocial(String value) {
    _nomeSocial = value;
  }

  String get nomeCompleto => _nomeCompleto;

  set nomeCompleto(String value) {
    _nomeCompleto = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  int get numeroCandidata => _numeroCandidata;

  set numeroCandidata(int value) {
    _numeroCandidata = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'PerfilCandidata{_id: $_id, _numeroCandidata: $_numeroCandidata, _email: $_email, _senha: $_senha, _nomeCompleto: $_nomeCompleto, _nomeSocial: $_nomeSocial, _idFotoPerfil: $_idFotoPerfil, _descricaoPerfil: $_descricaoPerfil, _cargoCandidata: $_cargoCandidata, _flagCompromisso: $_flagCompromisso, _primeiraCandidatura: $_primeiraCandidatura, _primeiroMandato: $_primeiroMandato, _cidade: $_cidade, _partido: $_partido, _causasSociais: $_causasSociais, _meiosColaboracao: $_meiosColaboracao, _missoes: $_missoes, _meiosContato: $_meiosContato}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PerfilCandidata && runtimeType == other.runtimeType &&
              _id == other._id && _numeroCandidata == other._numeroCandidata &&
              _email == other._email && _senha == other._senha &&
              _nomeCompleto == other._nomeCompleto &&
              _nomeSocial == other._nomeSocial &&
              _idFotoPerfil == other._idFotoPerfil &&
              _descricaoPerfil == other._descricaoPerfil &&
              _cargoCandidata == other._cargoCandidata &&
              _flagCompromisso == other._flagCompromisso &&
              _primeiraCandidatura == other._primeiraCandidatura &&
              _primeiroMandato == other._primeiroMandato &&
              _cidade == other._cidade && _partido == other._partido &&
              _causasSociais == other._causasSociais &&
              _meiosColaboracao == other._meiosColaboracao &&
              _missoes == other._missoes &&
              _meiosContato == other._meiosContato;

  @override
  int get hashCode =>
      _id.hashCode ^ _numeroCandidata.hashCode ^ _email.hashCode ^ _senha
          .hashCode ^ _nomeCompleto.hashCode ^ _nomeSocial
          .hashCode ^ _idFotoPerfil.hashCode ^ _descricaoPerfil
          .hashCode ^ _cargoCandidata.hashCode ^ _flagCompromisso
          .hashCode ^ _primeiraCandidatura.hashCode ^ _primeiroMandato
          .hashCode ^ _cidade.hashCode ^ _partido.hashCode ^ _causasSociais
          .hashCode ^ _meiosColaboracao.hashCode ^ _missoes
          .hashCode ^ _meiosContato.hashCode;


}