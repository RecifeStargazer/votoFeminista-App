import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/meios_colaboracao.dart';
import 'package:http/http.dart' as http;
const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getMeiosColaboracao";

class MeiosColaboracaoService {
  static Future<List> getMeiosColaboracao() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List meiosColaboracaoReturned = await (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((meioColaboracao) =>
        MeioColaboracao.fromJson(meioColaboracao)).toList();
    return meiosColaboracaoReturned;
  }
}