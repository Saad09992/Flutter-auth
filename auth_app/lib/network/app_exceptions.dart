// ignore_for_file: prefer_typing_uninitialized_variables, annotate_overrides

class AppExceptions implements Exception {
  final _message;
  final _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

// Error during fetching data
class FetchDataException extends AppExceptions {
  FetchDataException([String? messege])
      : super(messege, 'Error during communication');
}

// Error due to bad requests

class BadReqException extends AppExceptions {
  BadReqException([String? messege])
      : super(messege, 'Invalid request communication');
}

// Error due to unAuth requests

class UnAuthException extends AppExceptions {
  UnAuthException([String? messege]) : super(messege, 'UnAuthorized request');
}

// Error due to invalid input requests

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? messege])
      : super(messege, 'Invalid Input request');
}
