class ErrorResponse {
  ErrorResponseError error;

  ErrorResponse({required this.error});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(error: ErrorResponseError.fromJson(json['error']));
  }
}

class ErrorResponseError {
  int code;
  String message;
  List<ErrorElement> errors;

  ErrorResponseError({
    required this.code,
    required this.message,
    required this.errors,
  });

  factory ErrorResponseError.fromJson(Map<String, dynamic> json) {
    return ErrorResponseError(
      code: json['code'],
      message: json['message'],
      errors:
          (json['errors'] as List)
              .map((e) => ErrorElement.fromJson(e))
              .toList(),
    );
  }
}

class ErrorElement {
  String message;
  String domain;
  String reason;
  String location;
  String locationType;

  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
    required this.location,
    required this.locationType,
  });

  factory ErrorElement.fromJson(Map<String, dynamic> json) {
    return ErrorElement(
      message: json['message'],
      domain: json['domain'],
      reason: json['reason'],
      location: json['location'],
      locationType: json['locationType'],
    );
  }
}
