// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meios_colaboracao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeioColaboracao _$MeioColaboracaoFromJson(Map<String, dynamic> json) {
  return MeioColaboracao()
    ..id = json['id'] as int
    ..titulo = json['titulo'] as String
    ..descricao = json['descricao'] as String;
}

Map<String, dynamic> _$MeioColaboracaoToJson(MeioColaboracao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
    };
