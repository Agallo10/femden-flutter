import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/custom_input.dart';
import 'package:femden/widgets/labels.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Ingrese los datos para realizar la denuncia',
                      style: TextStyle(
                          color: Color.fromRGBO(221, 203, 236, 1),
                          fontSize: 22),
                    ),
                  ),
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
  final nombreController = TextEditingController();
  final cedulaController = TextEditingController();
  final emailController = TextEditingController();
  final direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person,
            placeHolder: 'Nombre',
            //keyboardType: TextInputType.number,
            textController: nombreController,
          ),
          CustomInput(
            icon: Icons.phone,
            placeHolder: 'Numero de telefono',
            keyboardType: TextInputType.number,
            textController: telController,
          ),
          CustomInput(
            icon: Icons.account_box,
            placeHolder: 'Documento',
            //keyboardType: TextInputType.number,
            textController: cedulaController,
            //isPassword: true,
          ),
          CustomInput(
            icon: Icons.email,
            placeHolder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
            //isPassword: true,
          ),
          CustomInput(
            icon: Icons.map,
            placeHolder: 'Direccion',
            textController: direccionController,
            //isPassword: true,
          ),
          Boton(
            text: 'Ingresar',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
