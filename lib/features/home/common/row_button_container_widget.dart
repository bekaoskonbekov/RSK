import 'package:flutter/material.dart';

class RowButtonContainerWidget extends StatelessWidget {
  final IconData icons;
  final String text;
  final VoidCallback onTapped;

  const RowButtonContainerWidget({
    Key? key,
    required this.icons,
    required this.text, required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          focusColor: Colors.blueGrey,
          onTap: onTapped,
          child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 3,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Icon(icons, color: Colors.blue)),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
