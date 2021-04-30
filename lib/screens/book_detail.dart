

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_fetch/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
class BookDetail extends StatefulWidget {
  final int rating;
  final String author;
  final String title;
  final String imageUrl;
  final int id;
  final String url;
  final String bookName;
  BookDetail(this.rating, this.author, this.title, this.imageUrl, this.id, this.url, this.bookName);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {

  bool downloaded = false;
  bool loading = false;
  Dio dio = new Dio();
  double _percentage = 0;
  String progress = '';
  String path = '';
List<File> fills;
  Future downloadFile() async {

    Directory appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await  getDownloadsDirectory();

    path = appDocDir.path + '/${widget.bookName}.epub';
    File file = File(path);



    if (!File(path).existsSync()) {


      setState(() {
        loading = true;
      });
      await file.create();
      await dio.download(
        widget.url,
        path,
        deleteOnError: true,
        onReceiveProgress: (actualBytes, totalBytes) {
          double percentage = actualBytes / totalBytes * 100;


          setState(() {
            _percentage = percentage / 100;
            progress = '${percentage.floor()}%';
          });
          if (actualBytes== totalBytes) {
            Future.delayed(Duration(seconds: 2), (){
              loading = false;
              setState(() {
                downloaded = true;
              });
            });

          }

        },
      );

    }else {




      loading = false;

      EpubViewer.setConfig(
        themeColor: Theme.of(context).primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
      );

        EpubViewer.open(path);


    }
  }

bool isInit = true;

@override
  void didChangeDependencies() {
  if(isInit){
   Provider.of<BookList>(context, listen: false).fetchData();

  }
  isInit = false;
    super.didChangeDependencies();
  }

  String change = 'Download';

@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final files = Provider.of<BookList>(context).files;
    String kim = files.map((e) => e.path).toString();
    if(kim.contains('storage/emulated/0/Android/data/com.example.flutter_fetch/files/${widget.bookName}.epub')){
     setState(() {
       change = 'Read';
     });
    }

    return Scaffold(
      body: loading ? Container(
        margin: EdgeInsets.only(bottom: 250),
        child: SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
          elevation: 3,
          title: Text('Downloading...$progress'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator()
              ],
            ),
          ],
        ),
      ) : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Hero(
                    tag: widget.id,
                    child: Image.network(
                      widget.imageUrl,
                      width: 170,
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('by ${widget.author}'),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                              color: Colors.blue[200],
                              onPressed: () async {
await Provider.of<BookList>(context, listen: false).fetchData().then((value) {
    downloadFile();

    setState(() {
Future.delayed(Duration(seconds: 1), (){
  change = 'Read';
});
    });

});
    }, child:Text(change))
                        ],
                      ),
                  ),
                  ),

              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book Description',
                  style: TextStyle(fontSize: 22, color: Colors.blue[300]),
                ),
                Divider(),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
