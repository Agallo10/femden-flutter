import 'package:femden/services/auth_service.dart';
import 'package:femden/src/pages/inicio.dart';
import 'package:femden/src/pages/menu_page.dart';
//import 'package:femden/src/pages/seleccion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: checkLogState(context),
            builder: (context, snapshot) {
              return Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Espere...',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Divider(),
                  CircularProgressIndicator(),
                ],
              );
            }));
  }

  Future checkLogState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticando = await authService.isLoggedIn();

    if (autenticando) {
      Navigator.pushReplacement(
          context, PageRouteBuilder(pageBuilder: (_, __, ___) => MenuPage()));
    } else {
      Navigator.pushReplacement(context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => InicioScroll()));
    }
  }
}
