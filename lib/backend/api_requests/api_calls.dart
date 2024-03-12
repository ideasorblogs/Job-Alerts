import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class JobListsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Job Lists',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/job-listings?per_page=100',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? jobs(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      ) as List?;
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_gmt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? link(dynamic response) => (getJsonField(
        response,
        r'''$[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? content(dynamic response) => (getJsonField(
        response,
        r'''$[:].content.rendered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? meta(dynamic response) => getJsonField(
        response,
        r'''$[:].meta''',
        true,
      ) as List?;
  static List<String>? joblocation(dynamic response) => (getJsonField(
        response,
        r'''$[:].meta._job_location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? application(dynamic response) => (getJsonField(
        response,
        r'''$[:].meta._application''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? companyname(dynamic response) => (getJsonField(
        response,
        r'''$[:].meta._company_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? website(dynamic response) => (getJsonField(
        response,
        r'''$[:].meta._company_website''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class JobdetailsCall {
  static Future<ApiCallResponse> call({
    int? jobid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Jobdetails',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/job-listings/$jobid',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PostcategoryCall {
  static Future<ApiCallResponse> call({
    int? perPage,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Postcategory',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/categories?per_page=100&parent=7',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? link(dynamic response) => (getJsonField(
        response,
        r'''$[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostdetailsCall {
  static Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postdetails',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/posts?categories=$id&per_page=100',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
      );
  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].title.rendered''',
      ));
}

class PostshowdetailsCall {
  static Future<ApiCallResponse> call({
    int? postid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'postshowdetails',
      apiUrl: 'https://jobalert.practicepedia.in/wp-json/wp/v2/posts/$postid',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date_gmt''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content.rendered''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title.rendered''',
      ));
}

class SearchCall {
  static Future<ApiCallResponse> call({
    String? query = '',
    String? subType = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/search?search=$query&subtype=$subType&per_page=100',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchdetailspostsCall {
  static Future<ApiCallResponse> call({
    int? queryid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchdetailsposts',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/posts/$queryid',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchdataCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Searchdata',
      apiUrl: 'https://jobalert.practicepedia.in/wp-json/wp/v2/search/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchdetailsjobsCall {
  static Future<ApiCallResponse> call({
    int? jobid,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchdetailsjobs',
      apiUrl:
          'https://jobalert.practicepedia.in/wp-json/wp/v2/job-listings/$jobid',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
