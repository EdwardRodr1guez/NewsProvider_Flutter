import 'package:flutter/material.dart';
import 'package:newsprovider/src/services/news_service.dart';
import 'package:newsprovider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
   
  const Tab1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return  Scaffold(
      body: ListaNoticias(newsService.headlines));
      
    
  }
}