import 'package:flutter/material.dart';

class CardContainerWidget extends StatelessWidget {
  final String cardText;
  final String images;
  final String numText;

  const CardContainerWidget({
    Key? key,
    required this.cardText,
    required this.images,
    required this.numText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.blueGrey, blurRadius: 3, offset: Offset(0, 0)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Image(image: AssetImage(images)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardText,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            numText,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.blue,
                
                ),

          ),
        ],
      ),
    );
  }
}
