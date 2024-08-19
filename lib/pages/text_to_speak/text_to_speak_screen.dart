import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:news_app_dummy_api/config/assets_path.dart';
import 'package:news_app_dummy_api/config/helper.dart';

class TextToSpeakScreen extends StatefulWidget {
  const TextToSpeakScreen({super.key});

  @override
  State<TextToSpeakScreen> createState() => _TextToSpeakScreenState();
}

class _TextToSpeakScreenState extends State<TextToSpeakScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlay = false;
  double volume=1.0;
  double pitch=1.0;
  double speechRate=0.5;
  List<String>? languages;
  String langCode="en-US";



  @override
  void initState() {
  _init();
  _setUpCompletionHandler();
    super.initState();
  }

  void _init()async{
    languages=List<String>.from(await flutterTts.getLanguages);
    setState(() {});
  }

  void _setUpCompletionHandler() {
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlay = false;
      });
    });
  }


  Future<void> speak(String text) async {
    try {
      setState(() {
        isPlay = true;
      });

      await flutterTts.setVolume(volume);
      await flutterTts.setPitch(pitch);
      await flutterTts.setSpeechRate(speechRate);
      await flutterTts.setLanguage(langCode);
      await flutterTts.speak(text);
    } catch (e) {
      kPrint(e.toString());
    }
  }

  void stop() async {
    await flutterTts.stop();
    setState(() {
      isPlay = false;
    });
  }

  void pause() async {
    await flutterTts.pause();
    setState(() {
      isPlay = false;
    });
  }




  String textToSpeakText =
      "আমার সোনার বাংলা আমি তোমাকে ভালোবাসি";
  String inputText="খাদিজা আক্তার  শিয়া একটা পাগল, গরু ,"
      " ছাগল , বেড়া , কুত্তা , আবুল , শিয়াল , মাথায় সমস্যা , "
      "বেশি কথা বলে , খাদিজা আক্তার  শিয়ার আরেক নাম নদী  বেগম। "
      " কেউ তাকে পড়তে বললে সে তার কাছে খারাপ হয়ে যায়।  নদী বেগম শুদু গুমায়।  ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(textToSpeakText),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey),
                child: Row(
                  children: [
                    isPlay
                        ? IconButton(
                            onPressed: () {
                              stop();
                            },
                            icon: const Icon(
                              Icons.stop,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              speak(inputText);
                            },
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                            ),
                          ),
                    Expanded(
                      child: isPlay
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Image.asset(
                                kAudioPlay,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Image.asset(
                                kAudioStop,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    const Text("Volume"),
                    Expanded(
                      child: Slider(
                        min: 0.0,
                          max: 1.0,
                          value: volume,
                          onChanged: (newValue){
                           setState(() {
                             volume=newValue;
                           });
                          }
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10,right: 5),
                     child: Text(
                       double.parse((volume).toStringAsFixed(2)).toString()
                     ),

                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    const Text("Pitch"),
                    Expanded(
                      child: Slider(
                          min: 0.5,
                          max: 2.0,
                          value: pitch,
                          onChanged: (newValue){
                            setState(() {
                              pitch=newValue;
                            });
                          }
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10,right: 5),
                      child: Text(
                          double.parse((pitch).toStringAsFixed(2)).toString()
                      ),

                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    const Text("Speech Rate"),
                    Expanded(
                      child: Slider(
                          min: 0.5,
                          max: 2.0,
                          value: speechRate,
                          onChanged: (newValue){
                            setState(() {
                              speechRate=newValue;
                            });
                          }
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10,right: 5),
                      child: Text(
                          double.parse((speechRate).toStringAsFixed(2)).toString()
                      ),

                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if(languages!=null)
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: Row(
                    children: [
                      const Text("Language : "),
                      const SizedBox(width: 10),
                      DropdownButton<String>(
                          value: langCode,
                          focusColor: Colors.white,
                          items: languages?.map<DropdownMenuItem<String>>((String?value){
                        return DropdownMenuItem<String>(
                             value: value??'',
                              child: Text(
                                value??'',
                            ),
                        );
                      }).toList()??[],
                          onChanged: (String? value){
                            setState(() {
                              langCode=value??'';
                            });
                          },
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
