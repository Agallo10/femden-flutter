import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonDenuncia extends StatelessWidget {
  final IconData icon;
  @required
  final String texto;
  final Color color1;
  final Color color2;
  @required
  final Function onPress;

  const BotonDenuncia(
      {this.icon = FontAwesomeIcons.node,
      this.texto,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonDenBack(
            icon: this.icon,
            color1: this.color1,
            color2: this.color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FaIcon(
                this.icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonDenBack extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonDenBack({this.icon, this.color1, this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  this.icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[this.color1, this.color2],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
