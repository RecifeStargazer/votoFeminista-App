import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getPartidos";

class PartidoService {
  static getPartidos() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List partidoReturned = await jsonDecode(utf8.decode(response.bodyBytes));
    return partidoReturned;
  }
}