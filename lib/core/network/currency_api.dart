
import 'package:currency_flutter/core/model/currency_model.dart';
import 'package:currency_flutter/core/network/api_base.dart';

class CurrencyApi{
  final ApiBase _base;
  CurrencyApi(this._base);

  Future<List<CurrencyModel>> currencies(DateTime? date)async{
    var url = "/uz/arkhiv-kursov-valyut/json/";
    if(date!=null){
      url = "${url}all/${date.year}-${date.month}-${date.day}/";
    }
    final response = await _base.dio.get(url);
    return (response.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
  }
}