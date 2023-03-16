
abstract class HomeEvent {}

class GetLastCurrency extends HomeEvent {}

class GetCurrencyByData extends HomeEvent {
  final DateTime date;
  GetCurrencyByData(this.date);
}
class LocalChangeEvent extends HomeEvent{
  final int localIndex;

  LocalChangeEvent(this.localIndex);
}
