import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcastapp/ApiModel/AudioByIdModel.dart';
import '../ApiModel/AudioGetModel.dart';

import 'package:http/http.dart' as http;
import '/colors.dart';


class PodcastPlayer extends StatefulWidget {
  final String songId;
  const PodcastPlayer({super.key, required this.songId});

  @override
  State<PodcastPlayer> createState() => _PlaySongState();
}

class _PlaySongState extends State<PodcastPlayer> {

  Future<List<AudioGet>> AudioGetById() async{
    var audioIdResponse = await http.get(Uri.parse("http://localhost:4000/api/audiouploadgetbyid/658283521076790ac70cc404"));
    print(audioIdResponse.body);
    var audioID =  (jsonDecode(audioIdResponse.body));
    return (audioID as List).map((e) => AudioGet.fromJson(e)).toList();


  }
  late AudioPlayer _audioPlayer;
  double _sliderValue = 0.0;
  double _playbackSpeed = 1.0; // Initial playback speed

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initPlayer();
    AudioGetId();
  }
  Future<void> _initPlayer() async {
    try {
      List<AudioGet> audioList = await AudioGetById();

      if (audioList.isNotEmpty) {
        AudioGet audioGet = audioList.first;
        print("AudioGet retrieved: $audioGet");

        print("hi");
        await _audioPlayer.setUrl("http://localhost:4000/api${audioGet.audio_upload}");

        // Listen for player state changes
        _audioPlayer.playerStateStream.listen((playerState) {
          print("Player state changed: $playerState");
          final position = _audioPlayer.position;
          setState(() {
            // Update the slider value when the position is available
            _sliderValue = position.inSeconds.toDouble();
          });
        });

        // Listen for position changes
        _audioPlayer.positionStream.listen((position) {
          print("Position changed: $position");
          setState(() {
            _sliderValue = position.inSeconds.toDouble();
          });
        });
      } else {
        print("Error: Audio list is empty");
      }
    } catch (e) {
      print("Error initializing player: $e");
    }
  }




  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2,'0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2,'0');
    return '$minutes:$seconds';
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
              child: FutureBuilder(
                future: AudioGetById(),
                builder: (BuildContext context,  snapshot) {
                  if(snapshot.hasData){
                    return Container(
                      height: MediaQuery.of(context).size.height*1,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {

                          return Column(
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
                                                                    image: NetworkImage(('http://localhost:4000/api${snapshot.data![index].banner}').toString()),
                                                                  )
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text((snapshot.data![index].audioTitle).toString()),
                                                                Text((snapshot.data![index].authorName).toString())
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
                              Container(
                                height: MediaQuery.of(context).size.height*0.65,
                                width: MediaQuery.of(context).size.width*0.9,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(('http://localhost:4000/api${snapshot.data![index].banner}').toString()),
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text((snapshot.data![index].audioTitle).toString()),
                                  Text((snapshot.data![index].authorName).toString())
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
                                              // _skipToPrevious();
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
                                              // _skipToNext();
                                            },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          );
                        },
                      ),
                    );
                  }
                else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                  }
                return CircularProgressIndicator();
                },

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
  // void _skipToNext() {
  //   if (_currentSongIndex < podcastDataModelList.length - 1) {
  //     _currentSongIndex++;
  //     _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
  //     _audioPlayer.play();
  //     setState(() {});
  //   }
  // }
  //
  // void _skipToPrevious() {
  //   if (_currentSongIndex > 0) {
  //     _currentSongIndex--;
  //     _audioPlayer.setUrl(podcastDataModelList[_currentSongIndex].song!);
  //     _audioPlayer.play();
  //     setState(() {});
  //   }
  // }




}