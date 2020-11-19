import 'package:flutter/material.dart';
import 'package:provider_task/utils/api_interface.dart';
import 'package:provider_task/utils/models.dart';
import 'package:zap_architecture/zap_architecture.dart';

class CountriesBLOC extends ChangeNotifier {
  Status _status = Status.loading();

  Status get status => _status;

  set myStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  List<Country> countries;

  loadData() async {
    myStatus = Status.loading();

    Response<List<Country>> response = await APIInterface.getCountries();
    myStatus = Status.fromResponse(response);

    if (response.success) countries = response.data;
  }
}
