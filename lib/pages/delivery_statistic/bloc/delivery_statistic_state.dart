part of 'delivery_statistic_bloc.dart';

@freezed
class DeliveryStatisticState with _$DeliveryStatisticState {
  const factory DeliveryStatisticState({
    List<Statistic>? statisticList,
  }) = _State;
}
