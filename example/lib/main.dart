import 'package:faded_widget/faded_widget.dart';
import 'package:flutter/material.dart';

import 'fades.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FadedWidget Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter FadedWidget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GradientDirection _direction = GradientDirection.ttb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            FadedWidget(
              height: 400,
              width: 400,
              fade: Fades.gray,
              direction: _direction,
              child: Image(
                height: 400,
                width: 400,
                image: AssetImage('assets/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _direction = GradientDirection.ttb;
                    });
                  },
                  child: Text('Top to Bottom'),
                ),
              ),
              Container(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _direction = GradientDirection.btt;
                    });
                  },
                  child: Text('Bottom to Top'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _direction = GradientDirection.ltr;
                    });
                  },
                  child: Text('Left to Right'),
                ),
              ),
              Container(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _direction = GradientDirection.rtl;
                    });
                  },
                  child: Text('Right to Left'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
