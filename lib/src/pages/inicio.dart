import 'package:flutter/material.dart';

class InicioScroll extends StatelessWidget {
  const InicioScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        _pagina1(),
        _pagina2(context),
      ],
    ));
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[_colorfondo(), _tituloImg()],
    );
  }

  Widget _colorfondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(91, 33, 122, 1),
    );
  }

  Widget _fondoIMG() {
    return Center(
      child: Container(
        //color: Colors.red,
        width: double.infinity,
        height: 420,
        child: Image(
          image: AssetImage('assets/launcher.png'),
        ),
      ),
    );
  }

  Widget _tituloImg() {
    final estiloTexto =
        TextStyle(color: Color.fromRGBO(221, 203, 236, 1), fontSize: 28);
    final estiloTexto2 =
        TextStyle(color: Color.fromRGBO(221, 203, 236, 1), fontSize: 18);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          // Text(
          //   'FEMDEN',
          //   style: estiloTexto,
          // ),
          SizedBox(
            height: 10,
          ),
          _fondoIMG(),
          Expanded(child: Container()),
          SizedBox(
            height: 30,
            child: Container(
              //padding: EdgeInsets.all(30),
              child: Text(
                'Desliza para continuar',
                style: estiloTexto2,
                textAlign: TextAlign.center,
              ),
              //color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Icon(
            Icons.keyboard_arrow_down,
            size: 70,
            color: Color.fromRGBO(221, 203, 236, 1),
          )
        ],
      ),
    );
  }

  Widget _pagina2(BuildContext context) {
    return Stack(
      children: <Widget>[_colorfondo(), _textoBoton(context)],
    );
  }

  Widget _botonSi(BuildContext context) {
    return Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        textColor: Color.fromRGBO(91, 24, 123, 4),
        onPressed: () {
          Navigator.pushNamed(context, 'login');
        },
        color: Color.fromRGBO(221, 203, 236, 1),
        child: Padding(
            child: Text(
              'Si',
              style: TextStyle(fontSize: 17),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
      ),
    );
  }

  Widget _botonNo(BuildContext context) {
    return Center(
      child: RaisedButton(
        shape: StadiumBorder(),
        textColor: Color.fromRGBO(91, 24, 123, 4),
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
        color: Color.fromRGBO(221, 203, 236, 1),
        child: Padding(
            child: Text(
              'No',
              style: TextStyle(fontSize: 17),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0)),
      ),
    );
  }

  Widget _textoBoton(BuildContext context) {
    final estiloTexto2 = TextStyle(
      color: Color.fromRGBO(221, 203, 236, 1),
      fontSize: 22,
    );
    return SafeArea(
      child: Column(children: <Widget>[
        SizedBox(
          height: 200,
        ),
        Container(
          padding: EdgeInsets.all(30),
          //color: Colors.black,
          width: double.infinity,
          height: 150,
          child: Text(
            'Esta App le permitirá realizar una denuncia ingresando sus datos básicos personales. ',
            style: estiloTexto2,
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          //color: Colors.black,
          height: 70,
          child: Text(
            'Ya ha realizado una denuncia antes?',
            style: estiloTexto2,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _botonSi(context),
              SizedBox(width: 20),
              _botonNo(context)
            ],
          ),
        )
      ]),
    );
  }
}
