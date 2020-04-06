import 'package:flutter/material.dart';
import 'package:zapatos/src/widgets/progress_bar.dart';


class ProgressPage extends StatefulWidget {

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double porcentaje = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 30,
            width: double.infinity,
            color: Colors.red,
            child: ProgressBarWidget(
              porcentaje: porcentaje,
              grosorPrimario: 7,
            ),
          ),
     ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.place),
        onPressed: () {
          this.setState((){
            porcentaje += 5;
          });
        },
      ),
   );
  }
}