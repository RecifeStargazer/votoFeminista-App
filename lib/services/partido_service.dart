import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/partido.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getPartidos";

class PartidoService {
  static Future<List<Partido>> getPartidos() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List partidoReturned = await (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((partido) =>
        Partido.fromJson(partido)).toList();
    return partidoReturned;
  }
}