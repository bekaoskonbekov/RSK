import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/height_container_widget.dart';
import '../history/history_screen.dart';


class ListOfBranchesScreen extends StatelessWidget {
  const ListOfBranchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      }, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 40,
                  ),
                  Text('Бишкек',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  IconButton(
                      onPressed: () {
                        _showDialog(context);
                      },
                      icon: Icon(CupertinoIcons.chevron_down, size: 18)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        '             Открыто              ',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[300]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Электронный очередь',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryScreen()));
                      },
                      child: HeightContainerWidget(
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'г. Бишкек, ул. Фрунзе, 338',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Центр денежных переводов',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 7,
                                          width: 7,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Открыто '),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 7,
                                          width: 7,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('Электронный очередь'),
                                      ],
                                    )
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
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
                height: 440,
                child: Column(
                  children: [
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Бишкек')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Ош')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Нарын')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Талас')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Баткен')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Джалал-Абад')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Иссык-Куль')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HeightContainerWidget(
                      height: 46,
                      child: Center(child: Text('Чуй')),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }
}
