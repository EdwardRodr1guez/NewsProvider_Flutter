import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: _Pageview(),
      ),
      bottomNavigationBar: _bottomnav(),
    );
  }
}

class _bottomnav extends StatelessWidget {
  const _bottomnav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (i){
        print("$i");
      } ,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Para tí" ),
        BottomNavigationBarItem(icon: Icon(Icons.public)        ,label: "Encabezados" ),
        
      ],
    );
  }
}

class _Pageview extends StatelessWidget {
  const _Pageview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
     physics: NeverScrollableScrollPhysics(),//BouncingScrollPhysics(),
     children: [
       Container(color: Colors.green,),
       Container(color: Colors.blue)
     ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  //propiedad
  int _paginaActual=0;

  //Getter 
  int get paginaActual => this._paginaActual;

  //Setter
  set paginaActual(int valor){
  this._paginaActual=valor;
  notifyListeners();
 }
}