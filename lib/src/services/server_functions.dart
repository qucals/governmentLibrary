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

import 'dart:convert';
import 'dart:io';

import 'package:government_library/constants.dart';

// Функция запроса на авторизацию
Future<String> authorizationRequest(Map jsonMap) async {
  HttpClient httpClient = HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(authUri));

  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(jsonMap)));

  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();

  httpClient.close();

  return reply;
}
