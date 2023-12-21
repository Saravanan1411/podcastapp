import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../ApiModel/AudioGetModel.dart';
import '../textstyle.dart';
import '/colors.dart';
import '/datamodel/podcastdetails.dart';

class PodcastPlayer extends StatefulWidget {
  // final PodcastDetailsDataModel podcastDetails;
  const PodcastPlayer({super.key});

  @override
  State<PodcastPlayer> createState() => _PlaySongState();
}

class _PlaySongState extends State<PodcastPlayer> {
  late AudioPlayer _audioPlayer;
  double _sliderValue = 0.0;
  int _currentSongIndex = 0;
  double _playbackSpeed = 1.0; // Initial playback speed

  @override
  void initState() {
    super.initState();
    _audioFuture = AudioGetApi();
    _audioPlayer = AudioPlayer();
    _initPlayer();

  }
  Future<void> _initPlayer() async {
    await _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);


    // Listen for player state changes
    _audioPlayer.playerStateStream.listen((playerState) {
      final position = _audioPlayer.position;
      setState(() {
        // Update the slider value when the position is available
        _sliderValue = position.inSeconds.toDouble();
      });
    });

    // Listen for position changes
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _sliderValue = position.inSeconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  late Future<List<AudioGet>> _audioFuture;


  Future<List<AudioGet>> AudioGetApi() async{
    var audioResponse = await http.get(Uri.parse("http://localhost:4000/api/audiouploadmasterget"));
    var audioData =jsonDecode(audioResponse.body);

    return(audioData as List).map((e) => AudioGet.fromJson(e)).toList();
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
                end: Alignment.bottomRight,
              )
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios,color: textColor,size:30)
                        ),
                        GestureDetector(
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
                                                        image: NetworkImage((podcastDataModelList[_currentSongIndex].bannerImage).toString()),
                                                      )
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text((podcastDataModelList[_currentSongIndex].title).toString()),
                                                    Text((podcastDataModelList[_currentSongIndex].author).toString())
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
                                                Icon(Icons.add_circle_outline_sharp),
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
                            child: Icon(Icons.more_horiz_rounded,size: 30,color: textColor,)
                        )
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: _audioFuture,
                    builder: (BuildContext context,snapshot) {
                      if(snapshot.hasData) {
                        List<AudioGet> list = snapshot.data!;
                        return  Container(
                          height: MediaQuery.of(context).size.height*0.65,
                          width: MediaQuery.of(context).size.width*0.9,
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image: NetworkImage(list.banner.toString()),
                          //   ),
                          // ),
                        )
                      ;

                        //   Container(
                        //   height: MediaQuery.of(context).size.height*0.65,
                        //   width: MediaQuery.of(context).size.width*0.9,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: list.length,
                        //       itemBuilder: (BuildContext con,index)
                        //       {
                        //         return Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Container(
                        //             height: MediaQuery.of(context).size.height*0.65,
                        //             width: MediaQuery.of(context).size.width*0.9,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(25),
                        //               image: DecorationImage(
                        //                 image: NetworkImage(list[index].banner.toString()),
                        //                 fit: BoxFit.fill,
                        //               ),
                        //               color: Colors.cyan,
                        //             ),
                        //           ),
                        //         );
                        //       }
                        //   ),
                        // );
                        //   CarouselSlider.builder(
                        //   options: CarouselOptions(
                        //     height: MediaQuery.of(context).size.height*0.2,
                        //     aspectRatio: 16/9,
                        //     viewportFraction: 0.8,
                        //     enableInfiniteScroll: true,
                        //     autoPlay: true,
                        //     autoPlayInterval: Duration(seconds: 5),
                        //     autoPlayAnimationDuration: Duration(milliseconds: 400),
                        //     scrollDirection: Axis.horizontal,
                        //   ),
                        //   itemCount: list.length,
                        //   itemBuilder: (BuildContext context , int index, int realIndex){
                        //
                        //     return Stack(
                        //         children: [
                        //           Container(
                        //             height: double.infinity,
                        //             width: double.infinity,
                        //             margin: EdgeInsets.symmetric(horizontal: 10.0),
                        //             decoration: BoxDecoration(
                        //                 color:Colors.lightBlue,
                        //                 borderRadius: BorderRadius.circular(25),
                        //                 image: DecorationImage(
                        //                     image: NetworkImage(list[index].banner.toString()),
                        //                     fit: BoxFit.fill
                        //                 )
                        //             ),
                        //           ),
                        //           Positioned(
                        //               bottom:10,
                        //               right:20,
                        //               child: GestureDetector(
                        //                   onTap:(){
                        //                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PodcastPlayer()));
                        //                   },
                        //                   child: Icon(Icons.play_circle,color: textColor,size: 30,))
                        //           )
                        //         ]
                        //     );
                        //   },
                        // );
                      }
                      else if (snapshot.hasError){
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },

                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text((podcastDataModelList[_currentSongIndex].title).toString()),
                      Text((podcastDataModelList[_currentSongIndex].author).toString())
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        StreamBuilder<Duration>(
                          stream: _audioPlayer.positionStream,
                          builder: (context, snapshot) {
                            final position = snapshot.data ?? Duration.zero;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Slider(
                                  value: position.inSeconds.toDouble(),
                                  min: 0.0,
                                  max: _audioPlayer.duration?.inSeconds.toDouble() ?? 0.0,
                                  onChanged: (value) {
                                    _audioPlayer.seek(Duration(seconds: value.toInt()));
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 2, 15, 8),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${_formatDuration(position)}'),
                                      Text(' ${_formatDuration(_audioPlayer.duration ?? Duration.zero)}'),
                                    ],
                                  ),
                                ),
                              ],
                            );

                          },
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.skip_previous,size: 40,),
                                onPressed: () {
                                  _skipToPrevious();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.replay_10, size: 40,),
                                onPressed: () {
                                  _skip(Duration(seconds: -10));
                                },
                              ),
                              IconButton(
                                icon:
                                Icon(_audioPlayer.playing ? Icons.pause_outlined: Icons.play_arrow, size: 40),
                                onPressed: () {
                                  _togglePlayback();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.forward_10,size: 40),
                                onPressed: () {
                                  _skip(Duration(seconds: 10));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.skip_next,size: 40,),
                                onPressed: () {
                                  _skipToNext();
                                },
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _shuffleQueue();
                          },
                          child: Icon(Icons.shuffle, size: 30, color: textColor
                          )
                      ),

                      GestureDetector(
                        onTap: () {
                          _showQueue();
                        },
                        child: Icon(Icons.queue_music, size: 30, color: textColor),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  ///For play and pause
  Future<void> _togglePlayback() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    setState(() {});
  }
  ///For skip
  Future<void> _skip(Duration duration) async {
    await _audioPlayer.seek(_audioPlayer.position + duration);
  }

  ///Skip one song forward
  void _skipToNext() {
    if (_currentSongIndex < podcastDataModelList.length - 1) {
      _currentSongIndex++;
      _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
      _audioPlayer.play();
      setState(() {});
    }
  }

  void _skipToPrevious() {
    if (_currentSongIndex > 0) {
      _currentSongIndex--;
      _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
      _audioPlayer.play();
      setState(() {});
    }
  }

  void _showQueue() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: podcastDataModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text((podcastDataModelList[index].title).toString(),style: placeholderText,),
                      subtitle: Text((podcastDataModelList[index].author).toString(),style: placeholderText),
                      onTap: () {
                        // Play the selected audio from the queue
                        _playFromQueue(index);
                        Navigator.pop(context); // Close the queue modal
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // Play audio from the queue
  void _playFromQueue(int index) {
    _currentSongIndex = index;
    _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
    _audioPlayer.play();
    setState(() {});
  }

  void _shuffleQueue() {
    setState(() {
      _currentSongIndex = 0;
      podcastDataModelList.shuffle();
      _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
      _audioPlayer.play();
    });
  }


}