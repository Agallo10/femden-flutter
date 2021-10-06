import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final VoidCallback onClicked;
  final Color iconColor;

  const CustomInput(
      {Key key,
      @required this.icon,
      this.placeHolder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.onClicked,
      this.labelText,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 10),
                  blurRadius: 5),
            ]),
        child: TextFormField(
          onTap: onClicked,
          controller: this.textController,
          style: TextStyle(fontSize: 20),
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),
              labelText: this.labelText,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeHolder),
          validator: (value) {
            if (value != null && value.length >= 6) return null;

            return 'La contraseña debe ser mayor a 6';
          },
        ));
  }
}

class CustomInputCorreo extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final VoidCallback onClicked;

  const CustomInputCorreo({
    Key key,
    @required this.icon,
    this.placeHolder,
    @required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.onClicked,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, left: 20, bottom: 10, right: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 10),
                  blurRadius: 5),
            ]),
        child: TextFormField(
          onTap: onClicked,
          controller: this.textController,
          style: TextStyle(fontSize: 20),
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(
                this.icon,
              ),
              labelText: this.labelText,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeHolder),
          validator: (value) {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

            RegExp regExp = new RegExp(pattern);
            return regExp.hasMatch(value)
                ? null
                : 'El valor ingresado no luce como un correo';
          },
        ));
  }
}

class CustomInputContrasena extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final VoidCallback onClicked;
  final Color iconColor;

  const CustomInputContrasena(
      {Key key,
      @required this.icon,
      this.placeHolder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.onClicked,
      this.labelText,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 10),
                  blurRadius: 5),
            ]),
        child: TextFormField(
          onTap: onClicked,
          controller: this.textController,
          style: TextStyle(fontSize: 20),
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),
              labelText: this.labelText,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeHolder),
          validator: (value) {
            if (value != null && value.length >= 6) return null;

            return 'La contraseña debe ser mayor a 6';
          },
        ));
  }
}
