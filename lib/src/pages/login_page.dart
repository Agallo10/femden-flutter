import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/custom_input.dart';
import 'package:femden/widgets/labels.dart';
import 'package:femden/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(91, 24, 123, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(),
                  _Form(),
                  Labels(
                    ruta: 'inicio',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final telController = TextEditingController();
  final cedulaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.phone,
            placeHolder: 'Numero de telefono',
            keyboardType: TextInputType.number,
            textController: telController,
          ),
          CustomInput(
            icon: Icons.lock,
            placeHolder: 'Contraseña',
            //keyboardType: TextInputType.number,
            textController: cedulaController,
            isPassword: true,
          ),
          Boton(
            text: 'Ingresar',
            onPress: () {},
          )
        ],
      ),
    );
  }
}
