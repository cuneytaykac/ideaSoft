abstract class RequestProtocol {
  const RequestProtocol();
  String get baseURL;
  String get path;
  String get method;
  Map<String, dynamic>? get header;
  Map<String, dynamic>? get body;
  Map<String, dynamic>? get params;
  bool get isFormDataBody;
}
