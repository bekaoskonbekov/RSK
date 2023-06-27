import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/common/widgets/date_time_widget.dart';
import 'package:rsk1/common/widgets/radio_buttton_widget.dart';
import 'package:rsk1/generated/locale_keys.g.dart';

import '../../../../common/widgets/height_container_widget.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var pickeddate;
  var pickedtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    LocaleKeys.obslujivanie_fiz.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    maxLines: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              HeightContainerWidget(
                  height: 46,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.vyboruslug.tr(),),
                        IconButton(
                            onPressed: () {
                              _showServicesDialog(context);
                            },
                            icon: Icon(CupertinoIcons.chevron_down)),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              HeightContainerWidget(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(LocaleKeys.data_posesheniya.tr(),), DateTimeWidget()],
                    ),
                  )),
                  SizedBox(height: 440),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                 LocaleKeys.zanyat_ochered.tr(),
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(345, 40),
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showServicesDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(builder: (context) {
              return Container(
                width: 200,
                height: 298,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LocaleKeys.vyboruslug.tr(),),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              CupertinoIcons.chevron_up,
                            )),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4),
                      child: HeightContainerWidget(
                        height: 46,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LocaleKeys.depozity.tr(),),
                              IconButton(
                                  onPressed: () {
                                    _showDateAndTimeDialog(context);
                                  },
                                  icon: Icon(CupertinoIcons.chevron_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: HeightContainerWidget(
                        height: 46,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LocaleKeys.vyboruslug.tr(),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.chevron_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: HeightContainerWidget(
                        height: 46,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LocaleKeys.vyboruslug.tr(),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.chevron_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: HeightContainerWidget(
                        height: 46,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LocaleKeys.vyboruslug.tr(),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.chevron_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                      ),
                      child: HeightContainerWidget(
                        height: 46,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(LocaleKeys.vyboruslug.tr(),),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.chevron_right))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }

  void _showDateAndTimeDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(builder: (context) {
              return Container(
                width: 500,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image 10.png',
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.g_bishkek.tr(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Центр денежных переводов',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(LocaleKeys.otkryto.tr(),),
                            ],
                          ),
                          Radiobutton(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }
}
