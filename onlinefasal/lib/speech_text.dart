import 'package:flutter/material.dart';
import 'package:onlinefasal/farming.dart';
import 'package:onlinefasal/home.dart';
import 'dart:developer';
import 'package:onlinefasal/login.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  //State<SpeechScreen> createState() => _SpeechScreenState();
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        title: const Text('Ask Bhaisaab'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          //onPressed: (){},
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text(_text,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 194, 146, 1), fontSize: 25.0)),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
  // SpeechToText _speechToText = SpeechToText();
  // bool _speechEnabled = false;
  // String _lastWords = '';
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _initSpeech();
  // }
  //
  // /// This has to happen only once per app
  // void _initSpeech() async {
  //   _speechEnabled = await _speechToText.initialize();
  //   setState(() {});
  // }
  //
  // /// Each time to start a speech recognition session
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult);
  //   setState(() {});
  // }
  //
  // /// Manually stop the active speech recognition session
  // /// Note that there are also timeouts that each platform enforces
  // /// and the SpeechToText plugin supports setting timeouts on the
  // /// listen method.
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }
  //
  // /// This is the callback that the SpeechToText plugin calls when
  // /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _lastWords = result.recognizedWords;
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Speech Demo'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Container(
  //             padding: EdgeInsets.all(16),
  //             child: Text(
  //               'Recognized words:',
  //               style: TextStyle(fontSize: 20.0),
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               padding: EdgeInsets.all(16),
  //               child: Text(
  //                 // If listening is active show the recognized words
  //                 _speechToText.isListening
  //                     ? '$_lastWords'
  //                 // If listening isn't active but could be tell the user
  //                 // how to start it, otherwise indicate that speech
  //                 // recognition is not yet ready or not supported on
  //                 // the target device
  //                     : _speechEnabled
  //                     ? 'Tap the microphone to start listening...'
  //                     : 'Speech not available',
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed:
  //       // If not yet listening for speech start, otherwise stop
  //       _speechToText.isNotListening ? _startListening : _stopListening,
  //       tooltip: 'Listen',
  //       child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
  //     ),
  //   );
  // }
}
