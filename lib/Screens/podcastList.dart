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
                            return ListTile(
                              leading: Container(
                                  height:50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage((podcastDataModelList[index].bannerImage).toString()),
                                      fit: BoxFit.fill,
                                    )
                                  ),
                              ),
                              title: Text((podcastDataModelList[index].title).toString(),style: sideHeading,),
                              subtitle:Text((podcastDataModelList[index].author).toString()) ,
                              trailing: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder:(BuildContext context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height:50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: NetworkImage((podcastDataModelList[index].bannerImage).toString()),
                                                            )
                                                        ),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text((podcastDataModelList[index].title).toString()),
                                                          Text((podcastDataModelList[index].author).toString())
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.add_circle_outline_sharp),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("Add to Queue"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.remove_circle_outline),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("Remove from Queue"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.ios_share_rounded),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("Share"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.person_add_rounded),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("Podcast credits"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.attribution_rounded),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("View author"),
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                      onTap: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Close")
                                                  )

                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                    );
                                  },
                                  child: Icon(Icons.more_horiz_rounded,color: textColor,)
                              ) ,


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

