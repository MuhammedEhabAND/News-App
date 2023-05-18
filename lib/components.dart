import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view_screen.dart';

Widget NewsItem(Map<String ,dynamic> model, context) =>   Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Card(



      elevation:20,

      child: ListTile(


        title:Text('${model['title']}' , maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyText1,) ,
        subtitle:Text('${model['author']}',
          maxLines: 2,overflow: TextOverflow.ellipsis,) ,

        trailing:model['urlToImage']==null ? SizedBox(width: 75 ,child: Text('${model['publishedAt']}'),):SizedBox(width:75 ,child: Image.network(model['urlToImage'])) ,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(url: model['url'])));
        },


      )


  ),
);
