// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Missao _$MissaoFromJson(Map<String, dynamic> json) {
  return Missao()
    ..descricao = json['descricao'] as String
    ..titulo = json['titulo'] as String;
}

Map<String, dynamic> _$MissaoToJson(Missao instance) => <String, dynamic>{
      'descricao': instance.descricao,
      'titulo': instance.titulo,
    };
