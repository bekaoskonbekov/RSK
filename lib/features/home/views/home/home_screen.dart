import 'package:flutter/material.dart';

import '../../common/card_container_widget.dart';
import '../../common/row_button_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Новости',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.notifications)
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: _buildCreditCard(
                  color: Color.fromRGBO(12, 33, 124, 0.871),
                  cardNumber: "3546 7532 XXXX 9742",
                ),
              ),
              SizedBox(
                height: 57,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowButtonContainerWidget(
                    
                    text: 'Transfer', icons: Icons.send_to_mobile_outlined, onTapped: () {  },
                  ),
                  RowButtonContainerWidget(
                    
                    text: 'Pay', icons: Icons.ios_share_outlined, onTapped: () {  },
                  ),
                  RowButtonContainerWidget(
                    text: 'Top-up', icons: Icons.credit_card_outlined, onTapped: () {  },
                  ),
                  RowButtonContainerWidget(
                    text: 'More', icons: Icons.more_horiz_outlined, onTapped: () {  },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Последние транзакции ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              CardContainerWidget(
                cardText: 'Visa Income',
                images: 'assets/visa_icon.png',
                numText: '+2400',
              ),
              SizedBox(
                height: 15,
              ),
              CardContainerWidget(
                cardText: 'Mastercard',
                images: 'assets/matercard.png',
                numText: '+2400',
              )
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCreditCard({
    required Color color,
    required String cardNumber,
  }) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(),
            Padding(
              padding: const EdgeInsets.all(26),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/Rectangle.png'),
                  Container(
                      height: 74,
                      width: 144,
                      child: Image.asset(
                        'assets/image 8.png',
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Text(
              'Balace',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '5 678,22 с',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Image.asset(
          "assets/image 10.png",
          height: 20,
          width: 95,
        ),
      ],
    );
  }
}
