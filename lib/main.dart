import 'package:aliadasapp/ui/tela_login.dart';
import 'package:aliadasapp/ui/tela_crud_aliada.dart';
import 'package:aliadasapp/ui/tela_crud_candidata1.dart';
import 'package:aliadasapp/ui/tela_login_cadastro.dart';
import 'package:aliadasapp/ui/tela_selec_tipo_cadastro.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  runApp(
      new MaterialApp(

        //home: CrudCandidata1(),
        //home: CrudAliada(),
        //home: TelaTipoCadastro()
        //home: TelaLogin(),
        home: TelaLoginCadastro(),
      )
  );
}