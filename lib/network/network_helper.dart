import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app_config/app_config.dart';
import 'package:flutter_base/core/app_core.dart';
import 'package:flutter_base/core/app_notification.dart';
import 'package:flutter_base/helpers/shared_helper.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import '../helpers/translation/all_translation.dart';
import 'mapper.dart';

class NetworkHelper {
  static NetworkHelper? _instance;
  static Dio? _dio;

  NetworkHelper._internal();

  factory NetworkHelper(
      {String? urlCode, String? schema, bool change = false}) {
    if (_instance == null) {
      // NetworkHelper.generateBaseUrl(urlCode: urlCode, schema: schema);
      _instance = NetworkHelper._internal();
      _dio = Dio();
      _dio!.options.baseUrl = AppConfig.BASE_URL;
    }
    return _instance!;
  }

  Future<dynamic> get(
      {@required String? url,
      Mapper? model,
      Map<String, dynamic>? query,
      var headers}) async {
    Response? _res;
    if (headers != null) {
      _dio!.options.headers = headers;
    } else {
      String _token = await SharedHelper.sharedHelper!.readString(CachingKey.TOKEN);
      String lang = await allTranslations.getPreferredLanguage();
      _dio!.options.headers = {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/json',
        'Accept-Language': lang == 'en' ? "US" : "AR"
      };
    }
    log('==: End point => ${_dio!.options.baseUrl}$url');
    if (query != null) {
      log(query.toString());
    }
    try {
      _res = await _dio!.get(url!, queryParameters: query);
      log('==: End point =>  ${_dio!.options.baseUrl}$url');
      log('Response >>> ${_res.toString()}');
    } on DioError catch (e) {
      _res = e.response;
      log('Exception >>>  ${e.response.toString()}');
      if (_res == null)
        return Response(
            data: {"status": 0, "message": "NO INTERNET CONNECTION"},
            requestOptions: RequestOptions(path: ''));
    }

    if (model == null) {
      return _res;
    }else {
      return Mapper(model, _res.data);
    }
  }

  Future<dynamic> post(
      {@required String? url,
      var body,
      Mapper? model,
      var headers,
      bool withToken = true}) async {
    Response? _res;
    try {
      if (headers != null) {
        _dio!.options.headers = headers;
      } else {
        if (withToken) {
          String _token =
              await SharedHelper.sharedHelper!.readString(CachingKey.TOKEN);
          String lang = await allTranslations.getPreferredLanguage();
          log('Token is >>> $_token');
          _dio!.options.headers = {
            'Authorization': 'Bearer $_token',
            'Accept': 'application/json',
            'Accept-Language': lang == 'en' ? "US" : "AR"
          };
        }
      }
      if (body != null) {
        _res = await _dio!.post(url!, data: body);
      } else {
        _res = await _dio!.post(url!);
      }

      log('==: Body => $body');
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Response >>> ${_res}');
    } on DioError catch (e) {
      _res = e.response;
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Exception >>>  ${e.response.toString()}');
      log('e >>>  ${e.message}');
      if (e.message.contains('Network is unreachable')) {
        return AppCore.showSnackBar(notification: AppNotification(message: 'Network is unreachable',backgroundColor: Styles.IN_ACTIVE,borderColor: Styles.DARK_RED,iconName: "fill-close-circle"));
      }

      if (_res == null)
        return Response(
            data: {"status": 0, "message": "NO INTERNET CONNECTION"},
            requestOptions: RequestOptions(path: ''));
      else if (model == null)
        return _res;
      else
        return Mapper(model, _res.data);
    }

    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }

  Future<dynamic> download(
      {@required String? url,
        var body,
        Mapper? model,
        var headers,
        bool withToken = true}) async {
    Response<ResponseBody>? _res;
    try {
      if (headers != null) {
        _dio!.options.headers = headers;
      } else {
        if (withToken) {
          String _token =
          await SharedHelper.sharedHelper!.readString(CachingKey.TOKEN);
          String lang = await allTranslations.getPreferredLanguage();
          log('Token is >>> $_token');
          _dio!.options.headers = {
            'Authorization': 'Bearer $_token',
            'Accept': 'application/json',
            'Content-Type' : 'application/pdf',
            'Accept-Language': lang == 'en' ? "US" : "AR"
          };
        }
      }
      if (body != null) {
        _res = await _dio!.post(url!, data: body ,
          onReceiveProgress : showDownloadProgress , options: Options(
            responseType: ResponseType.stream,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),);
      } else {
        _res = await _dio!.post(url!);
      }

      log('==: Body => $body');
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Response >>> ${await _res.data!.stream}');
    } on DioError catch (e) {
      _res = e.response as Response<ResponseBody>;
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Exception >>>  ${e.response.toString()}');
      log('e >>>  ${e.message}');
      if (e.message.contains('Network is unreachable')) {
        return AppCore.showSnackBar(notification: AppNotification(message:'Network is unreachable'));
      }
    }
    return _res ;
  }
  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }
  Future<dynamic> put(
      {@required String? url,
      var body,
      Mapper? model,
      var headers,
      bool withToken = true}) async {
    Response? _res;
    try {
      if (headers != null) {
        _dio!.options.headers = headers;
        
      } else {
        if (withToken) {
          String _token =
              await SharedHelper.sharedHelper!.readString(CachingKey.TOKEN);
          String lang = await allTranslations.getPreferredLanguage();
          log('Token is >>> $_token');
          _dio!.options.headers = {
            'Authorization': 'Bearer $_token',
            'Accept': 'application/json',
            'Content-Type' : 'application/pdf',
            'Accept-Language': lang == 'en' ? "US" : "AR"
          };
        }
      }
    
      if (body != null) {
        _res = await _dio!.put(url!, data: body);
      } else {
        _res = await _dio!.put(url!);
      }

      log('==: Body => $body');
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Response >>> ${_res}');
    } on DioError catch (e) {
      _res = e.response;
      log('==: End point => ${_dio!.options.baseUrl}$url');
      log('Exception >>>  ${e.response.toString()}');
      log('e >>>  ${e.message}');
      if (e.message.contains('Network is unreachable')) {
        return AppCore.showSnackBar(notification: AppNotification(message: 'Network is unreachable',backgroundColor: Styles.IN_ACTIVE,borderColor: Styles.DARK_RED,iconName: "fill-close-circle"));
      }

      if (_res == null)
        return Response(
            data: {"status": 0, "message": "NO INTERNET CONNECTION"},
            requestOptions: RequestOptions(path: ''));
      else if (model == null)
        return _res;
      else
        return Mapper(model, _res.data);
    }

    if (model == null) {
      return _res;
    } else {
      return Mapper(model, _res.data);
    }
  }
}

enum BaseUrl { A1, D1 }
