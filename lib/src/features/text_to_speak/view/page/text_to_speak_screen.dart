import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/src/core/enums/app_enums.dart';
import 'package:news_app_dummy_api/src/core/helpers/helper.dart';
import 'package:news_app_dummy_api/src/core/helpers/message_model.dart';
import 'package:news_app_dummy_api/src/core/service/local_storage_service.dart';
import 'package:news_app_dummy_api/src/core/utils/assets_path.dart';
import 'package:news_app_dummy_api/src/features/dashboard/view/pages/dashboard.dart';

class TextToSpeakScreen extends StatefulWidget {
  const TextToSpeakScreen({super.key});

  @override
  State<TextToSpeakScreen> createState() => _TextToSpeakScreenState();
}

class _TextToSpeakScreenState extends State<TextToSpeakScreen> {
  TextEditingController speakController=TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  bool isPlay = false;
  double volume=1.0;
  double pitch=1.0;
  double speechRate=0.5;
  List<String>? languages;
  String langCode="en-US";
  String? speechText;


  @override
  void initState() {
  _init();
  _setUpCompletionHandler();
  _getTextFromLocal();
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



  void _saveText() async {
    if(speakController.text.isEmpty){
      errorMessage("Please write something in the field!");

    }else{
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
      await Future.delayed(const Duration(seconds: 2));
      LocalStorageService.saveData(key: LocalStorageKey.speechText,value: speakController.text);
      Get.back();

      Get.to(const Dashboard());
    }

  }


  void _getTextFromLocal()async{
   speechText= await LocalStorageService.getData(key: LocalStorageKey.speechText);
  }


  String textToSpeak="খাদিজা আক্তার  শিয়া  একটা গুরু, ছাগল , হাঁস , মুরগি , গাদা , আবুল , "
      "বলদ ,পাগলি , শিয়াল ,কুত্তা , বানর , কলা গাছ , বেড়া।  খাদিজা আক্তার "
      " শিয়ার আরেক নাম  নদী বেগম।  নদী  বেগম শুদু গুমায়।  কেউ তাকে পড়তে বললে সে তার কাছে "
      " খারাপ হয়ে যায়।  নদী বেগম মোবাইল পাইলে সারাদিন মোবাইল টিপে। ";
  String rrkText="রিয়াজুর রহমান কাওছার একটা ভালো ছেলে ";
  String otherText="সে অনেক ভালো";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const CircleAvatar(
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,size: 25,
                          ),
                        ),
                      ),
                    ),
                     Row(
                      children: [
                        InkWell(
                          onTap:()=> LocalStorageService.removeData(key: LocalStorageKey.speechText),
                          child: const CircleAvatar(
                            child: Center(
                              child: Icon(
                                Icons.clear,size: 25,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap:  _saveText,
                          child: const CircleAvatar(
                            child: Center(
                              child: Icon(
                                Icons.save,size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: speakController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Write Something...........",
                    border: const OutlineInputBorder(
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary
                      )
                    ),
                  ),
                ),
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
                                pause();
                              },
                              icon: const Icon(
                                Icons.stop,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                if(speakController.text=="who is khadija?"){
                                  speak(textToSpeak);
                                }else if(speakController.text=="who is kawchar?"){
                                  speak(rrkText);
                                }else{
                                  speak(otherText);
                                }

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
      ),
    );
  }
}
