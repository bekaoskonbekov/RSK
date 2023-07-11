import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 
import 'package:rsk1/common/widgets/list_view_electronic_widget.dart';
import 'package:rsk1/common/widgets/list_view_otopen_widget.dart';

import '../../../../generated/locale_keys.g.dart';

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
                        icon: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      value: currentItem,
                      selectedItemBuilder: (context) {
                        return list.map<Widget>((String item) {
                          return Container(
                            width: 180,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                item,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList();
                      },
                      borderRadius: BorderRadius.circular(10),
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
                            child: Container(
                              width: 250,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ));
                      }).toList(),
                    )
                  ],
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
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
