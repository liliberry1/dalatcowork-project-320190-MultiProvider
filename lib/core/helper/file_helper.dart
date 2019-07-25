import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  final String _fileName = "accessToken";

  Future<String> get getLocalPath async {
    var dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get getLocalFile async {
    final path = getLocalPath;
    return File('$path/$_fileName.txt');
  }

  Future<File> writeData(String content) async {
    print("function writeData");
    File file;
    getLocalFile.then((tempFile){
      file = tempFile;
    });
    bool isExist = true;
    await checkExistFile(file).then((exits){
      isExist = exits;
    });
      if (!isExist) {
        String filePath;
        await getLocalPath.then((path){
          filePath = path;
        });
      await File(filePath).create(recursive: true).then((tempFile) {
        print("created file");
        file = tempFile;
      });
    }
    print("saved data");
    return file.writeAsString(content);
  }

  Future<String> readFile(File file) async {
    try {
      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }

  Future<String> getAccessToken() async {
    File file;
    await getLocalFile.then((tempFile){
      file = tempFile;
    });
    bool isExits = false;
    var accessToken = null;
    await checkExistFile(file).then((exits){
    isExits = exits;
    });
    if (isExits) {
      accessToken = readFile(file);
    }
    return accessToken;
  }

  Future<bool> checkExistFile(File file) async {
    return file.exists();
  }

  Future<bool> deleteFileAccessToken() async {
    final file = await getLocalFile;
    file.delete();
  }
}
