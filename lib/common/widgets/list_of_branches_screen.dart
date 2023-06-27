import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rsk1/common/widgets/list_view_electronic_widget.dart';
import 'package:rsk1/common/widgets/list_view_otopen_widget.dart';

import '../../generated/locale_keys.g.dart';
import 'height_container_widget.dart';
import '../../features/home/views/history/history_screen.dart';

class ListOfBranchesScreen extends StatefulWidget {
  const ListOfBranchesScreen({Key? key}) : super(key: key);

  @override
  State<ListOfBranchesScreen> createState() => _ListOfBranchesScreenState();
}

class _ListOfBranchesScreenState extends State<ListOfBranchesScreen> {
  List<String> list = [
    LocaleKeys.bish.tr(),
    LocaleKeys.osh.tr(),
    LocaleKeys.talas.tr(),
    LocaleKeys.yssykkul.tr(),
    LocaleKeys.naryn.tr(),
    LocaleKeys.jalalabad.tr(),
    LocaleKeys.chuiskaya_oblast.tr(),
    LocaleKeys.oshh.tr(),
    LocaleKeys.batken.tr(),
  ];
  String currentItem = "";
  @override
  void initState() {
    currentItem = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      value: currentItem,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      icon: const Icon(
                        CupertinoIcons.chevron_down,
                        size: 16,
                      ),
                      style: const TextStyle(color: Colors.deepPurple),
                      onChanged: (value) {
                        setState(() {
                          currentItem = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            onTap: () {},
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            ));
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                  indicatorPadding: EdgeInsets.all(6),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: null,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  tabs: [
                    Tab(
                      text: LocaleKeys.otkryto.tr(),
                    ),
                    Tab(
                      text: LocaleKeys.elektronnyi_ochered.tr(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListViewOpenWidget(),
                      ListViewBuilderWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
