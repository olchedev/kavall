import 'package:injectable/injectable.dart';
import 'package:kavall/core/networking/networking.dart';
import 'package:kavall/models/statistic/statistic.dart';

@injectable
class StatisticsApi {
  // Future<List<Statistic>> getStatistic({required String date}) async {
  //   final data = List<Statistic>.from(
  //     _getStatisticJson().map(
  //       (i) => Statistic.fromJson(i),
  //     ),
  //   );
  //
  //   return data;
  //
  //
  // }

  static Future<List<Statistic>> getStatistic({required String date}) async {
    try {
      return Networking.fromBaseUrl()
          .get<List<Statistic>>('/hometestDeliveries', query: {
        "date": date,
      }, parser: (json) {
        final data = json!.map((e) => Statistic.fromJson(e));
        return data.toList();
      });
    } catch (error) {
      rethrow;
    }
  }
}

// _getStatisticJson() {
//   return [
//     {'orderId': 12, 'storeId': 2, 'date': '2021-05-05', 'seconds': 231},
//   ];
// }
