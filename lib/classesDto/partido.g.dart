// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partido.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partido _$PartidoFromJson(Map<String, dynamic> json) {
  return Partido()
    ..descricao = json['descricao'] as String
    ..sigla = json['sigla'] as String
    ..numero = json['numero'] as int
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PartidoToJson(Partido instance) => <String, dynamic>{
      'descricao': instance.descricao,
      'sigla': instance.sigla,
      'numero': instance.numero,
      'id': instance.id,
    };
