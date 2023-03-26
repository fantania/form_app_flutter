import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 40, bottom: 40),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('9:30', 'AM'),
                SizedBox(width: 20),
                timeMethod('9:45', 'AM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('10:00', 'AM'),
                SizedBox(width: 20),
                timeMethod('10:15', 'AM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('10:30', 'AM'),
                SizedBox(width: 20),
                timeMethod('10:45', 'AM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('11:00', 'AM'),
                SizedBox(width: 20),
                timeMethod('11:15', 'AM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('11:30', 'AM'),
                SizedBox(width: 20),
                timeMethod('11:45', 'AM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('12:00', 'PM'),
                SizedBox(width: 20),
                timeMethod('12:15', 'PM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('2:30', 'PM'),
                SizedBox(width: 20),
                timeMethod('2:45', 'PM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('3:00', 'PM'),
                SizedBox(width: 20),
                timeMethod('3:15', 'PM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('3:30', 'PM'),
                SizedBox(width: 20),
                timeMethod('3:45', 'PM'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                timeMethod('4:00', 'PM'),
                SizedBox(width: 20),
                timeMethod('4:15', 'PM'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container timeMethod(time, ap) {
  return Container(
    child: Center(
      child: Text(
        '$time  $ap',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    ),
    width: 125,
    height: 45,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}
