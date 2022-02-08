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
import 'package:government_library/src/sign_in_page/sing_in_page.dart';
import 'package:government_library/src/sign_up_page/sign_up_page.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter_svg/svg.dart';

import 'package:government_library/src/components/press_button.dart';
import 'package:government_library/src/theming/theme_manager.dart';

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
    const _backgroundAssetPreName = 'assets/images/welcome_page/';
    String _themeMode = widget.themeNotifier.getThemeMode();
    String backgroundAssetName = _backgroundAssetPreName +
        (_themeMode == 'light' ? 'header_light.svg' : 'header_dark.svg');

    return Scaffold(
        body: Stack(
      children: <Widget>[
        SvgPicture.asset(
          backgroundAssetName,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(35, 10, 30, 70),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInPage(themeNotifier: widget.themeNotifier,)));
                },
                child: const Text(
                  'Уже есть аккаунт',
                  style: TextStyle(
                    fontFamily: 'LGothamPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 30, 30, 10),
              child: LibraryPressButton(
                width: 350,
                height: 53,
                textButton: 'Присоединиться к Библ',
                icon: SvgPicture.asset(
                  'assets/images/icons/ic_next.svg',
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SignUpPage()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInPage(themeNotifier: widget.themeNotifier,)));
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                //  padding: const EdgeInsets.all(30),
                padding: const EdgeInsets.fromLTRB(35, 20, 30, 0),
                child: Text(
                  'Читайте интересное, \nузнавайте о новых мероприятиях, \nделитесь эмоциями и впечатлениями!',
                  style: widget.themeNotifier.getTheme().textTheme.button,
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(35, 20, 30, 0),
                child: Text(
                  'Современное решение \nдля любителей почитать!',
                  style: widget.themeNotifier.getTheme().textTheme.button,
                )),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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
