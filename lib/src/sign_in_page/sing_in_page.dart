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
import 'package:government_library/src/theming/theme_manager.dart';

// ignore: must_be_immutable
class SignInPage extends StatefulWidget {
  ThemeNotifier themeNotifier;

  SignInPage({
    Key? key,
    required this.themeNotifier,
  }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  onTap: () { Navigator.pop(context); },
                  child: SvgPicture.asset('assets/images/icons/ic_back.svg',
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(30),
              child: Text(
                'Вход',
                style: widget.themeNotifier.getTheme().textTheme.headline2,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: Text(
                'Введите ваши данные данные для погружения в книжных космос',
                style: widget.themeNotifier.getTheme().textTheme.subtitle1,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Text(
                      'Логин',
                      style: widget.themeNotifier.getTheme().textTheme.headline6,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
