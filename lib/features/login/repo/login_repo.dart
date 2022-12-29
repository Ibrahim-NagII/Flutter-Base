import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_base/app_config/api_names.dart';
import 'package:flutter_base/app_config/app_config.dart';
import 'package:flutter_base/features/login/model/user_model.dart';
import 'package:flutter_base/helpers/text_helper.dart';
import 'package:flutter_base/network/network_helper.dart';

abstract class LoginRepo {
  static Future<dynamic> login({
      @required String? username,
      @required String? password}) async {

    return await NetworkHelper()
        .post(
            withToken: false,
            url: '${ApiNames.LOGIN}?email=$username&password=$password',
            model: UserModel());
  }
}
