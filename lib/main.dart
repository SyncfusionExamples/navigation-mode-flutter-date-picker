import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(ViewNavigationMode());

class ViewNavigationMode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<ViewNavigationMode> {
  DateRangePickerNavigationMode _navigationMode =
      DateRangePickerNavigationMode.scroll;
  List<String> _viewNavigationMode = <String>[
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
            title: Text("Select navigation mode"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
              PopupMenuButton<String>(
                icon: Icon(Icons.party_mode),
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
