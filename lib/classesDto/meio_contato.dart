import 'package:json_annotation/json_annotation.dart';
part 'meio_contato.g.dart';
@JsonSerializable()
class MeioContato {
  String _tipo;
  String _valor;

  MeioContato();

  MeioContato.init( this._tipo, this._valor);

  factory MeioContato.fromJson(Map<String, dynamic> json) => _$MeioContatoFromJson(json);

  Map<String, dynamic> toJson() => _$MeioContatoToJson(this);

  String get descricao => _valor;

  set descricao(String value) {
    _valor = value;
  }

  String get titulo => _tipo;

  set titulo(String value) {
    _tipo = value;
  }

  @override
  String toString() {
    return 'MeioContato{_tipo: $_tipo, _valor: $_valor}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeioContato &&
          runtimeType == other.runtimeType &&
          _tipo == other._tipo &&
          _valor == other._valor;

  @override
  int get hashCode => _tipo.hashCode ^ _valor.hashCode;
}