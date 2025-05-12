import 'package:flutter/material.dart';
class HourlyForecastItem extends StatelessWidget{
  final String time;
  final IconData iconData;
  final double temp;
  const HourlyForecastItem({super.key, required this.time, required this.iconData, required this.temp});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 6,
                      child: Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Icon(iconData,size: 50,),
                            SizedBox(height: 8,),
                            Text(
                              temp.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
  
}