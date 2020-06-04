import 'dart:core';
class Estado{
  int _id;
  String _nome;
  String _sigla;

  Estado();

  Estado.init(this._id, this._nome, this._sigla);

  String get sigla => _sigla;

  set sigla(String value) {
    _sigla = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Estado &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _nome == other._nome &&
          _sigla == other._sigla;

  @override
  int get hashCode => _id.hashCode ^ _nome.hashCode ^ _sigla.hashCode;

  @override
  String toString() {
    return 'Estado{_id: $_id, _nome: $_nome, _sigla: $_sigla}';
  }
}