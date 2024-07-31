// google_drive_service.dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

final _scopes = [drive.DriveApi.driveFileScope];

class GoogleDriveService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: _scopes,
  );

  GoogleSignInAccount? _currentUser;
  AuthClient? _client;

  Future<void> signIn() async {
    _currentUser = await _googleSignIn.signIn();
    if (_currentUser != null) {
      final headers = await _currentUser!.authHeaders;
      final authClient = GoogleAuthClient(headers);
      _client = authenticatedClient(
          authClient,
          AccessCredentials(
            AccessToken(
                headers['Authorization']!.split(' ')[0],
                headers['Authorization']!.split(' ')[1],
                DateTime.now().add(Duration(hours: 1))),
            null,
            _scopes,
          ));
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _client = null;
  }

  bool isSignedIn() {
    return _currentUser != null && _client != null;
  }

  AuthClient? get client => _client;
}

class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
