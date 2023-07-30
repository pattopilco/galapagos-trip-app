import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

/// Clase que contiene métodos utilitarios para la descarga de archivos a repositiorio local del dispositivo
class UtilFileService {
  static String url_upload_app = 'https://galavail.com/upload/app/';
  static String url_upload_cruises = 'https://galavail.com/upload/cruises/';
  static String url_upload_manual_cabina =
      'https://galavail.com/upload/documents/cabin%20manual/';

  static Future<String> getApplicationDocumentsDirectoryRoyal() async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    if (dir == null) {
      throw MissingPlatformDirectoryException(
          'Unable to get application documents directory');
    }
    return '$dir/royal_documents/';
  }

  static Future<bool> isDownloadDocument(String documentName) async {
    var directory = (await getApplicationDocumentsDirectory()).path;
    String path = '$directory/royal_documents/$documentName';
    File file = File(path);
    if (await file.exists()) {
      return true;
    } else {
      return false;
    }
  }

  static Future<File> getImageLocalStorage(String documentName) async {
    var directory = (await getApplicationDocumentsDirectory()).path;
    String path = '$directory/royal_documents/$documentName';
    File file = File(path);
    return file;
  }

  deleteImagesLocalStorage(result) async {
    var list = [];
    list = result[0]['images'];
    list.forEach((element) async => {await deleteFile(element)});
  }

  static Future openDocument(String documentName) async {
    try {
      var directory = (await getApplicationDocumentsDirectory()).path;
      String openPath = '$directory/royal_documents/$documentName';
      await OpenFile.open(openPath);
    } catch (e) {
      print(e);
    }
  }

  /// Método que descarga un document en el storage del dispositivo
  static Future downloadDocument(
      String urlRepositorio, String documentName) async {
    var dio = Dio();
    var directory = (await getApplicationDocumentsDirectory()).path;
    String savePath = '$directory/royal_documents/$documentName';
    try {
      Response response = await dio.get(
        urlRepositorio,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      File file = File(savePath);
      if (!await file.exists()) {
        await file.create(recursive: true);
      }
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {}
  }

  static Future<void> deleteFile(String nameFile) async {
    try {
      var dir = (await getApplicationDocumentsDirectory()).path;
      String path = '$dir/royal_documents/$nameFile';
      File file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      print('Error in getting access to the file');
    }
  }
}
