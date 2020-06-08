// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cidade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cidade _$CidadeFromJson(Map<String, dynamic> json) {
  return Cidade()
    ..estado = json['estado'] == null
        ? null
        : Estado.fromJson(json['estado'] as Map<String, dynamic>)
    ..nome = json['nome'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$CidadeToJson(Cidade instance) => <String, dynamic>{
      'estado': instance.estado?.toJson(),
      'nome': instance.nome,
      'id': instance.id,
    };
