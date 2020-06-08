import 'estado.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cidade.g.dart';
@JsonSerializable(explicitToJson:true)
class Cidade{
  int _id;
  String _nome;
  Estado _estado;

  Cidade();

  Cidade.init(this._id, this._nome, this._estado);

  factory Cidade.fromJson(Map<String, dynamic> json) => _$CidadeFromJson(json);

  Map<String, dynamic> toJson() => _$CidadeToJson(this);

  Estado get estado => _estado;

  set estado(Estado value) {
    _estado = value;
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
  String toString() {
    return 'Cidade{_id: $_id, _nome: $_nome, _estado: $_estado}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cidade &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _nome == other._nome &&
          _estado == other._estado;

  @override
  int get hashCode => _id.hashCode ^ _nome.hashCode ^ _estado.hashCode;
}