import 'package:flutter/material.dart';
import 'package:kavall/core/constants/dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kavall/widgets/empty_widget.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(
        AppDimensions.normal,
      ),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.radius10,
        ),
      ),
      child: Column(
        children: [
          Text(
            'delivery_statistics',
            style: theme.textTheme.headline1,
          ).tr(),
          const Expanded(child: EmptyWidget()),
          child,
          const Expanded(child: EmptyWidget()),
        ],
      ),
    );
  }
}
