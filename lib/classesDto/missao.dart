import 'package:json_annotation/json_annotation.dart';
part 'missao.g.dart';
@JsonSerializable()
class Missao {
  String _titulo;
  String _descricao;

  Missao();

  Missao.init( this._titulo, this._descricao);

  factory Missao.fromJson(Map<String, dynamic> json) => _$MissaoFromJson(json);

  Map<String, dynamic> toJson() => _$MissaoToJson(this);

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  String get titulo => _titulo;

  set titulo(String value) {
    _titulo = value;
  }

  @override
  String toString() {
    return 'Missao{_titulo: $_titulo, _descricao: $_descricao}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Missao &&
          runtimeType == other.runtimeType &&
          _titulo == other._titulo &&
          _descricao == other._descricao;

  @override
  int get hashCode => _titulo.hashCode ^ _descricao.hashCode;
}