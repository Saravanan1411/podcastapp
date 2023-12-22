import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';
import 'package:podcastapp/textstyle.dart';
import 'package:http/http.dart' as http;
import '../ApiModel/AudioGetByAuthorId.dart';
import '../ApiModel/AuthorByIdModel.dart';

class AuthorProfile extends StatefulWidget {
  final String authorId;
  const AuthorProfile({super.key, required this.authorId});

  @override
  State<AuthorProfile> createState() => _AuthorProfileState();
}

class _AuthorProfileState extends State<AuthorProfile> {

  Future<AuthorGetById> AuthorGetApi() async {
    try {
      print("abcd");
      var homeResponse = await http.get(Uri.parse("http://localhost:4000/api/authormastergetbyid/6583eb2e491853e7ce707f6e"));
      print("abcde - Status code: ${homeResponse.statusCode}");

      if (homeResponse.statusCode == 200) {
        var authorData = homeResponse.body;

        print("Author data: $authorData");

        try {
          // Try to parse the JSON string
          var decodedData = jsonDecode(authorData);

          if (decodedData is List<dynamic>) {
            // Assuming the JSON array needs to be handled differently
            // Adapt this part according to your data model
            // For example, if you expect the first item in the array to be the AuthorGetById data:
            if (decodedData.isNotEmpty && decodedData[0] is Map<String, dynamic>) {
              return AuthorGetById.fromJson(decodedData[0]);
            } else {
              print("Unexpected response format. Parsed response: $decodedData");
              throw Exception('Unexpected response format');
            }
          } else if (decodedData is Map<String, dynamic>) {
            // Assuming the JSON object has key-value pairs representing AuthorGetById properties
            return AuthorGetById.fromJson(decodedData);
          } else {
            // Handle the case where the parsed response is neither a Map nor a List
            print("Unexpected response format. Parsed response: $decodedData");
            throw Exception('Unexpected response format');
          }
        } catch (e) {
          // Handle the case where parsing fails
          print("Error parsing JSON: $e");
          throw Exception('Error parsing JSON');
        }
      } else {
        // Handle the case where the HTTP request fails
        print("HTTP request failed with status code: ${homeResponse.statusCode}");
        throw Exception('Failed to load author data');
      }
    } catch (error) {
      print("Error: $error");
      throw Exception('An error occurred while processing the request');
    }
  }
  Future<List<AudioGetByAuthorId>> AudioByAuthor() async {
    var authorResponse = await http.get(Uri.parse("http://localhost:4000/api/audiouploadgetbyauthorid/6583eb2e491853e7ce707f6e"));

    if (authorResponse.statusCode == 200) {
      var authorAudioData = jsonDecode(authorResponse.body);

      if (authorAudioData is List) {
        return authorAudioData.map((e) => AudioGetByAuthorId.fromJson(e)).toList();
      } else {
        // Handle the case where the response is not a List
        throw Exception('Unexpected response format');
      }
    } else {
      // Handle the case where the HTTP request fails
      throw Exception('Failed to load audio data');
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthorGetApi();
    AudioByAuthor();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:
          NestedScrollView(
            headerSliverBuilder: (BuildContext context,  bool  innerBoxIsScrolled){
            return [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 600,
              floating: false,
              stretch: true,

              flexibleSpace: FutureBuilder(
                  future: AuthorGetApi(),
                  builder: (context,snapshot){

                    if(snapshot.hasData){
                      print("klllll");
                      return FlexibleSpaceBar(
                        stretchModes: [
                          StretchMode.blurBackground
                        ],
                        centerTitle: true,
                        //title: Text(snapshot.data![index].authorName.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        collapseMode: CollapseMode.none,
                        background: Container(
                          height: 600,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 550,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    image: DecorationImage(
                                        image: NetworkImage("http://localhost:4000/api${snapshot.data!.authorProfilePicture}"),
                                        fit: BoxFit.fill
                                    )

                                ),
                                child: Center(child: Text(snapshot.data!.authorName.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),

                              );
                            },

                          ),
                        ),
                      );
                    }
                    else if (snapshot.hasError){
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),



              leading: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios,size: 30,color: textColor,)
              ),
            ),


            ];
          },
            body:
            FutureBuilder(
                future: AudioByAuthor(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [gradient1,gradient2],
                            begin:Alignment.topCenter,
                            end: Alignment.bottomRight
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: gradient2,
                                      child: IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.play_arrow, color: Colors.white, size: 40,)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Popular",style: side_Heading,),
                                ],
                              ),
                              Container(
                                height: 400,
                                width: double.infinity,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (BuildContext con, index){
                                      return  ListTile(
                                        leading: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: NetworkImage("http://localhost:4000/api${snapshot.data![index].banner}"),
                                                  fit: BoxFit.fill
                                              )
                                          ),
                                        ),
                                        title: Text(snapshot.data![index].audioTitle.toString(),style: side_Heading,
                                        ),
                                        subtitle: Text(snapshot.data![index].audioTitle.toString(), style:
                                        sideHeading
                                        ),
                                        trailing: Icon(Icons.more_horiz,color: Colors.white,),
                                      );
                                    }),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Podography",style: side_Heading,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: FutureBuilder(
                                  future:  AudioByAuthor(),
                                  builder: (BuildContext context,snapshot) {
                                    return   Container(
                                      height: 150,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          scrollDirection:Axis.horizontal ,
                                          itemCount:snapshot.data!.length,
                                          itemBuilder:(BuildContext con,index)
                                          {
                                            return Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                        image: NetworkImage("http://localhost:4000/api${snapshot.data![index].banner}"),
                                                        fit: BoxFit.fill
                                                    )
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    );
                                  },

                                ),


                              ),


                              SizedBox(height: 20,),
                              Text("Author's pick",style: side_Heading,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: FutureBuilder(
                                  future:  AudioByAuthor(),
                                  builder: (BuildContext context,snapshot) {
                                    return   Container(
                                      height: 500,
                                      width: double.infinity,
                                      child: ListView.builder(
                                          itemCount:1,
                                          itemBuilder:(BuildContext con,index)
                                          {
                                            return Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 400,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                        image: NetworkImage("http://localhost:4000/api${snapshot.data![1].banner}",),
                                                        fit: BoxFit.fill
                                                    )
                                                ),
                                              ),
                                            );
                                          }
                                      ),
                                    );
                                  },

                                ),


                              ),


                              Text("Recommended artist",style: side_Heading,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: Container(
                                  height: 125,

                                  child: FutureBuilder(
                                    future: AuthorGetApi(),
                                    builder: (BuildContext context,snapshot) {
                                      return   ListView.builder(
                                          scrollDirection:Axis.horizontal ,
                                          itemCount:5,
                                          itemBuilder:(BuildContext con,index)
                                          {
                                            return Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Container(
                                                height:125,
                                                width: 125,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                    color: Colors.purple,
                                                    image: DecorationImage(
                                                        image: NetworkImage("http://localhost:4000/api${snapshot.data!.authorProfilePicture}"),
                                                        fit: BoxFit.fill
                                                    )

                                                ),
                                              ),
                                            );
                                          }
                                      );
                                    },

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ) ;
                  }
                  return CircularProgressIndicator();
                }),

          )
      ),
    );
  }
}