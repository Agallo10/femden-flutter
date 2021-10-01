import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final VoidCallback onClicked;

  const CustomInput(
      {Key key,
      @required this.icon,
      @required this.placeHolder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.onClicked})
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
        child: TextField(
          onTap: onClicked,
          controller: this.textController,
          style: TextStyle(fontSize: 20),
          autocorrect: false,
          keyboardType: this.keyboardType,
          obscureText: this.isPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icon),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeHolder),
        ));
  }
}
