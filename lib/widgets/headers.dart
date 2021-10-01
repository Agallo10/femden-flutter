import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon,
    @required this.titulo,
    @required this.subtitulo,
    this.color1 = Colors.purple,
    this.color2 = Colors.purple,
  });

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBack(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(this.icon,
                size: 250, color: Colors.white.withOpacity(0.2))),
        Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
            ),
            Text(this.subtitulo,
                style: TextStyle(fontSize: 20, color: colorBlanco)),
            Text(this.titulo,
                style: TextStyle(
                    fontSize: 30,
                    color: colorBlanco,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBack extends StatelessWidget {
  final Color color1;
  final Color color2;
  const _IconHeaderBack({
    Key key,
    @required this.color1,
    this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [this.color1, this.color2]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        ));
  }
}
