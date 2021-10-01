import 'package:femden/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;

  const SlideShow({@required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SilederModel(),
      child: Center(
          child: Column(
        children: [
          Expanded(child: _Slides(this.slides)),
          _Dots(this.slides.length)
        ],
      )),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(this.totalSlides, (index) => _Dot(index)),
        ));
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SilederModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Color.fromRGBO(91, 24, 123, 1)
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);
  @override
  __Slides1State createState() => __Slides1State();
}

class __Slides1State extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      //Actualizar el provider
      Provider.of<SilederModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}
