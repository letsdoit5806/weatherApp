import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/model/weather_data.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:weather_app/weather_forecast_item.dart';




class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}


class _WeatherScreenState extends State<WeatherScreen> {
  bool isLoding =true;
  late List<WeatherData> data;
  @override
void initState() {
  super.initState();
  fetchWeatherData();
}

void fetchWeatherData() async {
  data= await Weatherservice.weatherData();
  setState(() {
    isLoding = false;
  });
  // You can now use `data` to setState or process it
  for(int i=0;i<data.length;i++){
    data[i].display();
  }
  
}



//main card
  Widget mainCard(){
    return
    SizedBox(
              width: double.infinity,
              child: Card(
                color: const Color.fromARGB(255, 39, 51, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text("0 K" ,
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ) ,
                          ),
                          const SizedBox(height: 20,),
                          Icon(Icons.cloud,size: 80,),
                          const SizedBox(height: 20,),
                          Text(
                            "Rain",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20,),
                                    
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
        ],
        ),
      body:isLoding?CircularProgressIndicator():Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            //main card
            mainCard(),
            const SizedBox(height: 20,),
            //weather forecast cards
            const Text(
              "Weather Forecast",
              style:TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
               ),
            ),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context,index){
                  return HourlyForecastItem(time: TimeOfDay(hour: data[index].dateTime.hour, minute: data[index].dateTime.minute).format(context), iconData: Icons.cloud, temp: data[index].temp);

                }
              )
              ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       HourlyForecastItem(
            //         time: "00:00",
            //         iconData: Icons.cloud,
            //         temp: 300.02,
            //       ),
            //       HourlyForecastItem(
            //         time: "03:00",
            //         iconData: Icons.sunny,
            //         temp: 300.02,
            //       ),
            //       HourlyForecastItem(
            //         time: "06:00",
            //         iconData: Icons.cloudy_snowing,
            //         temp: 100.02,
            //       ),
            //       HourlyForecastItem(
            //         time: "09:00",
            //         iconData: Icons.water_drop,
            //         temp: 300.02,
            //       ),
            //       HourlyForecastItem(
            //         time: "12:00",
            //         iconData: Icons.sunny,
            //         temp: 300.02,
            //       ),
                  
                  
            //     ],
            //   ),
            // )
            const SizedBox(height: 20,),
            const Text(
              "Additional Info",
              style:TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
               ),
            ),
            const SizedBox(height: 15,),
            //additional ingo

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  AdditionalInfo(iconData: Icons.water_drop, titleText: "Humidity", val: 100),

                  AdditionalInfo(iconData: Icons.air, titleText: "wind speed", val: 7.67),

                  AdditionalInfo(iconData: Icons.beach_access, titleText: "Pressure", val: 1000),
                  
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}



