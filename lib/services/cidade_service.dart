import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/";

const finalUrl  =  "/getListaCidadesPorEstado";


class CidadeService {
  static getCidade(int codigoEstado) async{
    var url = baseUrl+codigoEstado.toString()+finalUrl;
    http.Response response = await http.get(url);
    List cidadeReturned = await jsonDecode(utf8.decode(response.bodyBytes));
    return cidadeReturned;
  }
}