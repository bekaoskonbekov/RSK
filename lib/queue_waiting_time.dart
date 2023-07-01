import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/generated/locale_keys.g.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen();

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  static var countdownDuration1 = Duration(minutes: 10);
  Duration duration1 = Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {
    var mints1;
    var secs1;
    mints1 = int.parse("30");
    secs1 = int.parse("00");
    countdownDuration1 = Duration(minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(
                    width: 353,
                    height: 394,
                    decoration: const BoxDecoration(
                      color: Color(0xffEDEDED),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(LocaleKeys.vash_talon.tr(),
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 20,
                            )
                            ),
                        Text(
                          'A102',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 160,
                          child: Stack(
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 160,
                                  width: 160,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Center(
                                child: buildTime1(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80,),
                  ElevatedButton(onPressed: (){}, child: Text(LocaleKeys.pokinut.tr()),
                  style: ButtonStyle(
                    
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                        
                      ),
                      
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                  )
                  ),
                ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = Duration());
    }
  }

  void startTimer1() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime1());
  }

  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(
        time: minutes,
      ),
      Text(
        ':',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
      ),
      buildTimeCard(
        time: seconds,
      ),
    ]);
  }

  Widget buildTimeCard({
    required String time,
  }) =>
      Center(
        child: Text(
          time,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
        ),
      );
}
