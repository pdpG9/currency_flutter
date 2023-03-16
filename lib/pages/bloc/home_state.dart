import 'package:currency_flutter/core/model/local_data.dart';
import 'package:flutter/cupertino.dart';

import '../../core/model/currency_model.dart';


enum Status { initial, fail, loading, success }

@immutable
class HomeState {
  final Status status;
  final List<CurrencyModel> currencies;
  final String message;
  final int currentLanguage;

   const HomeState(
      {this.status = Status.initial,
       this.currentLanguage = 0,
      this.currencies = const [],
      this.message = ""});

  HomeState copyWith(
      {Status? status, List<CurrencyModel>? currencies, String? message,int? currentLanguage}) {
    return HomeState(
        status: status ?? this.status,
        currentLanguage: currentLanguage ?? this.currentLanguage,
        currencies: currencies ?? this.currencies,
        message: message ?? this.message);
  }
}
