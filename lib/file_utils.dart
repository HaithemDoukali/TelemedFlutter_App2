/*
* Functions for File Operations
*/

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils {
  /* Get the application’d Document’s directory*/
  static Future<String> get getFilePath async {
    // async - file operations should not be blocking the main thread
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /* Get the file descriptor from the Directory */
  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/myFile.txt'); // return path - new file
  }

  /* Save the data to the file */
  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data);
  }

  /* Read the contents from the file */
  static Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContens = await file.readAsString();
      return fileContens;
    } catch (e) {
      return "Error";
    }
  }
}
