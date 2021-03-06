import 'dart:async';
import 'dart:convert';
import 'package:aliadasapp/classesDto/causas_sociais.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:8091/aliadas/v1/utilidades/getCausasSociais";


class CausasSociaisService {
    static Future<List<CausaSocial>> getCausasSociais() async{
    var url = baseUrl;
    http.Response response = await http.get(url);
    List<CausaSocial> causasSociaisReturned = await (jsonDecode(utf8.decode(response.bodyBytes)) as List).map((causaSocial) =>
        CausaSocial.fromJson(causaSocial)).toList();
    return causasSociaisReturned;
  }
}