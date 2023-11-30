import 'package:flutter/material.dart';
import 'package:podcastapp/textstyle.dart';

import '../colors.dart';

class CategoryList extends StatefulWidget {
  final String categoryHead;
  const CategoryList({super.key, required this.categoryHead});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Text("${widget.categoryHead}",style: homePageHeading,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Podcasts",style: sideHeading,),
                    )
                  ],
                ),
                Container(
                  height: 125,
                  // width: 500,
                  child: ListView.builder(
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
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                          ),
                        );
                      }
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Authors',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                    )
                  ],
                ),
                Container(
                  height: 300,
                  child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      children: List.generate(20, (index) {
                        return Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                        );

                      },)
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}