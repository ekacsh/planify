import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalendarTab extends StatefulWidget {
  @override
  _CalendarTabState createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Planify"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: CalendarCarousel(
            thisMonthDayBorderColor: Colors.grey,
            selectedDateTime: DateTime.now(),
            daysHaveCircularBorder: false,

            /// null for not rendering any border, true for circular border, false for rectangular border
//                    markedDatesMap: _markedDateMap,
          ),
        ));
  }
}
