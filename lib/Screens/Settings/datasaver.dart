import 'package:flutter/material.dart';

class datasaverscreen extends StatefulWidget {
  const datasaverscreen({super.key});

  @override
  State<datasaverscreen> createState() => _datasaverscreenState();
}

class _datasaverscreenState extends State<datasaverscreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,size: 45,),
          title: Center(child: Text('Data Saver',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  Text('Data Saver',style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.normal),)
                ],
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                  Text("Video Podcasts",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),)
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Download audio only",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 25,color: Colors.white),)
                ],
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                  Text("Stream audio only",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 25),)
                ],
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
    );
  }
}
