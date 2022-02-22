import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String _text01 = "おめでとうございます";
  // String _text02 = "合格です";
  // String _text03 = "よくできました";
  // String _text04 = "残念でした";
  // String _text05 = "不合格です";
  // String _text06 = "頑張りましょう";

  AudioPlayer _audioPlayer = AudioPlayer();

  List<String> _text = [
    "おめでとうございます",
    "合格です",
    "よくできました",
    "残念でした",
    "不合格です",
    "頑張りましょう"
  ];

  List<String> _soundPaths = [
    "assets/sounds/sound1.mp3",
    "assets/sounds/sound2.mp3",
    "assets/sounds/sound3.mp3",
    "assets/sounds/sound4.mp3",
    "assets/sounds/sound5.mp3",
    "assets/sounds/sound6.mp3",
  ];

  List<AudioPlayer> _audioPlayers = [
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
    AudioPlayer(),
  ];

  @override
  void initState() {
    super.initState();
    _initSounds();
  }

  void _initSounds() async {
    await _audioPlayers[0].setAsset(_soundPaths[0]);
    await _audioPlayers[1].setAsset(_soundPaths[1]);
    await _audioPlayers[2].setAsset(_soundPaths[2]);
    await _audioPlayers[3].setAsset(_soundPaths[3]);
    await _audioPlayers[4].setAsset(_soundPaths[4]);
    await _audioPlayers[5].setAsset(_soundPaths[5]);
  }

  @override
  void dispose() {
    _audioPlayers[0].dispose();
    _audioPlayers[1].dispose();
    _audioPlayers[2].dispose();
    _audioPlayers[3].dispose();
    _audioPlayers[4].dispose();
    _audioPlayers[5].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ツッコミマシーン"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(0),
                  ),
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(1),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(2),
                  ),
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(3),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(4),
                  ),
                  Expanded(
                    flex: 1,
                    child: Widget_soundButton(5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget_soundButton(int index) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.brown,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        onPressed: () => _playSound(index),
        child: Text(_text[index]),
      ),
    );
  }

  _playSound(int index) async {
    await _audioPlayers[index].seek(Duration.zero);
    _audioPlayers[index].play();
  }
}
