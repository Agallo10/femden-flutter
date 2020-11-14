import 'package:flutter/material.dart';

class SeleccionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          _colorfondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_titulos(), _botonesRedondeados()],
            ),
          )
        ]),
        bottomNavigationBar: _bottonNavigationBar(context));
  }

  Widget _colorfondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(91, 24, 123, 20),
    );
  }

  Widget _bottonNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text('orientacion'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('mi caso')),
        ],
      ),
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Femden App',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text('Selecciona el tipo de violencia',
                style: TextStyle(fontSize: 18.0, color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Center(
      child: Table(
        children: [
          TableRow(children: [
            _crearBotonRedondeado(Colors.blue, Icons.gavel, 'Violencia fisica'),
            _crearBotonRedondeado(
                Colors.green, Icons.monetization_on, 'Violencia Economica'),
          ]),
          TableRow(children: [
            _crearBotonRedondeado(
                Colors.deepOrange, Icons.pan_tool, 'Violencia sexual'),
            _crearBotonRedondeado(
                Colors.amber, Icons.lightbulb_outline, 'Violencia Psicologica'),
          ]),
          TableRow(children: [
            _crearBotonRedondeado(
                Colors.black, Icons.home, 'Violencia Patrimonial'),
            Container(),
          ]),
        ],
      ),
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return
        // ClipRect(

        //   child: BackdropFilter(
        //     filter: prefix0.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //     child:
        Container(
      height: 150.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          CircleAvatar(
            backgroundColor: color,
            radius: 35.0,
            child: Icon(
              icono,
              color: Colors.white,
            ),
          ),
          Text(
            texto,
            style: TextStyle(color: color),
          ),
          SizedBox(
            height: 5.0,
          )
        ],
      ),
    );
    //   ),
    // );
  }

  //Widget _callPage() {}
}
