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
import 'package:flutter_svg/svg.dart';
import 'package:government_library/src/components/press_button.dart';
import 'package:government_library/src/components/text_button.dart';
import 'package:government_library/src/components/text_field.dart';
import 'package:government_library/src/theming/theme_manager.dart';
import 'package:loggy/loggy.dart';

// ignore: must_be_immutable
class LibrarySignInPage extends StatefulWidget {
  ThemeNotifier themeNotifier;

  LibrarySignInPage({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  State<LibrarySignInPage> createState() => _LibrarySignInPageState();
}

class _LibrarySignInPageState extends State<LibrarySignInPage> with UiLoggy {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    loggy.debug('Screen: width=$screenWidth, height=$screenHeight');

    final FocusNode focus = FocusNode();

    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(width: screenWidth, height: screenHeight * 0.05),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: screenHeight * 0.03),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/images/icons/ic_back.svg',
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                horizontal: 30, vertical: screenWidth * 0.03),
            child: Text(
              'Вход',
              style: widget.themeNotifier.getTheme().textTheme.headline2,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: 32, right: 32, bottom: screenHeight * 0.03),
            child: Text(
              'Введите ваши данные для погружения в книжных космос',
              style: widget.themeNotifier.getTheme().textTheme.subtitle1,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(
                32, screenHeight * 0.01, 32, screenHeight * 0.02),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                  child: Text(
                    'Логин',
                    style: widget.themeNotifier.getTheme().textTheme.headline6,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: LibraryTextField(
                    hintText: 'Введите логин',
                    autofocus: true,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                    labelStyle:
                        widget.themeNotifier.getTheme().textTheme.overline!,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: 32, right: 32, bottom: screenHeight * 0.03),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
                  child: Text(
                    'Пароль',
                    style: widget.themeNotifier.getTheme().textTheme.headline6,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: LibraryTextField(
                    hintText: 'Введите пароль',
                    focusNode: focus,
                    onSubmitted: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    labelStyle:
                        widget.themeNotifier.getTheme().textTheme.overline!,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 10),
            child: LibraryPressButton(
              width: screenWidth,
              height: 60,
              textButton: 'Войти',
              icon: SvgPicture.asset(
                'assets/images/icons/ic_next.svg',
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(32, 10, 32, screenHeight * 0.01),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => LibrarySignInPage(
                    //               themeNotifier: widget.themeNotifier,
                    //             )));
                  },
                  child: Text(
                    'Забыли данные для входа?',
                    style: TextStyle(
                      fontFamily: 'LGothamPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:
                          widget.themeNotifier.getTheme().colorScheme.secondary,
                      decoration: TextDecoration.underline,
                    ),
                  ))),
          const Spacer(
            flex: 1,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'или войдите с помощью',
                    style: widget.themeNotifier.getTheme().textTheme.overline,
                  ),
                ),
                Row(
                  children: <Widget>[
                    LibraryTextButton(
                      onPressed: () {},
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/images/icons/vk_icon.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const Spacer(flex: 1),
                    LibraryTextButton(
                      onPressed: () {},
                      width: 135,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/images/icons/gosuslugi_icon.svg',
                        width: 100,
                        height: 15,
                      ),
                    ),
                    const Spacer(flex: 1),
                    LibraryTextButton(
                      onPressed: () {},
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        'assets/images/icons/google_icon.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    ));
  }
}
