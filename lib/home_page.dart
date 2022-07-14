import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            tileColor: Colors.amber,
            value: isCheck,
            activeColor: Colors.red,
            checkColor: Colors.amber,
            checkboxShape: StadiumBorder(),
            title: const Text('Checkbox'),
            shape: StadiumBorder(),
            onChanged: (value) {
              setState(() {
                isCheck = value!;
              });
            },
          ),
          Checkbox(
              activeColor: Colors.red,
              checkColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              value: isCheck,
              onChanged: (bool? newValue) {
                setState(() {
                  isCheck = newValue!;
                });
              }),


              
        ],
      ),
    );
  }
}
