import 'package:femden/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonSingOut extends StatelessWidget {
  const BotonSingOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Alerta!'),
                  content: Text(
                    '¿Desea cerrar cesión?',
                    style: TextStyle(fontSize: 22),
                  ),
                  actions: [
                    MaterialButton(
                        child: Text('Si'),
                        elevation: 5,
                        textColor: Colors.purple,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'inicio');
                          AuthService.deleteToken();
                          AuthService.deleteUidPersona();
                        }),
                    MaterialButton(
                        child: Text('No'),
                        elevation: 5,
                        textColor: Colors.purple,
                        onPressed: () => Navigator.pop(context))
                  ],
                ));
      },
      shape: CircleBorder(),
      child: FaIcon(
        FontAwesomeIcons.signOutAlt,
        color: Colors.white,
      ),
    );
  }
}
