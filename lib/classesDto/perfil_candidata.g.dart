// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_candidata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerfilCandidata _$PerfilCandidataFromJson(Map<String, dynamic> json) {
  return PerfilCandidata()
    ..meiosContato = (json['meiosContato'] as List)
        ?.map((e) =>
            e == null ? null : MeioContato.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..missoes = (json['missoes'] as List)
        ?.map((e) =>
            e == null ? null : Missao.fromJson(e as Map<String, dynamic>))
        ?.toList()
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
    ..primeiroMandato = json['primeiroMandato'] as bool
    ..primeiraCandidatura = json['primeiraCandidatura'] as bool
    ..flagCompromisso = json['flagCompromisso'] as bool
    ..cargoCandidata = json['cargoCandidata'] as String
    ..descricaoPerfil = json['descricaoPerfil'] as String
    ..idFotoPerfil = json['idFotoPerfil'] as String
    ..nomeSocial = json['nomeSocial'] as String
    ..nomeCompleto = json['nomeCompleto'] as String
    ..senha = json['senha'] as String
    ..email = json['email'] as String
    ..numeroCandidata = json['numeroCandidata'] as int
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PerfilCandidataToJson(PerfilCandidata instance) =>
    <String, dynamic>{
      'meiosContato': instance.meiosContato?.map((e) => e?.toJson())?.toList(),
      'missoes': instance.missoes?.map((e) => e?.toJson())?.toList(),
      'meiosColaboracao':
          instance.meiosColaboracao?.map((e) => e?.toJson())?.toList(),
      'causasApoiadas':
          instance.causasApoiadas?.map((e) => e?.toJson())?.toList(),
      'partido': instance.partido?.toJson(),
      'cidade': instance.cidade?.toJson(),
      'primeiroMandato': instance.primeiroMandato,
      'primeiraCandidatura': instance.primeiraCandidatura,
      'flagCompromisso': instance.flagCompromisso,
      'cargoCandidata': instance.cargoCandidata,
      'descricaoPerfil': instance.descricaoPerfil,
      'idFotoPerfil': instance.idFotoPerfil,
      'nomeSocial': instance.nomeSocial,
      'nomeCompleto': instance.nomeCompleto,
      'senha': instance.senha,
      'email': instance.email,
      'numeroCandidata': instance.numeroCandidata,
      'id': instance.id,
    };
