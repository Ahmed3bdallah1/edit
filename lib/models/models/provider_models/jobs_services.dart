import 'package:flutter/cupertino.dart';

class JobModels extends ChangeNotifier {
  int _counter = 0;
  int _countryCounter = 0;

  final List<bool> _isContainerTappedList = [
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> get containerTappedList => _isContainerTappedList;

  int get counter => _counter;

  int get countryCounter => _countryCounter;


  void containerTapped(int index) {
    _isContainerTappedList[index] = !_isContainerTappedList[index];
    if (_isContainerTappedList[index] == true) {
      _counter++;
    } else {
      _counter--;
    }
    notifyListeners();
  }

  final List<bool> _isContainerTappedListCountry = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<bool> get containerTappedListCounty => _isContainerTappedListCountry;

  void containerTappedCountry(int index) {
    _isContainerTappedListCountry[index] =
        !_isContainerTappedListCountry[index];
    if (_isContainerTappedListCountry[index] == true) {
      _countryCounter++;
    } else {
      _countryCounter--;
    }
    notifyListeners();
  }

  final List<bool> _isWorkTypeTapped = [
    false,
    false,
    false,
    false,
  ];

  List<bool> get workTypeTappedList => _isWorkTypeTapped;

  void workTypeTapped(int index) {
    _isWorkTypeTapped[index] = !_isWorkTypeTapped[index];
    notifyListeners();
  }
}
