import 'package:flutter/material.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        const SizedBox(
                          width: 40,
                        ),
                        const Text('Мой талон ',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                        height: 380,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(179, 237, 232, 232),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  child: const Column(
                                    children: [
                                      Text('Ваш код',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      Text('1254',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Дата посещения',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                                  Text(
                                    'Сегодня 14:55',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 20),
                                  Text('Услуга',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                                  Text(
                                    'Открыть счет ',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 20),
                                  Text('Адрес филиала',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                                  Text(
                                    'г.Бишкек, уд.Фрунзе 338',
                                    style: TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                    SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Сканировать QR-код',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _showDialog(context);
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.pop(context);
                });
                      },
                      child: Text('Отменить', style: TextStyle(color: Colors.red)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shadowColor: Colors.red,
                          foregroundColor: Colors.red,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              )));
            }
          
        
    
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
                width: 360,
                height: 220,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.highlight_off_outlined,
                          color: Colors.red,
                          size: 100,
                        ),
                      ),
                      Text('Вы отменили талон',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }

