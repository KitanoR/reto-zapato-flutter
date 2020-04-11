import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
class LlamaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Pulse(
                  infinite: true,
                  child: Image(
                    width: 100,
                  image: AssetImage('assets/imgs/llama.png'),
                ),
              ),
              SizedBox(height: 50,),
              Text(
                'Cargando...',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20
                ),
              )
            ],
          ),
        )
     ),
   );
  }
}