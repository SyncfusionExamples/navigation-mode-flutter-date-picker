import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(const ViewNavigationMode());

class ViewNavigationMode extends StatefulWidget {
  const ViewNavigationMode({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<ViewNavigationMode> {
  DateRangePickerNavigationMode _navigationMode =
      DateRangePickerNavigationMode.scroll;
  final List<String> _viewNavigationMode = <String>[
    'None',
    'Scroll',
    'Snap',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Select navigation mode"),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.arrow_forward), onPressed: () {}),
            PopupMenuButton<String>(
              icon: const Icon(Icons.party_mode),
              itemBuilder: (BuildContext context) {
                return _viewNavigationMode.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              onSelected: (String value) {
                setState(() {
                  if (value == 'None') {
                    _navigationMode = DateRangePickerNavigationMode.none;
                  } else if (value == 'Scroll') {
                    _navigationMode = DateRangePickerNavigationMode.scroll;
                  } else if (value == 'Snap') {
                    _navigationMode = DateRangePickerNavigationMode.snap;
                  }
                });
              },
            ),
          ],
        ),
        body: Card(
          margin: const EdgeInsets.fromLTRB(50, 100, 50, 120),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            navigationMode: _navigationMode,
          ),
        ),
      ),
    );
  }
}