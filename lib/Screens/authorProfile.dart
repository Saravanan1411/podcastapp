import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';
import 'package:podcastapp/textstyle.dart';

class AuthorProfile extends StatefulWidget {
  const AuthorProfile({super.key});

  @override
  State<AuthorProfile> createState() => _AuthorProfileState();
}

class _AuthorProfileState extends State<AuthorProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:
          NestedScrollView(headerSliverBuilder: (BuildContext context,  bool  innerBoxIsScrolled){
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                pinned: true,
                expandedHeight: 350,
                floating: false,
                stretch: true,

                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.blurBackground
                  ],
                  centerTitle: true,
                  title: Text('Golden Words of Bharathiar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  collapseMode: CollapseMode.none,
                  background: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                      image: DecorationImage(
                          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS0kNCcYWPZ9lxfNd5Xz9K41Shv6Mcl2r7y3PNX61DRG9SASzRQN7R6GywWeiZrMbjlPs&usqp=CAU"),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                ),


                leading: Icon(Icons.arrow_back_ios,size: 30,color: textColor,),
              )
            ];
          }, body:
          Container(
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
                          itemCount: 5,
                          itemBuilder: (BuildContext con, index){
                            return  ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                              ),
                              title: Text('Badass',style: side_Heading,
                              ),
                              subtitle: Text('184,059,924', style:
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
                      child: Container(
                        height: 125,

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
                    ),

                    SizedBox(height: 20,),
                    Text("Author's pick",style: side_Heading,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Text("Recommended artist",style: side_Heading,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,0),
                      child: Container(
                        height: 100,
                        child: GridView.count(
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 1,
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          )
      ),
    );
  }
}