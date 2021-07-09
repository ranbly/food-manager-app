import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayChip extends StatelessWidget {
  final DateTime date;

  const DayChip({required this.date}) : super();

  int get day => DateTime.now().difference(date).inDays;

  @override
  Widget build(BuildContext context) {
    if (day >= 1) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
            color: Color(0xFF48A3FF), borderRadius: BorderRadius.circular(16)),
        child: Text('D+$day',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13)),
      );
    }

    if (day == 0) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        decoration: BoxDecoration(
            color: Color(0xFF48A3FF), borderRadius: BorderRadius.circular(16)),
        child: Text('D-day',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 13)),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFFD8E0EB))),
      child: day > -99
          ? Text('D$day',
              style: TextStyle(
                  color: Color(0xFF99A6B7),
                  fontWeight: FontWeight.w700,
                  fontSize: 13))
          : Text('D-99+',
              style: TextStyle(
                  color: Color(0xFF99A6B7),
                  fontWeight: FontWeight.w700,
                  fontSize: 13)),
    );
  }
}
