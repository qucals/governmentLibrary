import 'package:flutter/material.dart';

import 'package:government_library/components/library_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
            child: LibraryTextField(
              backgroundColor: Colors.grey[200],
              borderRadius: 10,
              hintText: 'Логин',
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 12, bottom: 16),
            child: LibraryTextField(
              backgroundColor: Colors.grey[200],
              borderRadius: 10,
              hintText: 'Пароль',
            ),
          ),
        ],
      ),
    );
  }
}
