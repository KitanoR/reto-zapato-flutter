import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:zapatos/src/widgets/TemplateCustom.dart';


class PopupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final popup = BeautifulPopup.customize(
      context: context,
       build: (BeautifulPopup options) => MyTemplate(options),
    );

    return Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.play_arrow),
       onPressed: () {
         popup.show(
           title: "Incorrecto",
           content: Container(
              color: Colors.black12,
              child: Text(
                  'This popup shows you how to customize your own BeautifulPopupTemplate.'),
            ),
         );
       },
     ),
   );
  }
}