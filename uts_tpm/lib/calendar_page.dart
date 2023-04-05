import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // Define the default timezone
  String _timezone = 'WIB';
  DateTime _currentTime = DateTime.now().toUtc();

  @override
  void initState() {
    super.initState();
    // Update the time every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now().toUtc();
      });
    });
  }

  // Convert the time to the specified timezone
  DateTime _convertTimezone(DateTime time, String timezone) {
    switch (timezone) {
      case 'WIB':
        return time.add(Duration(hours: 7));
      case 'WITA':
        return time.add(Duration(hours: 8));
      case 'WIT':
        return time.add(Duration(hours: 9));
      default:
        return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Convert the current time to the selected timezone
    DateTime _localTime = _convertTimezone(_currentTime, _timezone);

    // Format the date and time
    String formattedDateTime = DateFormat('EEEE, dd MMMM yyyy HH:mm:ss').format(_localTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Show the timezone switcher
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text('WIB'),
                onPressed: () {
                  setState(() {
                    _timezone = 'WIB';
                  });
                },
              ),
              TextButton(
                child: Text('WITA'),
                onPressed: () {
                  setState(() {
                    _timezone = 'WITA';
                  });
                },
              ),
              TextButton(
                child: Text('WIT'),
                onPressed: () {
                  setState(() {
                    _timezone = 'WIT';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 32.0),
          // Show the current date and time in the selected timezone
          Text(
            formattedDateTime,
            style: TextStyle(fontSize: 32.0),
          ),
        ],
      ),
    );
  }
}