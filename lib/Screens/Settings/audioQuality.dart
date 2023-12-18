import 'package:flutter/material.dart';
import 'package:podcastapp/textstyle.dart';

import '../../colors.dart';

class AudioQuality extends StatefulWidget {
  const AudioQuality({super.key});

  @override
  State<AudioQuality> createState() => _AudioQualityState();
}

class _AudioQualityState extends State<AudioQuality> {

  String selectedAudioQuality = '';


  Widget buildAudioQualityOption(String title, String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAudioQuality = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(
              selectedAudioQuality == value
                  ? Icons.check
                  : null,
              color: selectedAudioQuality == value ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: gradient1,
            leading:  GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
                },
              child: Icon(Icons.arrow_back_ios,color: textColor,size:30),
            ),
            title: Text("Audio Quality",style: homePageHeading,),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height*1,
            width: MediaQuery.of(context).size.width*1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradient1,gradient2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Streaming",style: homePageHeading,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wi-Fi streaming",style: homeSubHeading,),
                        buildAudioQualityOption('Automatic', 'automatic'),
                        buildAudioQualityOption('Low', 'low'),
                        buildAudioQualityOption('Normal', 'normal'),
                        buildAudioQualityOption('High', 'high'),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile streaming",style: homeSubHeading,),
                        buildAudioQualityOption('Automatic', 'automatic'),
                        buildAudioQualityOption('Low', 'low'),
                        buildAudioQualityOption('Normal', 'normal'),
                        buildAudioQualityOption('High', 'high'),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ),
        )
    );
  }
}
