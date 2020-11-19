import 'package:flutter/material.dart';
import 'package:provider_task/utils/api_interface.dart';
import 'package:provider_task/utils/models.dart';

class CountriesBLOC extends ChangeNotifier {
  // Services services = Services();
  bool loading = true;
  bool error = false;

  List<Country> countries;

  loadData() async {
    // loading = true;
    // error = false;
    // notifyListeners();
    // List<Country> _countries = await APIInterface.getCountries();
    // if (_countries == null) {
    //   error = true;
    // }
    // loading = false;
    // countries=_countries;
    //
    notifyListeners();
  }
}
