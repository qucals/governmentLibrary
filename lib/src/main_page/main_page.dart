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
import 'package:group_button/group_button.dart';

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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Привет, Кирилл',
                      style:
                          widget.themeNotifier.getTheme().textTheme.headline5,
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
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: LibraryTextField(
                  controller: _search,
                  hintText: 'название книги, автор или жанр',
                  onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  labelStyle:
                      widget.themeNotifier.getTheme().textTheme.overline!,
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
                child: Text(
                  'Популярные жанры',
                  style: widget.themeNotifier.getTheme().textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
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
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Жанр "$selectedGenre"',
                  style: widget.themeNotifier.getTheme().textTheme.headline6,
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: index == 0 ? null : const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              height: 190,
                              image: AssetImage('assets/images/main_page/book_image.jpg')
                            )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Кот в шляпе',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Доктор Сьюз',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Сейчас в тренде',
                  style: widget.themeNotifier.getTheme().textTheme.headline6,
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: index == 0 ? null : const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              height: 190,
                              image: AssetImage('assets/images/main_page/book_image.jpg')
                            )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Кот в шляпе',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Доктор Сьюз',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
