import 'package:flutter/material.dart';

class SilederModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }
}
