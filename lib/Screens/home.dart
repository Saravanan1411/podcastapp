import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:podcastapp/Screens/podcastList.dart';
import 'package:podcastapp/Screens/podcastPlayer.dart';

import '../colors.dart';
import '../datamodel/podcastdetails.dart';
import '../textstyle.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                    
                //header
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi Albert !",style: homePageHeading,),
                          Text("Have a great by hearing the interesting podcast ",style: homeSubHeading)
                        ],
                      ),
                      Icon(Icons.notifications,size: 25,color: Color(0xff888888),)
                    
                    ],
                  ),
                ),
                    
                //top carousel
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height*0.2,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: 5,
                  itemBuilder: (BuildContext context , int index, int realIndex){
                    
                    return Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color:Colors.lightBlue,
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage((podcastDataModelList[index].bannerImage).toString()),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        Positioned(
                            bottom:10,
                            right:20,
                            child: GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PodcastPlayer()));
                              },
                                child: Icon(Icons.play_circle,color: textColor,size: 30,))
                        )
                      ]
                    );
                  },
                ),
                    
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      //recommended list
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.recommend_rounded,color: textColor,),
                                    Text("Recommended", style: sideHeading,)
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PodcastList()));
                                  },
                                  child: Row(
                                    children: [
                                      Text("See all",style: sideHeading,),
                                      Icon(Icons.arrow_circle_right,color: textColor,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 125,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                    
                                  itemCount: 5,
                                  itemBuilder: (BuildContext con,index)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          image: DecorationImage(
                                              image: NetworkImage((podcastDataModelList[index].bannerImage).toString()),
                                            fit: BoxFit.fill,
                                          ),
                                          color: Colors.cyan,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                      //trending list
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.trending_up,color: textColor,),
                                    Text("Trending", style: sideHeading,)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("See all",style: sideHeading,),
                                    Icon(Icons.arrow_circle_right,color: textColor,)
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 125,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                    
                                  itemCount: 5,
                                  itemBuilder: (BuildContext con,index)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.cyan,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                      //recently played
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.play_circle,color: textColor,),
                                    Text("Recently Played", style: sideHeading,)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("See all",style: sideHeading,),
                                    Icon(Icons.arrow_circle_right,color: textColor,)
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 125,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                    
                                  itemCount: 5,
                                  itemBuilder: (BuildContext con,index)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.cyan,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                      // technology
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.computer,color: textColor,),
                                    Text("Technology", style: sideHeading,)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("See all",style: sideHeading,),
                                    Icon(Icons.arrow_circle_right,color: textColor,)
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 125,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                    
                                  itemCount: 5,
                                  itemBuilder: (BuildContext con,index)
                                  {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 125,
                                        width: 125,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.cyan,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
