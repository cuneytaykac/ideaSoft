import '../../data_provider_core/base_client.dart';

class ExampleRequestRequest extends BaseClient {
  @override
  String path = "";

  @override
  String method = "";

  @override
  Map<String, dynamic>? body;

  @override
  Map<String, dynamic>? params;
  @override
  bool get isFormDataBody => false;

  ExampleRequestRequest();
}
