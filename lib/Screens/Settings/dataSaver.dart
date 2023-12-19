import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../textstyle.dart';

class DataSaver extends StatefulWidget {
  const DataSaver({super.key});

  @override
  State<DataSaver> createState() => _DataSaverState();
}

class _DataSaverState extends State<DataSaver> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: gradient1,
            leading: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
                child: Icon(Icons.arrow_back_ios_new_outlined,)
            ),
            title: Text('Data Saver',style: homePageHeading
            ),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height*1,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradient1,gradient2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Data Saver',
                          style: homePageHeading,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),),
                            Switch(value: light,
                                activeColor: Colors.white,
                                onChanged: (bool value){
                                  setState(() {
                                    light = value;
                                  });
                                }),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Text("Video Podcasts",style:
                        homePageHeading
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Download audio only",style:
                        homePage_Heading
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),)
                              ],
                            ),
                            Row(
                              children: [
                                Switch(value: light,
                                    activeColor: Colors.white,
                                    onChanged: (bool value){
                                      setState(() {
                                        light = value;
                                      });
                                    })
                              ],
                            ),
                          ]
                      ),
                    ),
                    Row(
                      children: [
                        Text("Stream audio only",style:
                        homePage_Heading                        )
                      ],
                    ),
                    SizedBox(
                  height: 100,
                  width: 400,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Sets audio qualiry to low , and hides canvases\n as well as audio & video previews on home",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.normal),)
                          ],
                        ),
                        Row(
                          children: [
                            Switch(value: light,
                                activeColor: Colors.white,
                                onChanged: (bool value){
                                  setState(() {
                                    light = value;
                                  });
                                })
                          ],
                        ),
                      ]
                  ),
                ),
                  ],
                ),
              )
          ),
        )
    );
  }
}