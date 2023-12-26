import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:podcastapp/Screens/podcastList.dart';
import 'package:podcastapp/Screens/podcastPlayer.dart';
import 'package:podcastapp/textstyle.dart';
import 'package:http/http.dart' as http;
import '../ApiModel/AudioGetModel.dart';
import '../ApiModel/AuthorDataGetModel.dart';
import '../colors.dart';
import 'authorProfile.dart';

class CategoryList extends StatefulWidget {
  final String categoryHead;
  const CategoryList({super.key, required this.categoryHead});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  Future<List<AuthorGet>> CategoryGetApi() async{
    var authorListResponse = await http.get(Uri.parse("http://localhost:4000/api/authormasterget"));
    var authorListData =jsonDecode(authorListResponse.body);
    print(authorListData);
    return (authorListData as List).map((e) => AuthorGet.fromJson(e)).toList();

  }

  Future<List<AudioGet>> AudioApi() async{
    var audioResponse = await http.get(Uri.parse("http://localhost:4000/api/audiouploadmasterget"));
    var audio =jsonDecode(audioResponse.body);
    return (audio as List).map((e) => AudioGet.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryGetApi();
    AudioApi();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,Colors.purple
            ],
                begin: Alignment.topCenter,
                end: Alignment.center
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(widget.categoryHead,style: homePageHeading,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: AudioApi(),
                      builder: (BuildContext context,snapshot) {
                        if(snapshot.hasData) {
                          List<AudioGet> list = snapshot.data!;
                          return Column(
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
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PodcastList(modelList: snapshot.data!.toList(),)));
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
                              SizedBox(
                                height: 125,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: list.length,
                                    itemBuilder: (BuildContext con,index)
                                    {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap:(){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PodcastPlayer(songId: list[index].id.toString(),)));
                                          },
                                          child: Container(
                                            height: 125,
                                            width: 125,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: NetworkImage("http://localhost:4000/api${list[index].banner}"),
                                                fit: BoxFit.fill,
                                              ),
                                              color: Colors.cyan,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              ),
                            ],
                          );
                        }
                        else if (snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },

                    ),
                  ),
                  Divider(
                    height: 50,
                    color: Colors.white,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Authors", style: sideHeading,)
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PodcastList(modelList: [],)));
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
                    height: 250,
                    child:FutureBuilder(
                      future: CategoryGetApi(),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.hasData){
                          return GridView.count(
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,

                              children: List.generate(2, (index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){

                                      //print("aaaaaaaaaa${snapshot.data![index].authorName}");
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthorProfile(authorId: snapshot.data![index].sId.toString(),
                                        //authorList: snapshot.data!.toList(),
                                        authorpic: snapshot.data![index].authorProfilePicture.toString(),
                                        authorname: snapshot.data![index].authorName.toString(),
                                      )));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage("http://localhost:4000/api${snapshot.data![index].authorProfilePicture}"),
                                          fit: BoxFit.fill
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                              },)
                          );
                        }else if(snapshot.hasError){
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },

                    ),

                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}