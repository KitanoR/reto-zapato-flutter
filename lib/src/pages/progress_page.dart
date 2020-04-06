import 'package:flutter/material.dart';
import 'package:zapatos/src/widgets/progress_bar.dart';


class ProgressPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: ProgressBarWidget(),
          ),
     ),
      ),
   );
  }
}