import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:goodwishes/Functions/google_drive_auth_client.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;

class GoogleDriveService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [drive.DriveApi.driveAppdataScope],
  );

  GoogleSignInAccount? currentUser;
  drive.DriveApi? _driveApi;

  Future<GoogleSignInAccount?> signInGoogle() async {
    try {
      currentUser =
          await _googleSignIn.signInSilently() ?? await _googleSignIn.signIn();
      if (currentUser != null) {
        _driveApi = await getDriveApi(currentUser!);
      }
    } catch (e) {
      debugPrint('Error during Google Sign-In: $e');
    }
    return currentUser;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    currentUser = null;
    _driveApi = null;
  }

  Future<drive.DriveApi?> getDriveApi(GoogleSignInAccount googleUser) async {
    drive.DriveApi? driveApi;
    try {
      Map<String, String> headers = await googleUser.authHeaders;
      GoogleAuthClient client = GoogleAuthClient(headers);
      driveApi = drive.DriveApi(client);
    } catch (e) {
      debugPrint(e.toString());
    }
    return driveApi;
  }

  Future<drive.File?> uploadFile(
      {required File file, String? driveFileId}) async {
    if (_driveApi == null) return null;

    drive.File driveFile = drive.File();
    driveFile.name = path.basename(file.absolute.path);

    late final response;
    if (driveFileId != null) {
      response = await _driveApi!.files.update(driveFile, driveFileId,
          uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
    } else {
      driveFile.parents = ["appDataFolder"];
      response = await _driveApi!.files.create(driveFile,
          uploadMedia: drive.Media(file.openRead(), file.lengthSync()));
    }
    return response;
  }

  Future<File?> downloadFile(
      {required String driveFileId, required String localPath}) async {
    if (_driveApi == null) return null;

    drive.Media media = await _driveApi!.files.get(driveFileId,
        downloadOptions: drive.DownloadOptions.fullMedia) as drive.Media;

    List<int> data = [];
    await media.stream.forEach((element) {
      data.addAll(element);
    });

    File file = File(localPath);
    file.writeAsBytesSync(data);

    return file;
  }

  Future<drive.File?> getDriveFile({required String filename}) async {
    if (_driveApi == null) return null;

    drive.FileList fileList = await _driveApi!.files
        .list(spaces: "appDataFolder", $fields: "files(id,name,modifiedTime)");
    List<drive.File>? files = fileList.files;

    try {
      drive.File? driveFile =
          files?.firstWhere((element) => element.name == filename);
      return driveFile;
    } catch (e) {
      return null;
    }
  }
}
