import 'package:flutter/material.dart';
import 'package:newsprovider/src/pages/tab1_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionModel(),
      child: Scaffold(
        body: Center(
           child: _Pageview(),
        ),
        bottomNavigationBar: _bottomnav(),
      ),
    );
  }
}

class _bottomnav extends StatelessWidget {
  const _bottomnav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel= Provider.of<_NavegacionModel>(context);  //Traemos el provider de la clase privada _NavegacionModel y lo convertirmos en singleton

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual=i,
     
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
    
    final navegacionModel= Provider.of<_NavegacionModel>(context);  //Traemos el provider de la clase privada _NavegacionModel y lo convertirmos en singleton

    
    return PageView(
     controller: navegacionModel.pageController,                           //Es de tipo PageController, como este dependerá directamente de la ventana seleccionada pues se modifica un objeto del tipo pagecontroller dentro del mismo provider de navegación
     physics: NeverScrollableScrollPhysics(),//BouncingScrollPhysics(),
     children: [
       Tab1Page(),
       Container(color: Colors.blue)
     ],
    );
  }
}


/* *Creación de un provider, la clase debe incluir el changenotifier
   *Configurar getter y setters
   *usar el notifylistener 
   *envolver el widget principal del screen con la clase changenotifierprovider o multiprovider según corresponda
   *llamar el provider en la clase que se vaya a usar con Provider.of<>(context);
*/

class _NavegacionModel with ChangeNotifier{

  //propiedades
  int _paginaActual             =0;                 //cambiar de página
  PageController _pageController=PageController();  //propiedad privada del pagecontroller que depende de "cambiar página"

  //Getter 
  int            get paginaActual   => this._paginaActual;
  PageController get pageController => this._pageController;

  //Setter
  set paginaActual(int valor){
  this._paginaActual  =valor;
  this._pageController.animateToPage(valor, duration: Duration(milliseconds: 250),curve: Curves.easeOutCirc);

  notifyListeners();
 }
}