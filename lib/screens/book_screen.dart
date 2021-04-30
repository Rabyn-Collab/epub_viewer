import 'package:flutter/material.dart';
import 'package:flutter_fetch/models.dart';
import 'package:flutter_fetch/screens/book_detail.dart';
import 'package:flutter_fetch/screens/stars.dart';

class BookScreen extends StatelessWidget {
  final List<Books> books = [
    Books(
        id: 1,
        title: 'Dracula the horror Story',
        author: 'Bram Stoker',
        bookName: 'Dracula',
        rating: 5,
        downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/Dracula.epub?alt=media&token=0c1c3af8-6d15-4593-b830-446db2ef88c2',
        imageUrl:
            'https://images.unsplash.com/photo-1561487767-1f32d174cce0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJhY3VsYXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
    Books(
        id: 2,
        author: 'Roger Lancelyn',
        title: 'Myths Legends of Ancient',
        bookName: 'Mythsoflegend',
        rating: 3,
        downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/Myths-Legends-of-Ancient-Greece-Rome-by-Em-Berens.epub?alt=media&token=a7db9db1-0e8f-4ca0-a6e1-091b89829108',
        imageUrl:
            'https://images.unsplash.com/photo-1599833975787-5c143f373c30?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG15dGhzJTIwb2YlMjBsZWdlbmR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
    Books(
        id: 3,
        author: 'Meredith Nicholson',
        rating: 4,
        bookName: 'Thehouseofcandles',
        title: 'The House of candles',
        downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/The-House-of-a-Thousand-Candles.epub?alt=media&token=199e9f8e-ae56-4945-99dd-7ef864e775f0',
        imageUrl:
            'https://images.unsplash.com/photo-1491955478222-69ae25414368?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvdXNlJTIwb2YlMjBjYW5kbGVzfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),


    Books(
      id: 4,
      author: 'Edwin Drood',
      rating: 3,
      bookName: 'Edwindrood',
      title: 'The Mystery of Edwin Drood',
      downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/The-Mystery-of-Edwin-Drood.epub?alt=media&token=2f5d78ee-217f-4ed4-819c-f75e55355363',
      imageUrl: 'https://images.unsplash.com/photo-1478381581678-59a216d2d311?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fG15c3Rlcnl8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),

    Books(
    id: 5,
      author: 'Francis Scott',
      rating: 4,
      bookName: 'TheGreatGatsby',
      title: 'The Great Gatsby',
      downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/The_Great_Gatsby.epub?alt=media&token=ba9c04e6-7d6b-4209-935a-a5f121f93dd4',
      imageUrl: 'https://images.unsplash.com/photo-1565265491739-fc30b45f896a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z2F0c2J5fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Books(
      id: 6,
      author: 'Mark Twain',
      rating: 4,
      bookName: 'TheMillionPound',
      title: 'The Million Pound Bank',
      downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/The_Million_Pound_Bank_Note.epub?alt=media&token=973689ca-bd17-41ba-b402-17f157ed95a8',
      imageUrl: 'https://images.unsplash.com/photo-1580971266928-ff5d40c194a7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjl8fG1pbGxpb24lMjBwb3VuZHxlbnwwfDB8MHw%3D&auto=format&fit=crop&w=500&q=60'
    ),
    Books(
      id: 7,
      author: 'Jules Verne',
      rating: 3,
      bookName: 'TheSurvivor',
      title: 'The survivor of chancellour',
      downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/The_Survivors_of_the_Chancellor.epub?alt=media&token=6a70ab42-c93c-429e-abd3-9fe6b5b3a021',
      imageUrl: 'https://images.unsplash.com/photo-1516395614785-58f599409d3c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHN1cnZpdm9yfGVufDB8MHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
    ),
    Books(
      id: 8,
      author: 'Romano Guardini',
      rating: 5,
      bookName: 'LordJesus',
      title: 'Lord Jesus',
      downloadUrl: 'https://firebasestorage.googleapis.com/v0/b/fireapp-fbcb4.appspot.com/o/lord-jesus-2020-01-14-the-word-of-god-at-the-feast-of-the-lord-s-circumcision-and-the-feast-of-the-s.epub?alt=media&token=47075984-31e9-4e7b-b37e-ac817d7c3a83',
      imageUrl: 'https://images.unsplash.com/photo-1548092749-23b40567cb0d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8amVzdXN8ZW58MHwwfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Book Gallery', style: TextStyle(fontSize: 30, ),),
          ),
          Container(
            height: 140,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    width: 290,
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            books[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  books[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                RatingStars(books[index].rating),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'by ${books[index].author}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Expanded(
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Text('Read Now')))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: books.map((book) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetail(book.rating, book.author, book.title, book.imageUrl, book.id, book.downloadUrl, book.bookName)));
                },
                child: Container(
                  height: 145,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.grey[200]),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Hero(
                            tag: book.id,
                            child: Image.network(
                              book.imageUrl,
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover,
                            ),
                          )),
                      SizedBox(width: 20,),
                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(book.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15),),
                            RatingStars(book.rating),
                            Text(book.author),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    ]);
  }
}
