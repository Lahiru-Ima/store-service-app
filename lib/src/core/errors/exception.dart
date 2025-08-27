import 'package:dio/dio.dart';
import 'package:store_service_app/src/core/models/dio_response_model.dart';
import 'package:store_service_app/src/core/models/server_model.dart';



/// Exception for the HTTP requests from Dio
class ServerException implements Exception {
  late String errorMessage;
  late bool unexpectedError;
  ServerModel? data;

  ServerException({required this.errorMessage, required this.unexpectedError});

  /// Constructor for Dio package
  ServerException.fromDioError(DioException dioError) {
    data = ServerModel.fromDioError(dioError);
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to server was cancelled';
        unexpectedError = false;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out';
        unexpectedError = false;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Server took too long to respond';
        unexpectedError = false;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request timed out';
        unexpectedError = false;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioExceptionType.unknown:
        if ((dioError.message ?? '').contains('SocketException')) {
          errorMessage = 'No internet connection';
          unexpectedError = false;
          break;
        }
        errorMessage = 'Unexpected error occurred';
        unexpectedError = true;
        break;
      default:
        errorMessage = 'Something went wrong';
        unexpectedError = true;
        break;
    }
  }

  String _handleStatusCode(Response? response) {
    int? statusCode = response?.statusCode;
    switch (statusCode) {
      case 302:
        unexpectedError = true;
        return 'Further action needs to be taken';
      case 400:
        unexpectedError = true;
        return 'Bad request';
      case 401:
        unexpectedError = false;
        return 'Authentication failed';
      case 403:
        unexpectedError = false;
        return 'User is not authenticated';
      case 404:
        unexpectedError = true;
        return 'URL not found';
      case 405:
        unexpectedError = true;
        return 'Method not allowed';
      case 410:
        unexpectedError = true;
        return 'Email not found';
      case 411:
        unexpectedError = true;
        return 'Something went wrong, please try again';
      case 415:
        unexpectedError = true;
        return 'Unsupported media type';
      case 420:
        unexpectedError = true;
        return 'Failed to verify email';
      case 422:
        unexpectedError = false;
        return _getDataValidationErrorMessage(response) ??
            'Data validation failed';
      case 423:
        unexpectedError = true;
        return 'Something went wrong, please try again';
      case 429:
        unexpectedError = true;
        return 'Too many requests';
      case 500:
        unexpectedError = true;
        return 'Server error';
      case 433:
        unexpectedError = true;
        return 'Something went wrong, please try again';
      case 434:
        unexpectedError = true;
        return 'Something went wrong, please try again';
      default:
        unexpectedError = true;
        return 'Unhandled server error: ${statusCode.toString()}';
    }
  }

  /// Generate Validation Errors (Status 422)
  String? _getDataValidationErrorMessage(Response? response) {
    try {
      DioResponseModel res = dioResponseModelFromJson(response?.data);
      if (res.errors?.email != null) {
        return res.errors?.email?.first;
      }
      if (res.errors?.contactNumber != null) {
        return res.errors?.contactNumber?.first;
      }
      if (res.errors?.name != null) {
        return res.errors?.name?.first;
      }
      if (res.errors?.invalidCredentials != null) {
        return res.errors?.invalidCredentials?.first;
      }
      if (res.errors?.password != null) {
        return res.errors?.password?.first;
      }
      if (res.errors?.invalidDefaultPassword != null) {
        return res.errors?.invalidDefaultPassword?.first;
      }
      if (res.message != null || res.message != '') {
        return res.message;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  String toString() {
    return 'ServerException{errorMessage: $errorMessage, unexpectedError: $unexpectedError, data: $data}';
  }
}

/// Throws when there's no shared pref data to fetch
class CacheException implements Exception {}

/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );

      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Wrong password provided for that user.',
        );
      case 'too-many-requests':
        return const LogInWithEmailAndPasswordFailure(
          'Too many requests. Try again later.',
        );
      case 'user-token-expired':
        return const LogInWithEmailAndPasswordFailure(
          'User token has expired, please sign in again.',
        );
      case 'network-request-failed':
        return const LogInWithEmailAndPasswordFailure(
          'Network request failed, please check your internet connection.',
        );
      case 'invalid-credential':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure(
          'Operation is not allowed. Please contact support.',
        );

      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the signup process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'The email address is already in use by another account.',
        );
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'The email address is not valid or badly formatted.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed. Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'The password provided is too weak.',
        );
      case 'too-many-requests':
        return const SignUpWithEmailAndPasswordFailure(
          'Too many requests. Try again later.',
        );
      case 'user-token-expired':
        return const SignUpWithEmailAndPasswordFailure(
          'User token has expired, please sign up again.',
        );
      case 'network-request-failed':
        return const SignUpWithEmailAndPasswordFailure(
          'Network request failed, please check your internet connection.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
// class LogOutFailure implements Exception {}

/// Use to throw exception when the user not grant device permissions
// class NoPermission implements Exception {}

/// Use to throw platform related exceptions
// class DeviceException implements Exception {
//   final String message;
//
//   const DeviceException({
//     required this.message,
//   });
// }
