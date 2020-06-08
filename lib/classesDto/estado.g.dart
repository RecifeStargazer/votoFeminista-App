// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Estado _$EstadoFromJson(Map<String, dynamic> json) {
  return Estado()
    ..sigla = json['sigla'] as String
    ..nome = json['nome'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$EstadoToJson(Estado instance) => <String, dynamic>{
      'sigla': instance.sigla,
      'nome': instance.nome,
      'id': instance.id,
    };
