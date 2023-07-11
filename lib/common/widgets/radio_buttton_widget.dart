import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/features/home/views/profile/atm_screen.dart';
import 'package:rsk1/features/home/views/qr_code/qr_code_screen.dart';

import '../../generated/locale_keys.g.dart';
import '../../routes/router.dart';

class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {
  String radioItem = '';

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          activeColor: Colors.blue,
          title: Text(
            LocaleKeys.yurlits.tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          groupValue: radioItem,
          value: 'Item 1',
          onChanged: (val) {
            setState(() {
              radioItem = val!;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          groupValue: radioItem,
          activeColor: Colors.blue,
          title: Text(
            LocaleKeys.fizluts.tr(),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          value: 'Item 2',
          onChanged: (val) {
            setState(() {
              radioItem = val!;
            });
          },
        ),
        SizedBox(height: 10),
        radioItem != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Text(
                            'Пн',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('07:00 \n17:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        children: [
                          Text(
                            'Вт',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('07:00 \n17:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            'Ср',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('07:00 \n17:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            'Чт',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('07:00 \n17:00')
                        ],
                      )),
                  Container(
                      height: 70,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 214, 214, 214),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            'Пт',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text('07:00 \n17:00')
                        ],
                      )),
                ],
              )
            : SizedBox(),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Routes.instance.push(widget: QrCodeScreen(), context: context);
          },
          child: Text(
            LocaleKeys.zanyat_ochered.tr(),
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(345, 40),
              primary: radioItem != null
                  ? Color.fromARGB(255, 166, 184, 192)
                  : Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        )
      ],
    );
  }
}
