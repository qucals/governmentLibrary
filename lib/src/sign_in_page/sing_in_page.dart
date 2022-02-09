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

class _LibrarySignInPageState extends State<LibrarySignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          const SizedBox(width: 300, height: 50),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(30),
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
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Text(
              'Вход',
              style: widget.themeNotifier.getTheme().textTheme.headline2,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(35, 0, 30, 35),
            child: Text(
              'Введите ваши данные для погружения в книжных космос',
              style: widget.themeNotifier.getTheme().textTheme.subtitle1,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 20),
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
                    labelStyle:
                        widget.themeNotifier.getTheme().textTheme.overline!,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
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
                    labelStyle:
                        widget.themeNotifier.getTheme().textTheme.overline!,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: LibraryPressButton(
              width: 350,
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
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
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
                  color: widget.themeNotifier.getTheme().colorScheme.secondary,
                  decoration: TextDecoration.underline,
                ),
              )
            )
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 30),
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
          )
        ],
      ),
    ));
  }
}
