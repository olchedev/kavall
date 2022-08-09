import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kavall/models/statistic/statistic.dart';
import 'package:kavall/repositories/statistic/api/statistics_api.dart';
import 'package:kavall/repositories/statistic/statistics_repository.dart';

part 'delivery_statistic_bloc.freezed.dart';

part 'delivery_statistic_state.dart';

part 'delivery_statistic_event.dart';

@injectable
class DeliveryStatisticBloc
    extends Bloc<DeliveryStatisticEvent, DeliveryStatisticState> {
  DeliveryStatisticBloc(this._statisticsRepository)
      : super(const DeliveryStatisticState()) {
    on<_Init>(_onInit);
  }

  final StatisticsRepository _statisticsRepository;

  _onInit(_Init event, Emitter<DeliveryStatisticState> emit) async {
    final _result = await _statisticsRepository.getStatistic(
      date: '2021-05-05',
    );

    emit(
      state.copyWith(
        statisticList: _result,
      ),
    );
  }
}
