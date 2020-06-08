// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'causas_sociais.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CausaSocial _$CausaSocialFromJson(Map<String, dynamic> json) {
  return CausaSocial()
    ..descricao = json['descricao'] as String
    ..titulo = json['titulo'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$CausaSocialToJson(CausaSocial instance) =>
    <String, dynamic>{
      'descricao': instance.descricao,
      'titulo': instance.titulo,
      'id': instance.id,
    };
