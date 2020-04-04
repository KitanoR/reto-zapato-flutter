
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapatos/src/helpers/helpers.dart';
import 'package:zapatos/src/models/zapato_models.dart';
import 'package:zapatos/src/widgets/custom_widgets.dart';


class ZapatoDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen:true),
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  onPressed: (){
                    cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesSettings()
                ],
              ),
            ),
          )
        ],
      )
   );
  }
}

class _BotonesSettings extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonSombreado(
            icono: Icon(Icons.star, color: Colors.red, size: 25,),
          ),
          _BotonSombreado(
            icono: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,),
          ),
          _BotonSombreado(
            icono: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,),
          )
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icono;
  const _BotonSombreado({
   @required this.icono
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0,10))
        ]
      ),
      child: this.icono,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[

          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(left: 90, child: _BotonColor(Color(0xFFC6D642), 4, 'assets/imgs/verde.png')),
                Positioned(left: 60, child: _BotonColor(Color(0xFFFFAD29), 3, 'assets/imgs/amarillo.png')),
                Positioned(left: 30, child: _BotonColor(Color(0xFF2099F1), 2, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xFF364D56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),

          BotonNaranja(texto: 'More related items', alto: 30, ancho: 160, color: Color(0xFFFFc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;
  const _BotonColor(this.color, this.index, this.assetImage);
  @override
  Widget build(BuildContext context) {
      

    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.assetImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 25),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(texto: 'Buy Now', ancho: 120, alto: 40,)
            )
          ],
        ),
      ),
    );
  }
}