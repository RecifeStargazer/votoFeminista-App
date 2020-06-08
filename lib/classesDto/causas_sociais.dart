import 'package:json_annotation/json_annotation.dart';
part 'causas_sociais.g.dart';
@JsonSerializable()
class CausaSocial {
  int _id;
  String _titulo;
  String _descricao;

  CausaSocial();

  CausaSocial.init(this._id, this._titulo, this._descricao);

  factory CausaSocial.fromJson(Map<String, dynamic> json) => _$CausaSocialFromJson(json);

  Map<String, dynamic> toJson() => _$CausaSocialToJson(this);

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'CausaSocial{_id: $_id, _titulo: $_titulo, _descricao: $_descricao}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CausaSocial &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _titulo == other._titulo &&
          _descricao == other._descricao;

  @override
  int get hashCode => _id.hashCode ^ _titulo.hashCode ^ _descricao.hashCode;
}
