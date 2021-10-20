import 'package:age/age.dart';
import 'package:femden/helpers/mostrar_alerta.dart';
import 'package:femden/providers/register_form_provider.dart';
import 'package:femden/services/auth_service.dart';
import 'package:femden/ui/input_decortations.dart';
import 'package:femden/widgets/auth_background_register.dart';
import 'package:femden/widgets/card_container.dart';
import 'package:femden/widgets/labels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackgroundRegister(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text('Ingrese sus datos',
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => RegisterFormProvider(), child: _RegisterForm())
            ],
          )),
          SizedBox(height: 20),

          Labels(
            ruta: 'inicio',
          ),
          SizedBox(height: 20),
          // Text(
          //   'Crear una nueva cuenta',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _RegisterForm extends StatelessWidget {
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
    final registerForm = Provider.of<RegisterFormProvider>(context);
    final authService = Provider.of<AuthService>(context);
    final msg = authService.msg;

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.name,
              controller: nombreController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Alfredo Duro',
                  labelText: 'Nombre',
                  prefixIcon: Icons.person),
              onChanged: (value) => registerForm.nombre = value,
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'El nombre debe tener al menos 1 caracter';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.number,
              controller: telController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '3235085647',
                  labelText: 'Número de teléfono',
                  prefixIcon: Icons.phone),
              onChanged: (value) => registerForm.telefono = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'El número debe tener al menos 6 caracteres.';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'ejemplo@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) => registerForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: true,
              keyboardType: TextInputType.number,
              controller: cedulaController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '1102093505',
                  labelText: 'Documento',
                  prefixIcon: Icons.account_box),
              onChanged: (value) => registerForm.documento = value,
              validator: (value) {
                return (value != null &&
                        value.length >= 8 &&
                        value.length <= 10)
                    ? null
                    : 'La Documento debe de ser mayor de 8 caracteres';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.name,
              controller: direccionController,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Ejm: Avenida siempre vivas 24',
                  labelText: 'Dirección',
                  prefixIcon: Icons.map),
              onChanged: (value) => registerForm.direccion = value,
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'La dirección debe tener al menos 1 caracter';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              //obscureText: false,
              keyboardType: TextInputType.name,
              controller: fechaController,
              decoration: InputDecorations.authInputDecoration(
                  //hintText: 'Ejm: Avenida siempre vivas 24',
                  labelText: 'Fecha de nacimiento',
                  prefixIcon: Icons.date_range),
              onChanged: (value) => registerForm.fecha = value,
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Seleccione la fecha de nacimiento';
              },

              onTap: () {
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
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      registerForm.isLoading ? 'Espere' : 'Siguiente',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: registerForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!registerForm.isValidForm()) return;

                        registerForm.isLoading = true;

                        //await Future.delayed(Duration(seconds: 2));

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
                        registerForm.isLoading = false;
                      })
          ],
        ),
      ),
    );
  }
}
