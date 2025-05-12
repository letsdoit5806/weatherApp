import 'package:flutter/material.dart';
class AdditionalInfo extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final double val;

  const AdditionalInfo({super.key, required this.iconData, required this.titleText, required this.val});

  @override
  Widget build(BuildContext context) {
    return  Column(
                    children: [
                      Icon(iconData,size:50),
                      SizedBox(height: 10,),
                      Text(
                        titleText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),  
                      ),
                      SizedBox(height: 10,),
                      Text(
                        val.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),  
                      )
                    ],
                  );
  }
}