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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:shimmer/shimmer.dart';

import 'package:government_library/src/components/bottom_bar.dart';
import 'package:government_library/src/components/text_button.dart';
import 'package:government_library/src/components/text_field.dart';
import 'package:government_library/src/theming/theme_manager.dart';

class LibraryMainPage extends StatefulWidget {
  final ThemeNotifier themeNotifier;

  const LibraryMainPage({required this.themeNotifier, Key? key})
      : super(key: key);

  @override
  State<LibraryMainPage> createState() => _LibraryMainPageState();
}

class _LibraryMainPageState extends State<LibraryMainPage> {
  int _currentPageIndex = 0;
  bool isLoading = true;

  final TextEditingController _search = TextEditingController();
  final GroupButtonController _genres = GroupButtonController(selectedIndex: 0);

  List<String> genres = [
    'Все',
    'Роман',
    'Саморазвитие',
    'Фантастика',
    'Детектив'
  ];
  late String selectedGenre;

  @override
  Widget build(BuildContext context) {
    selectedGenre = genres[_genres.selectedIndex!];

    return Scaffold(
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return LibraryAnimatedBottomBar(
      containerHeight: 70,
      containerCornerRadius: 20,
      // backgroundColor: widget.themeNotifier.getTheme().primaryColor,
      selectedIndex: _currentPageIndex,
      showElevation: true,
      itemCornerRadius: 20,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentPageIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          activeIcon: SvgPicture.asset(
            'assets/images/icons/search_icon.svg',
            color: Colors.black,
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/images/icons/search_icon.svg',
            color: Colors.white,
          ),
          title: Text('Главная'),
          activeBackgroundColor: Colors.white,
          inactiveBackgroundColor: Colors.black,
          textAlign: TextAlign.center,
          activeWidth: 110,
        ),
        BottomNavyBarItem(
          activeIcon: SvgPicture.asset(
            'assets/images/icons/library_icon.svg',
            color: Colors.black,
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/images/icons/library_icon.svg',
            color: Colors.white,
          ),
          title: Text('Библиотека'),
          activeBackgroundColor: Colors.white,
          inactiveBackgroundColor: Colors.black,
          textAlign: TextAlign.center,
          activeWidth: 135,
        ),
        BottomNavyBarItem(
          activeIcon: SvgPicture.asset(
            'assets/images/icons/user_icon.svg',
            color: Colors.black,
          ),
          inactiveIcon: SvgPicture.asset(
            'assets/images/icons/user_icon.svg',
            color: Colors.white,
          ),
          title: Text('Пользователь'),
          activeBackgroundColor: Colors.white,
          inactiveBackgroundColor: Colors.black,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      _getMainPage(),
      _getMainPage(),
      _getMainPage(),
    ];

    return IndexedStack(
      index: _currentPageIndex,
      children: pages,
    );
  }

  Widget _getMainPage() {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Text(
                    'Привет, Кирилл',
                    style: widget.themeNotifier.getTheme().textTheme.headline5,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/icons/settings_icon.svg',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: LibraryTextField(
                controller: _search,
                hintText: 'название книги, автор или жанр',
                onSubmitted: (_) => FocusScope.of(context).unfocus(),
                labelStyle: widget.themeNotifier.getTheme().textTheme.overline!,
                prefixIcon: SvgPicture.asset(
                  'assets/images/icons/search_icon.svg',
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Популярные жанры',
                style: widget.themeNotifier.getTheme().textTheme.headline6,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[350]!,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GroupButton(
                  onSelected: (index, isSelected) => setState(() {
                    selectedGenre = genres[index];
                  }),
                  buttons: genres,
                  controller: _genres,
                  options: GroupButtonOptions(
                    spacing: 10,
                    runSpacing: 5,
                    borderRadius: BorderRadius.circular(10),
                    selectedColor:
                        widget.themeNotifier.getTheme().colorScheme.secondary,
                    unselectedColor: const Color(0xFFE5E5EA),
                    mainGroupAlignment: MainGroupAlignment.start,
                    selectedShadow: [],
                    unselectedShadow: [],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Жанр "$selectedGenre"',
                style: widget.themeNotifier.getTheme().textTheme.headline6,
              ),
            ),
            _buildListBooks(isLoading),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Сейчас в тренде',
                style: widget.themeNotifier.getTheme().textTheme.headline6,
              ),
            ),
            _buildListBooks(isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildListBooks(bool isLoading) {
    return Container(
      height: 250,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[350]!,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                                height: 190,
                                image: AssetImage(
                                    'assets/images/main_page/book_image.jpg'))),
                        const SizedBox(
                          height: 10,
                        ),
                        if (!isLoading)
                          const Text(
                            'Кот в шляпе',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 5),
                        if (!isLoading)
                          const Text(
                            'Доктор Сьюз',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    ),
                    if (index == genres.length - 1)
                      const SizedBox(
                        width: 30,
                      ),
                  ],
                ));
          }),
    );
  }
}
