// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_aliada.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerfilAliada _$PerfilAliadaFromJson(Map<String, dynamic> json) {
  return PerfilAliada()
    ..meiosColaboracao = (json['meiosColaboracao'] as List)
        ?.map((e) => e == null
            ? null
            : MeioColaboracao.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..causasApoiadas = (json['causasApoiadas'] as List)
        ?.map((e) =>
            e == null ? null : CausaSocial.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..partido = json['partido'] == null
        ? null
        : Partido.fromJson(json['partido'] as Map<String, dynamic>)
    ..cidade = json['cidade'] == null
        ? null
        : Cidade.fromJson(json['cidade'] as Map<String, dynamic>)
    ..filiadaAPartido = json['filiadaAPartido'] as bool
    ..fezMilitancia = json['fezMilitancia'] as bool
    ..flagCompromisso = json['flagCompromisso'] as bool
    ..descricaoPerfil = json['descricaoPerfil'] as String
    ..idFotoPerfil = json['idFotoPerfil'] as String
    ..nomeSocial = json['nomeSocial'] as String
    ..nomeCompleto = json['nomeCompleto'] as String
    ..senha = json['senha'] as String
    ..email = json['email'] as String
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PerfilAliadaToJson(PerfilAliada instance) =>
    <String, dynamic>{
      'meiosColaboracao':
          instance.meiosColaboracao?.map((e) => e?.toJson())?.toList(),
      'causasApoiadas':
          instance.causasApoiadas?.map((e) => e?.toJson())?.toList(),
      'partido': instance.partido?.toJson(),
      'cidade': instance.cidade?.toJson(),
      'filiadaAPartido': instance.filiadaAPartido,
      'fezMilitancia': instance.fezMilitancia,
      'flagCompromisso': instance.flagCompromisso,
      'descricaoPerfil': instance.descricaoPerfil,
      'idFotoPerfil': instance.idFotoPerfil,
      'nomeSocial': instance.nomeSocial,
      'nomeCompleto': instance.nomeCompleto,
      'senha': instance.senha,
      'email': instance.email,
      'id': instance.id,
    };
