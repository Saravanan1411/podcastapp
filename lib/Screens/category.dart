import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';
import 'package:http/http.dart' as http;
import '../ApiModel/CategoryGetModel.dart';
import '../textstyle.dart';
import 'categoryList.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final items = [
    "Hot News",
    "Trending",
    "Motivation",
    "Technology",
    "Interview",
    "Society",
    "Education",
    "Sports",
    "Politics",
    "Arts",
    "Music",
    "Cinema",
    "History",
    "Crime",
    "Culture",
    "Drama",
    "Spirituality",
  ];

  Future<List<CategoryGet>> CategoryGetApi() async{
    var audioResponse = await http.get(Uri.parse("http://localhost:4000/api/categorymasterget"));
    var audioData =jsonDecode(audioResponse.body);
    return (audioData as List).map((e) => CategoryGet.fromJson(e)).toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryGetApi();
  }

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
                end: Alignment.bottomCenter,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Category", style:homePageHeading),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*1,
                  width: MediaQuery.of(context).size.width*1,
                  child: FutureBuilder(
                    future: CategoryGetApi(),
                    builder: (BuildContext context,snapshot) {
                      return  GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount:snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryList( categoryHead: items[index])));
                                },
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: NetworkImage("http://localhost:4000/api${snapshot.data![index].categoryImage}"),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                  child: Center(
                                    child: Text(snapshot.data![index].categoryName.toString(),style:buttonText,),
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                    },

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
