import 'package:femden/src/models/slider_model.dart';
import 'package:femden/widgets/slideshow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UsoAppPage extends StatelessWidget {
  final String pagina;

  const UsoAppPage({Key key, this.pagina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pagina == 'uso') {
      return ChangeNotifierProvider(
        create: (_) => new SilederModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Uso de la aplicación'),
              backgroundColor: Color.fromRGBO(91, 24, 123, 1),
            ),
            body: SlideShow(
              slides: [
                Image(
                  image: AssetImage('assets/uso/1.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/2.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/3.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/4.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/5.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/6.png'),
                ),
                Image(
                  image: AssetImage('assets/uso/7.png'),
                ),
              ],
            )),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Tipos de denuncia'),
            backgroundColor: Color.fromRGBO(91, 24, 123, 1),
          ),
          body: SlideShow(
            slides: [
              SvgPicture.asset('assets/svgs/slide-1.svg'),
              SvgPicture.asset('assets/svgs/slide-2.svg'),
              SvgPicture.asset('assets/svgs/slide-3.svg'),
              SvgPicture.asset('assets/svgs/slide-4.svg'),
              SvgPicture.asset('assets/svgs/slide-5.svg'),
            ],
          ));
    }
  }
}
