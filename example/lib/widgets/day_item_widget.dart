import 'dart:io';

import 'package:cr_calendar/cr_calendar.dart';
import 'package:cr_calendar_example/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:lunar/lunar.dart';

/// Widget of day item cell for calendar
class DayItemWidget extends StatelessWidget {
  const DayItemWidget({
    required this.properties,
    super.key,
  });

  final DayItemProperties properties;

  @override
  Widget build(BuildContext context) {
    final showLunar = Platform.localeName.contains('zh');
    var lunarDay = '';
    var holidays = '';
    if (showLunar) {
      final lunar = Lunar.fromDate(properties.date);
      lunarDay = lunar.getDayInChinese();
      if (lunarDay == '初一') {
        lunarDay = '${lunar.getMonthInChinese()}月';
      }
      for (final fest in lunar.getFestivals()) {
        holidays += '$fest\n';
      }
      /*if (holidays.isEmpty) {
        for (final fest in lunar.getOtherFestivals()) {
          if (holidays.isEmpty) {
            holidays = ' ';
          }
          holidays += '$fest ';
        }
      }*/
    }

    final solar = Solar.fromDate(properties.date);
    for (final fest in solar.getFestivals()) {
      holidays += '$fest\n';
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: violet.withOpacity(0.3), width: 0.3)),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 4),
                alignment: Alignment.topCenter,
                child: Container(
                  height: 32,
                  //width: 18,
                  decoration: BoxDecoration(
                    color:
                        properties.isCurrentDay ? violet : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${properties.dayNumber}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: properties.isCurrentDay
                                ? Colors.white
                                : violet.withOpacity(
                                    properties.isInMonth ? 1 : 0.5))),
                  ),
                ),
              ),
              if (showLunar)
                Container(
                  height: 20,
                  padding: const EdgeInsets.only(top: 2),
                  alignment: Alignment.topCenter,
                  child: Text(
                    lunarDay,
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            violet.withOpacity(properties.isInMonth ? 1 : 0.5)),
                  ),
                ),
              if (holidays.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(top: 2),
                  alignment: Alignment.topCenter,
                  child: Text(
                    holidays,
                    style: TextStyle(
                        fontSize: 10,
                        color:
                            violet.withOpacity(properties.isInMonth ? 1 : 0.5)),
                  ),
                ),
            ],
          ),
          if (properties.notFittedEventsCount > 0)
            Container(
              padding: const EdgeInsets.only(right: 2, top: 2),
              alignment: Alignment.topRight,
              child: Text('+${properties.notFittedEventsCount}',
                  style: TextStyle(
                      fontSize: 10,
                      color:
                          violet.withOpacity(properties.isInMonth ? 1 : 0.5))),
            ),
        ],
      ),
    );
  }
}
