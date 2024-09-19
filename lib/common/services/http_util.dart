import 'package:dio/dio.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    print('printing http instance');
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('app request data ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('app response data ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('app error data $e');
          ErrorEntity eInfo = createErrorEntity(e);
        },
      ),
    );
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  Future post(
    String path, {
    // 실제로 데이터는 우리가 백엔드에 전달하려는 데이터입니다.
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    print('hit post method');
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    print('done with header');
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print('done with post ${response.data["message"]}');
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = '';

  ErrorEntity({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    if (message == '') return 'Exception';

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'Connection timed out');

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'Send timed out');

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'Receive timed out');

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'Bad SSL certificates');

    case DioExceptionType.badResponse:
      print('bad response........');
      return ErrorEntity(code: -1, message: 'Server bad response');

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: 'Server canceled it');

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'Connection error');

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'Unknown error');
  }
}
