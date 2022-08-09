import 'package:auto_route/auto_route.dart';
import 'package:kavall/pages/delivery_statistic/delivery_statistic_page.dart';
import 'package:kavall/pages/user/user_profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: DeliveryStatisticPage,
      initial: true,
    ),
    AutoRoute(
      path: '/user',
      page: UserScreen,
      children: [
        AutoRoute(path: '', page: UserProfilePage),
        AutoRoute(path: 'details', page: UserDetailsScreen),
        AutoRoute(path: 'friends', page: UserFriendsScreen),
        groupTabRouter,
        // redirect all other paths
        RedirectRoute(path: '*', redirectTo: 'profile'),
      ],
    ),
  ],
)
class $AppRouter {}
