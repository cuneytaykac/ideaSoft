import 'interfaces/request_protocol.dart';

abstract class BaseClient implements RequestProtocol {
  @override
  String baseURL = "https://testcase.myideasoft.com/";

  @override
  Map<String, dynamic>? header = {
    "Authorization": "Bearer AX5FTZ7UBAABUDT6XYYPW7LX"
  };
}
