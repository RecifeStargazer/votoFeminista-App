import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/estado.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getListaEstados";


class EstadoService {
  static Future<List<Estado>> getEstado() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List estadoReturned = await (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((estado) =>
        Estado.fromJson(estado)).toList();
    return estadoReturned;
  }
}