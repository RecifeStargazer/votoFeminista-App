import 'package:aliadasapp/classesDto/meios_colaboracao.dart';
import 'package:aliadasapp/classesDto/partido.dart';
import 'package:json_annotation/json_annotation.dart';
import 'causas_sociais.dart';
import 'cidade.dart';

part 'perfil_aliada.g.dart';
@JsonSerializable(explicitToJson:true)
class PerfilAliada {
  int _id;
  String _email;
  String _senha;
  String _nomeCompleto;
  String _nomeSocial;
  String _idFotoPerfil;
  String _descricaoPerfil;
  bool _flagCompromisso;
  bool _fezMilitancia;
  bool _filiadaAPartido;
  Cidade _cidade;
  Partido _partido;
  List<CausaSocial> _causasApoiadas;
  List<MeioColaboracao> _meiosColaboracao;

  PerfilAliada();

  PerfilAliada.init(
      this._id,
      this._email,
      this._senha,
      this._nomeCompleto,
      this._nomeSocial,
      this._idFotoPerfil,
      this._descricaoPerfil,
      this._flagCompromisso,
      this._fezMilitancia,
      this._filiadaAPartido,
      this._cidade,
      this._partido,
      this._causasApoiadas,
      this._meiosColaboracao
      );

  factory PerfilAliada.fromJson(Map<String, dynamic> json) => _$PerfilAliadaFromJson(json);

  Map<String, dynamic> toJson() => _$PerfilAliadaToJson(this);

  List<MeioColaboracao> get meiosColaboracao => _meiosColaboracao;

  set meiosColaboracao(List<MeioColaboracao> value) {
    _meiosColaboracao = value;
  }

  List<CausaSocial> get causasApoiadas => _causasApoiadas;

  set causasApoiadas(List<CausaSocial> value) {
    _causasApoiadas = value;
  }

  Partido get partido => _partido;

  set partido(Partido value) {
    _partido = value;
  }

  Cidade get cidade => _cidade;

  set cidade(Cidade value) {
    _cidade = value;
  }

  bool get filiadaAPartido => _filiadaAPartido;

  set filiadaAPartido(bool value) {
    _filiadaAPartido = value;
  }

  bool get fezMilitancia => _fezMilitancia;

  set fezMilitancia(bool value) {
    _fezMilitancia = value;
  }

  bool get flagCompromisso => _flagCompromisso;

  set flagCompromisso(bool value) {
    _flagCompromisso = value;
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

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'PerfilAliada{_id: $_id, _email: $_email, _senha: $_senha, _nomeCompleto: $_nomeCompleto, _nomeSocial: $_nomeSocial, _idFotoPerfil: $_idFotoPerfil, _descricaoPerfil: $_descricaoPerfil, _flagCompromisso: $_flagCompromisso, _fezMilitancia: $_fezMilitancia, _filiadaAPartido: $_filiadaAPartido, _cidade: $_cidade, _partido: $_partido, _causasApoiadas: $_causasApoiadas, _meiosColaboracao: $_meiosColaboracao}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerfilAliada &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _email == other._email &&
          _senha == other._senha &&
          _nomeCompleto == other._nomeCompleto &&
          _nomeSocial == other._nomeSocial &&
          _idFotoPerfil == other._idFotoPerfil &&
          _descricaoPerfil == other._descricaoPerfil &&
          _flagCompromisso == other._flagCompromisso &&
          _fezMilitancia == other._fezMilitancia &&
          _filiadaAPartido == other._filiadaAPartido &&
          _cidade == other._cidade &&
          _partido == other._partido &&
          _causasApoiadas == other._causasApoiadas &&
          _meiosColaboracao == other._meiosColaboracao;

  @override
  int get hashCode =>
      _id.hashCode ^
      _email.hashCode ^
      _senha.hashCode ^
      _nomeCompleto.hashCode ^
      _nomeSocial.hashCode ^
      _idFotoPerfil.hashCode ^
      _descricaoPerfil.hashCode ^
      _flagCompromisso.hashCode ^
      _fezMilitancia.hashCode ^
      _filiadaAPartido.hashCode ^
      _cidade.hashCode ^
      _partido.hashCode ^
      _causasApoiadas.hashCode ^
      _meiosColaboracao.hashCode;
}