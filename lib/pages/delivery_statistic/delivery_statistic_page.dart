import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:kavall/core/constants/dimensions.dart';
import 'package:kavall/pages/delivery_statistic/bloc/delivery_statistic_bloc.dart';
import 'package:kavall/widgets/loader.dart';
import 'package:kavall/widgets/statistic_card.dart';
import 'package:easy_localization/easy_localization.dart';

class DeliveryStatisticPage extends StatelessWidget {
  const DeliveryStatisticPage({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<DeliveryStatisticBloc, DeliveryStatisticState>(
      builder: (context, state) {
        final resultList = <TableRow>[];
        if (state.statisticList != null) {
          state.statisticList!.forEach((element) {
            final deliveryTime = Duration(seconds: element.seconds!);
            resultList.add(
              TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Text(element.orderId.toString()),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Text(
                        "${deliveryTime.inMinutes.remainder(60)}:${(deliveryTime.inSeconds.remainder(60))}"),
                  ),
                ],
              ),
            );
          });
        }

        return Scaffold(
          body: Center(
            child: FormBuilder(
              key: _formKey,
              child: SizedBox(
                width: screenSize.width * AppDimensions.percent90,
                height: screenSize.height * AppDimensions.percent70,
                child: StatisticCard(
                  child: state.statisticList == null
                      ? Loader()
                      : Column(
                          children: [
                            SizedBox(
                              height:
                                  screenSize.height * AppDimensions.percent40,
                              child: SingleChildScrollView(
                                child: Table(
                                  border: TableBorder.all(),
                                  children: resultList,
                                ),
                              ),
                            ),
                            FormBuilderDateTimePicker(
                              name: 'date',
                              // onChanged: _onChanged,
                              inputType: InputType.date,
                              decoration: InputDecoration(
                                labelText: "select_date".tr(),
                              ),
                              initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _formKey.currentState!.save();
                              },
                              child: Text('get_statistics').tr(),
                            )
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
