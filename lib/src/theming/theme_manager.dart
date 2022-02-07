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

import '../services/storage_manager.dart';

/// Класс, реализующий логику смены темы для приложения
class ThemeNotifier with ChangeNotifier, UiLoggy {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: const Color(0xFFE5E5E5),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.black),
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    backgroundColor: const Color(0xFF212121),
  );

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    _themeData = lightTheme;

    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';

      if (themeMode == 'light') {
        _themeData = lightTheme;
        loggy.debug('Установлена светлая тема приложения');
      } else {
        _themeData = darkTheme;
        loggy.debug('Установлена темная тема приложения');
      }

      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
