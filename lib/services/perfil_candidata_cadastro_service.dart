import 'dart:convert';
import 'package:aliadasapp/classesDto/perfil_candidata.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
const baseUrl = "http://10.0.2.2:8091/aliadas/v1/perfilCandidata";
class CadastroCandidataService {
  static Future<PerfilCandidata> postCadastrarCandidata(PerfilCandidata perfil) async{
    var url = baseUrl;
    http.Response response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(perfil)
    );
    PerfilCandidata candidataReturned = await PerfilCandidata.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    return candidataReturned;
  }
}