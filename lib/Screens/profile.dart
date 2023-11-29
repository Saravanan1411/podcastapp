import 'package:flutter/material.dart';
import 'package:podcastapp/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.settings,
                      size: 40,color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage("https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Saran",
                  style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
                SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Column(
                //       children: [
                //         Text("15",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //         )
                //         ),
                //         Text("Podcast",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text("158",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //             )
                //         ),
                //         Text("Followers",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text("25",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                //             )
                //         ),
                //         Text("Following",
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,
                //             )
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("My Favorite's",
                    style: TextStyle(
                        fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: 15,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext con, index)
                      {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 4),
                                image: DecorationImage(
                                  image: NetworkImage("https://i.pinimg.com/originals/b1/0e/40/b10e40aef48acb9ce68f126a6c81c0e7.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle
                            ),
                          ),
                        );
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.query_stats,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Stats",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.download,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Downloads",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.file_open_sharp,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Files",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.star,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("Starred",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white30,width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Icon(Icons.history,color: Colors.white,size: 30,),
                        SizedBox(width: 30),
                        Text("History",
                          style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30
                          ),
                        ),
                      ],
                    ),
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


