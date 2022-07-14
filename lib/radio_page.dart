import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  var selectedValue;
  var sliderValue = 0.0;
  RangeValues rangeValues = RangeValues(0.0, 100.0);
  RangeLabels rangeLabels = RangeLabels('0', '100');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Page'),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text('Radio 1'),
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              }),
          Radio(
              activeColor: Colors.amber,
              value: 1,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              }),
          Radio(
              activeColor: Colors.amber,
              value: 2,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              }),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('You selected ${selectedValue}'),
                action: SnackBarAction(label: 'Undo', onPressed: () {}),
                duration: Duration(seconds: 10),
                dismissDirection: DismissDirection.vertical,
              ));
            },
            child: Text('Show Snackbar'),
          ),
          // RangeSlider(
          //   values: rangeValues,
          //   labels: rangeLabels,
          //   min: 0.0,
          //   max: 100.0,
          //   onChanged: (RangeValues newValues) {
          //     setState(() {
          //       rangeValues = newValues;
          //       rangeLabels = RangeLabels(
          //           '${newValues.start.round()}', '${newValues.end.round()}');
          //     });
          //   },
          // ),
          RangeSlider(
              divisions: 10,
              min: 0.0,
              max: 100.0,
              values: rangeValues,
              labels: rangeLabels,
              activeColor: Colors.amber,
              inactiveColor: Colors.red,
              onChanged: (newvalue) {
                setState(() {
                  rangeValues = newvalue;
                  rangeLabels = RangeLabels('${rangeValues.start.round()}',
                      '${rangeValues.end.round()}');
                });
              }),

          Text(
              ' min ${rangeValues.start.round()} - max  ${rangeValues.end.round()}'),

          Slider(
              label: '${sliderValue.round()}',
              divisions: 5,
              max: 100,
              min: 0.0,
              thumbColor: Colors.amber,
              inactiveColor: Colors.black,
              activeColor: Colors.red,
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              }),
          Text(sliderValue.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
