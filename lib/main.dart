import 'file:///C:/Users/carlos.s.oliveira/Desktop/aliadasapp/lib/ui/tela_login.dart';
import 'package:aliadasapp/ui/tela_crud_aliada.dart';
import 'package:aliadasapp/ui/tela_crud_candidata.dart';
import 'package:aliadasapp/ui/tela_login_cadastro.dart';
import 'package:aliadasapp/ui/tela_selec_tipo_cadastro.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
        home: CrudCandidata(),
      //home: TelaTipoCadastro()
      //home: TelaLogin(),
        //home: TelaLoginCadastro(),
    )
);