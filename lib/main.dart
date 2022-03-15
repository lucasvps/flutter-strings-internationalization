import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_strings_internationalization/utils/language_helper.dart';

import 'configs/i18n/resources.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static String platformLocale = Platform.localeName;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentLanguageFlag = "";

  @override
  void didChangeDependencies() async {
    var result = await LanguageHelper.isLanguageSet();

    if (!result) {
      R.load(Locale(MyApp.platformLocale));
      LanguageHelper.saveCurrentLanguage(MyApp.platformLocale);
      LanguageHelper.saveCurrentLanguageFlag(
        R.languageFlag(
          Locale(
            MyApp.platformLocale,
          ),
        ),
      );

      currentLanguageFlag = R.languageFlag(
        Locale(
          MyApp.platformLocale,
        ),
      );
    } else {
      var currentLanguage = await LanguageHelper.getCurrentLanguage();
      currentLanguageFlag = await LanguageHelper.getCurrentLanguageFlag();
      R.load(Locale(currentLanguage));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> imagesList = [
    {"image": "assets/images/brasil.png", "locale": "pt_BR"},
    {"image": "assets/images/espanha.png", "locale": "es_ES"},
    {"image": "assets/images/eua.png", "locale": "en_US"},
  ];

  var currentLanguageFlag = "";

  @override
  void didChangeDependencies() async {
    var result = await LanguageHelper.isLanguageSet();

    if (!result) {
      LanguageHelper.saveCurrentLanguageFlag(
        R.languageFlag(
          Locale(
            MyApp.platformLocale,
          ),
        ),
      );

      currentLanguageFlag = R.languageFlag(
        Locale(
          MyApp.platformLocale,
        ),
      );
    } else {
      currentLanguageFlag = await LanguageHelper.getCurrentLanguageFlag();
    }

    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text(
          R.value.appBarTitle,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      R.value.currentLanguageText,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Visibility(
                      visible: currentLanguageFlag.isNotEmpty,
                      child: Image.asset(
                        currentLanguageFlag,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  R.value.clickDesiredLanguage,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          R.load(Locale(imagesList[index]['locale']));
                          currentLanguageFlag = R.languageFlag(
                            Locale(imagesList[index]['locale']),
                          );
                          LanguageHelper.saveCurrentLanguage(
                              imagesList[index]['locale']);

                          LanguageHelper.saveCurrentLanguageFlag(
                              imagesList[index]['image']);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          imagesList[index]['image'],
                          width: 150,
                          height: 180,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
                child: Text(
                  R.value.myFirsText,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
                child: Text(
                  R.value.mySecondText,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 24),
                child: Text(
                  R.value.myThirdText,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
