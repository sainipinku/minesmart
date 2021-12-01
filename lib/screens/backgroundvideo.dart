import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';



class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        _controller!.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            LoginWidget()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
/*

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller!.value.size.width,
                  height: _controller!.value.size.height,
                  child: VideoPlayer(_controller!),
                ),
              ),
            ),
            LoginWidget()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}*/

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(),
        Container(
          padding: EdgeInsets.all(16),
          width: 300,
          height: 200,
          color: Colors.grey.withAlpha(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}