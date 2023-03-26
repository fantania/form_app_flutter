import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calendar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333A47),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Calendar Timeline',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.tealAccent[100]),
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2030, 12, 31),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.white70,
              dayColor: Colors.teal[200],
              //dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
            ),
          ],
        ),
      ),
    );
  }
}
