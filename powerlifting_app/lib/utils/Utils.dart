import 'package:flutter/material.dart';
import 'package:youtube_data_api/models/video_data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:powerlifting_app/screens/Home Screen/Tutorial Screen/tutorials_screen.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class YoutubeVids {
  String datatemp = "";
  List<String> Squaturls = [];
  List<String> Deadlifturls = [];
  List<String> Benchurls = [];

  List<YoutubePlayerController> squat = [];
  List<String> squatDataTitle = [];
  List<String> squatDataAuthor = [];
  List<YoutubePlayerController> bench = [];
  List<String> benchDataTitle = [];
  List<String> benchDataAuthor = [];
  List<YoutubePlayerController> Deadlift = [];
  List<String> deadliftTitle = [];
  List<String> deadliftAuthor = [];

  late YoutubePlayerController _ytController;

  void populateTitleAuthor() {
    squatDataTitle.add('How to Squat Properly (STEP BY STEP)');
    squatDataAuthor.add('Squat University');
    benchDataTitle.add('How to: Bench Press');
    benchDataAuthor.add('Squat University');
    deadliftTitle.add('How to Deadlift: 3 STEPS!)');
    deadliftAuthor.add('Squat University');
  }

  Future<void> populateData() async {
    Squaturls.add('https://www.youtube.com/shorts/8060FZiT5TA');
    Deadlifturls.add('https://www.youtube.com/shorts/PKsWnUXcYSQ');
    Benchurls.add('https://www.youtube.com/shorts/9SdwTIG6hJY');

    for (int i = 0; i < Squaturls.length; i++) {
      //Inserts Data into squat controllers
      String _id = YoutubePlayer.convertUrlToId(Squaturls[i])!;

      _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
        ),
      );
      squat.add(_ytController);
    }
    //Inserts data into bench controllers
    for (int i = 0; i < Benchurls.length; i++) {
      String _id = YoutubePlayer.convertUrlToId(Benchurls[i])!;

      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
        ),
      );
      bench.add(_ytController);
    }

    //Inserts data into deadlift controllers
    for (int i = 0; i < Deadlifturls.length; i++) {
      String _id = YoutubePlayer.convertUrlToId(Deadlifturls[i])!;
      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
        ),
      );
      Deadlift.add(_ytController);
    }
  }
}
