import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';

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
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: items.length,
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
                                  border: Border.all(color: textColor,width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.transparent
                              ),
                              child: Center(
                                child: Text(items[index], style: categoryCardText),
                              ),
                            ),
                          ),
                        );
                      }
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
