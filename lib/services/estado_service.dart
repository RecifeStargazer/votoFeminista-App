import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getListaEstados";


class EstadoService {
  static getEstado() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List estadoReturned = await jsonDecode(utf8.decode(response.bodyBytes));
    return estadoReturned;
  }
}