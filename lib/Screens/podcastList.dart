import 'package:flutter/material.dart';
import 'package:podcastapp/datamodel/podcastdetails.dart';

import '../colors.dart';
import '../textstyle.dart';



class PodcastList extends StatefulWidget {
  const PodcastList({super.key});

  @override
  State<PodcastList> createState() => _PodcastListState();
}

class _PodcastListState extends State<PodcastList> {
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
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: Icon(Icons.arrow_back_ios,size: 30,color: textColor,)
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: podcastDataModelList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height:50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage((podcastDataModelList[index].bannerImage).toString()),
                                                fit: BoxFit.fill,
                                              )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text((podcastDataModelList[index].title).toString(),style: sideHeading,),
                                                Text((podcastDataModelList[index].author).toString())
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),


                                  Column(
                                    children: [
                                      Icon(Icons.more_horiz_rounded,color: textColor,)
                                    ],
                                  ),





                                ],
                              ),
                            );

                          },


                        )
                    )
                  ],
                ),
              ),
            )
          ),
        )
    );
  }
}
