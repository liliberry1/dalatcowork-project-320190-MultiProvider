import 'dart:io';

import 'package:path_provider/path_provider.dart';




class FileHelper{

  Future<String> get localPath async{
    var dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> get localFile async{
    final path = localPath;
    return File('$path/accTke22145.txt');
  }

  Future<File> writeData(String content) async{
    final file = await localFile;
    return file.writeAsString(content);
  }

  Future<String> readAccessToken() async {
    try {
      final file = await localFile;
      // Read the file
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return null;
    }
  }


}