import 'package:age/age.dart';
import 'package:femden/helpers/mostrar_alerta.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/widgets/boton.dart';
import 'package:femden/widgets/custom_input.dart';
import 'package:femden/widgets/labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ingrese los datos para realizar la denuncia',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
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
  final fechaController = TextEditingController();
  int edad;
  AgeDuration age;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final msg = authService.msg;

    return Container(
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          CustomInput(
            icon: Icons.date_range,
            placeHolder: 'Fecha',
            textController: fechaController,
            onClicked: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 80),
                  lastDate: DateTime(DateTime.now().year + 5),
                  builder: (context, picker) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: ColorScheme.dark(
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white,
                          surface: Color.fromRGBO(221, 203, 236, 1),
                          onSurface: Colors.deepPurple,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: picker,
                    );
                  }).then((selectedDate) {
                if (selectedDate != null) {
                  fechaController.text =
                      DateFormat('MM/dd/yyyy').format(selectedDate);

                  age = Age.dateDifference(
                      fromDate: selectedDate,
                      toDate: DateTime.now(),
                      includeToDate: false);

                  edad = age.years;

                  print(edad);
                }
              });
            },

            //isPassword: true,
          ),
          Container(
            height: 10,
          ),
          Boton(
            color: Color.fromRGBO(221, 203, 236, 1),
            colorTexto: Colors.black,
            text: 'Siguiente',
            onPressed:
                //authService.autenticando
                // ? null
                // :
                () async {
              final registroOK = await authService.crearPersonas(
                  nombreController.text.trim(),
                  cedulaController.text.trim(),
                  emailController.text.trim(),
                  int.parse(telController.text.trim()),
                  direccionController.text.trim(),
                  fechaController.text.trim(),
                  edad);

              if (registroOK) {
                //Navegar a seleccion
                Navigator.pushReplacementNamed(context, 'menu');
              } else {
                mostrarAlerta(context, ' Error', msg ?? "");
              }
            },
          ),

          //Boton(text: 'fecha', onPressed: () {})
        ],
      ),
    );
  }
}
