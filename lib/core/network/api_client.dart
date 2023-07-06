import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../utils/configs/session_manager.dart';
import 'logger.dart';

final dioOptions = BaseOptions(
  baseUrl: "${dotenv.env['API_ENDPOINT']}",
  headers: {
    'Content-Type': 'application/json; multipart/form-data',
  },
  connectTimeout: const Duration(minutes: 1),
);


class ApiClient {
  final int maxRetry = 5;
  final SessionManager sessionManager;
  final Dio client = Dio(dioOptions);


  ApiClient({required this.sessionManager, bool enableLogger = false}) {
    if (enableLogger) {
      client.interceptors.add(logger);
    }
    // client.interceptors.add(
    //     InterceptorsWrapper(
    //         onRequest: (request, handler) async {
    //           if (enableLogger) {
    //             debugPrint('[ON REQUEST]============================> request account data => ${request.path}');
    //           }
    //           // String token = sessionManager.getAccessToken();
    //           // request.headers['Authorization'] = 'Bearer $token';
    //           return handler.next(request);
    //         },
    //         onError: (error, handler) async {
    //           if (error.response?.statusCode == 401) {
    //             if (enableLogger) {
    //               debugPrint('==========================================> token expired');
    //             }
    //
    //             if (maxRetry == 0) {
    //               handler.next(error);
    //               return;
    //             }
    //
    //             maxRetry -= 1;
    //             String refreshToken = sessionManager.getRefreshToken();
    //             try {
    //               if(enableLogger) {
    //                 debugPrint('==========================================> req new token');
    //               }
    //               client.options.headers["Refresh-Token"] = refreshToken;
    //               Response newToken = await client.post('accounts/tokens');
    //
    //               String newAccessToken = newToken.headers['access-token']![0];
    //               String newRefreshToken = newToken.headers['refresh-token']![0];
    //               sessionManager.setToken(newAccessToken, newRefreshToken);
    //
    //               resetInstance();
    //
    //               error.requestOptions.headers["Authorization"] = 'Bearer $newAccessToken';
    //               final opts = Options(
    //                   method: error.requestOptions.method,
    //                   headers: error.requestOptions.headers
    //               );
    //               final cloneReq = await client.request(
    //                   error.requestOptions.path,
    //                   options: opts,
    //                   data: error.requestOptions.data,
    //                   queryParameters: error.requestOptions.queryParameters
    //               );
    //               return handler.resolve(cloneReq);
    //             } on DioError catch (_) {
    //               resetInstance();
    //               handler.next(error);
    //             }
    //           }
    //           resetInstance();
    //           handler.next(error);
    //         }
    //     )
    // );
  }

  String parseError(DioException e) {
    if (e.response != null) {
      var message = e.response!.data['message'];
      if (kDebugMode) {
        return "[${e.message} - ${e.type}] - $message";
      } else {
        return message;
      }
    }
    if (kDebugMode) {
      return "${e.message} - ${e.type}";
    }
    return "Something wrong, please try again! - ${e.type}";
  }
}

