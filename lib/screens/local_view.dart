import 'dart:io';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';
class ViewOn extends StatefulWidget {
  @override
  _ViewOnState createState() => _ViewOnState();
}

class _ViewOnState extends State<ViewOn> {
  List<File> files;

  void getFiles() async {
    await Permission.storage.request().then((value) async {

    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    final root = storageInfo[0].rootDir;
    final fm = FileManager(root: Directory(root));
    files = await fm.filesTree(
        excludedPaths: ['/storage/emulated/0/Android/Android/data'],
        extensions: ["epub"]
    );
    });
    setState(() {});
  }

  @override
  void initState() {
    getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return files == null? Center(child: CircularProgressIndicator(),):
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView.builder(
            itemCount: files?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  EpubViewer.setConfig(
                    themeColor: Theme
                        .of(context)
                        .primaryColor,
                    identifier: 'iosBook',
                    scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                    allowSharing: true,
                    enableTts: true,

                  );

                  EpubViewer.open(files[index].path);
                },
                child: Card(
                    child: ListTile(
                      title: Text(files[index].path
                          .split('/')
                          .last),

                    )
                ),
              );
            }
    ),
        );
  }

}