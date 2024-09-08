import 'dart:io';

import 'package:cr_calendar/cr_calendar.dart';
import 'package:cr_calendar_example/res/colors.dart';
import 'package:flutter/material.dart';

final weekDayHeadersEn = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
final weekDayHeadersCn = ['日', '一', '二', '三', '四', '五', '六'];

/// Widget that represents week days in row above calendar month view.
class LocalizedWeekDaysWidget extends StatelessWidget {
  const LocalizedWeekDaysWidget({
    required this.weekDay,
    required this.weekDayIndex,
    super.key,
  });

  /// [String] value from [LocalizedWeekDaysBuilder].
  final String weekDay;
  final int weekDayIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 0.3,
        ),
      ),
      height: 40,
      child: Center(
        child: Text(
          //weekDay,
          Platform.localeName.contains('zh')
              ? weekDayHeadersCn[weekDayIndex]
              : weekDayHeadersEn[weekDayIndex],
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: violet.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
