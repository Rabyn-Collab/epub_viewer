import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';

class Books{
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final int rating;
  final String downloadUrl;
  final String bookName;

  Books({this.imageUrl, this.id, this.title, this.author, this.rating, this.downloadUrl, this.bookName});
}


class BookList with ChangeNotifier{
  List<File> _files = [];

  List<File> get files {
    return [..._files];
  }


 Future<void> fetchData() async{
   await Permission.storage.request().then((value) async {

     List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
     final root = storageInfo[0].rootDir;
     final fm = FileManager(root: Directory(root)); //
     _files = await fm.filesTree(
         excludedPaths: ['/storage/emulated/0/Android/Android/data'],
         extensions: ["epub"]
     );
     notifyListeners();
   });

 }



}