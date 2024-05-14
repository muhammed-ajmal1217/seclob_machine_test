import 'package:flutter/material.dart';
import 'package:seclob_task/model/data_model.dart';
import 'package:seclob_task/service/api_service.dart';

class ApiProvider extends ChangeNotifier {
  final ApiService apiservice = ApiService();
  List<DataModel>? datas = [];
  Future<List<DataModel>> fetchData() async {
    try {
      datas = await apiservice.getData();
      print('datas are${apiservice.getData()}');
      notifyListeners();
      return datas!;
    } catch (e) {
      notifyListeners();
      return [];
    }
  }
}