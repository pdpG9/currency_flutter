

import 'package:currency_flutter/core/network/currency_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final CurrencyApi _api;

  HomeBloc(this._api):super(const HomeState()){
    on<GetLastCurrency>((event,emit)async{
      emit(state.copyWith(status: Status.loading));
      try{
          final result = await _api.currencies(null);
          print(result.length);
        emit(state.copyWith(
          status: Status.success,
          currencies: result,
        ));
      }catch(e){
        emit(state.copyWith(status: Status.fail,message: "$e"));
      }
    });
    on<GetCurrencyByData>((event, emit)async{
      emit(state.copyWith(status: Status.loading));
      try{
        emit(state.copyWith(
          status: Status.success,
          currencies: await _api.currencies(event.date)
        ));
      }catch(e){
         emit(state.copyWith(status: Status.fail,message: "$e"));
      }
    });
    on<LocalChangeEvent>((event, emit)async{
      emit(state.copyWith(
        currentLanguage: event.localIndex
      ));
    });
  }
}