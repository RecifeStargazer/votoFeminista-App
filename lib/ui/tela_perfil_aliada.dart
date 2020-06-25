import 'package:flutter/material.dart';

class PerfilAliada extends StatefulWidget {
  @override
  _PerfilAliadaState createState() => _PerfilAliadaState();
}

class _PerfilAliadaState extends State<PerfilAliada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 50),
      appBar: AppBar(

      ),
      body: Container(

      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(247, 247, 247, 50),
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text('Candidatas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Causas Apoiadas'),
            ),
          ]),
    );
  }
}
class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(),
    );
  }
}

class ProfileListProfile extends StatefulWidget {
  @override
  _ProfileListProfileState createState() => _ProfileListProfileState();
}

class _ProfileListProfileState extends State<ProfileListProfile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class ProfileCausasApoiadas extends StatefulWidget {
  @override
  _ProfileCausasApoiadasState createState() => _ProfileCausasApoiadasState();
}

class _ProfileCausasApoiadasState extends State<ProfileCausasApoiadas> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


