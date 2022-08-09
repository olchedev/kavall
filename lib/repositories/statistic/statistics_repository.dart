import 'package:injectable/injectable.dart';
import 'package:kavall/models/statistic/statistic.dart';
import 'package:kavall/repositories/statistic/api/statistics_api.dart';

@singleton
class StatisticsRepository {
  Future<List<Statistic>> getStatistic({required String date}) async {
    final result = await StatisticsApi.getStatistic(date: date);

    return result;
  }
}
