import 'package:flutter/material.dart';

class HeightContainerWidget extends StatelessWidget {
const HeightContainerWidget({ Key? key, required this.height, required this.child, this.onTap,  }) : super(key: key);
final double height;
final Widget child;
final VoidCallback? onTap;


  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity ,
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
              child: child,
      ),
    );
  }
}

class TextAndIconWidget extends StatelessWidget {
  const TextAndIconWidget({
    super.key,
    required this.icons,
    required this.text, required this.onTapped,
  });

  final IconData icons;
  final String text;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onTapped,
            child: Row(
              children: [
                Icon(icons, size: 24,),
                const SizedBox(width: 8,),
                Text(text,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
              ],
            ),
          ),

        
        ],
      ),
    );
  }
}