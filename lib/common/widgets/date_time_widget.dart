import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key}) : super(key: key);

  @override
  State<DateTimeWidget> createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {

String _chosenDateTime = DateFormat().format(DateTime.now());
  void _showDatePicker(BuildContext ctx) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              return Expanded(
                child: Container(
                  height: 372,
                  width: 300,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: CupertinoDatePicker(
                          minimumDate: DateTime.now().subtract(Duration(days: 1)),
                          maximumDate: DateTime.now().add(Duration(days: 365)),
                            initialDateTime: DateTime.now(),
                            
                            onDateTimeChanged: (val) {
                              setState(() {
                                _chosenDateTime = DateFormat('dd-MM-yyyy hh:mm').format(val);
                              });
                            }),
                      ),

                      // Close the modal
                      CupertinoButton(
                          child: const Text('OK',
                              style: TextStyle(color: Colors.blue)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () => _showDatePicker(context),
            child: Container(
              width: 200,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              child: Center(
                child: Text(
                    _chosenDateTime != null
                        ? _chosenDateTime.toString()
                        : 'No date',
                    style: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
