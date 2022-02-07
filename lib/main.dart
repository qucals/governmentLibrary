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
import 'package:provider/provider.dart';
import 'package:loggy/loggy.dart';

import 'package:government_library/src/theming/theme_manager.dart';
import 'package:government_library/src/welcome_page/welcome_page.dart';

void main(List<String> args) {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(),
  );

  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const LibraryApp(),
    
  ));
}

class LibraryApp extends StatelessWidget with UiLoggy {
  const LibraryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        theme: theme.getTheme(),
        home: LibraryWelcomePage(themeNotifier: theme),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
