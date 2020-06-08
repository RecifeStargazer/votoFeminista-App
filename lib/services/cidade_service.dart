import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/cidade.dart';
import 'package:http/http.dart' as http;
const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/";

const finalUrl  =  "/getListaCidadesPorEstado";

class CidadeService {
  static Future<List<Cidade>> getCidade(int codigoEstado) async{
    var url = baseUrl+codigoEstado.toString()+finalUrl;
    http.Response response = await http.get(url);
    List<Cidade> cidadeReturned = await (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((cidade) =>
        Cidade.fromJson(cidade)).toList();
    return cidadeReturned;
  }
}