/*
 Copyright 2022 qucals / https://github.com/qucals

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_svg/svg.dart';

import 'package:government_library/src/components/press_button.dart';
import 'package:government_library/src/theming/theme_manager.dart';
import 'package:government_library/src/sign_in_page/sing_in_page.dart';
import 'package:government_library/src/welcome_page/header_painter.dart';

class LibraryWelcomePage extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  const LibraryWelcomePage({required this.themeNotifier, Key? key})
      : super(key: key);

  @override
  _LibraryWelcomeState createState() => _LibraryWelcomeState();
}

class _LibraryWelcomeState extends State<LibraryWelcomePage> with UiLoggy {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    return Scaffold(
        backgroundColor: widget.themeNotifier.getTheme().colorScheme.secondary,
        body: Stack(
          children: <Widget>[
            CustomPaint(
              painter: LibraryCurveHeaderPainter(
                  themeNotifier: widget.themeNotifier),
              child: Container(),
            ),
            Column(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(32, 10, 32, screenHeight * 0.08),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LibrarySignInPage(
                                    themeNotifier: widget.themeNotifier,
                                  )));
                    },
                    child: const Text(
                      'Уже есть аккаунт',
                      style: TextStyle(
                        fontFamily: 'LGothamPro',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, screenHeight * 0.05, 32, 10),
                  child: LibraryPressButton(
                    width: 350,
                    height: 60,
                    textButton: 'Присоединиться к Библ',
                    textStyle: LibraryPressButton.darkTextStyle,
                    backgroundColor:
                        widget.themeNotifier.getTheme().primaryColor,
                    icon: SvgPicture.asset(
                      'assets/images/icons/ic_next.svg',
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LibrarySignInPage(
                                    themeNotifier: widget.themeNotifier,
                                  )));
                    },
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    //  padding: const EdgeInsets.all(30),
                    padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
                    child: Text(
                      'Читайте интересное, \nузнавайте о новых мероприятиях, \nделитесь эмоциями и впечатлениями!',
                      style: widget.themeNotifier.getTheme().textTheme.button,
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
                    child: Text(
                      'Современное решение \nдля любителей почитать!',
                      style: widget.themeNotifier.getTheme().textTheme.button,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Библ',
                    style: widget.themeNotifier.getTheme().textTheme.headline1,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
