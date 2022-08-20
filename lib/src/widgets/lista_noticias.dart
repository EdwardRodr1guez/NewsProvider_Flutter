import 'package:flutter/material.dart';
import 'package:newsprovider/src/models/news_models.dart';
import 'package:newsprovider/src/theme/darktheme.dart';

class ListaNoticias extends StatelessWidget {
  
  List<Article> noticias;

  ListaNoticias(this.noticias);

  
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(noticia: this.noticias[index], index: index);
      } );
  }
}




class _Noticia extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _TarjetaTopBar(noticia: noticia,index: index),
          _TarjetaTitulo(noticia: noticia),
          _TarjetaImagen(noticia: noticia),
        ],
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar({super.key, required this.noticia, required this.index});

  
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 10),
       margin: EdgeInsets.only(bottom: 10),
       child: Row(
        children: [
          Text("${index+1}", style:TextStyle(color: DarkTheme.colorScheme.secondary )),
          Text("${noticia.source.name}")
       
        ],
       ),
    );
  }
}




class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  
  const _TarjetaTitulo({super.key, required this.noticia});

  
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.symmetric(horizontal: 15),
       child: Text(noticia.title, style: TextStyle(fontSize:20, fontWeight: FontWeight.w700))
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  
  const _TarjetaImagen({super.key, required this.noticia});

  
  @override
  Widget build(BuildContext context) {
    return Container(
       //padding: EdgeInsets.symmetric(horizontal: 15),
        child: FadeInImage(
          placeholder: AssetImage('assets/img/giphy.gif') ,
          image: NetworkImage(noticia.urlToImage!),
        ));
  }
}
