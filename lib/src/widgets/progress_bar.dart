import 'package:flutter/material.dart';

class ProgressBarWidget extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final bool transaparente;

  ProgressBarWidget({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue, 
    this.colorSecundario = Colors.grey, 
    this.grosorPrimario = 7,
    this.transaparente=false
  });

  @override
  _ProgressBarWidgetState createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget>  with SingleTickerProviderStateMixin{
  AnimationController controller;
  double porcentajeAnterior;
  

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

     controller.forward(from:0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    final size = MediaQuery.of(context).size;
    final calculo = (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value);
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.grosorPrimario,
            width: double.infinity,
            decoration: BoxDecoration(
              color: (widget.transaparente) ? Colors.transparent : widget.colorSecundario,
              border: Border.all(
                color: widget.colorSecundario
              ),
              borderRadius: BorderRadius.circular(widget.grosorPrimario)
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: size.width * ( widget.porcentaje / 100 ),
            height: widget.grosorPrimario,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(widget.grosorPrimario)
            ),
          )
        ],
      )
    );


  }
}


class _BarraProgreso extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final bool tieneFondo;

  _BarraProgreso(
    this.porcentaje, 
    this.colorPrimario, 
    this.colorSecundario, 
    this.grosorPrimario,
    this.tieneFondo
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorSecundario
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;
    
    final path = new Path();
    path.lineTo(size.width, 0);

    // agregando fondo blanco

    canvas.drawPath(path, paint);

    if(tieneFondo){
      final paintFondoBlanco = new Paint()
      ..strokeWidth = grosorPrimario * 0.8
      ..color       = Colors.white
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;
    
      final pathFondo = new Path();
      pathFondo.lineTo(size.width * 1, 0);
      canvas.drawPath(pathFondo, paintFondoBlanco);
    }

    


    final paintLlenar = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorPrimario
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;

    final pathRelleno = new Path();
    pathRelleno.lineTo(size.width * 0.7, 0);
    canvas.drawPath(pathRelleno, paintLlenar);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
 
}