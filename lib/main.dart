import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'weareclothed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 60.0,
                height: 60.0,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPage(),
                      ),
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  child: Image.asset(
                    "assets/images/face1.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ImageWithDescription(
                imagePath: "assets/images/fit1.jpeg",
                description: "Description de l'image",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWithDescription extends StatelessWidget {
  final String imagePath;
  final String description;

  const ImageWithDescription({
    Key? key,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.5),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
        child: const Text('This is a new page.'),
      ),
    );
  }
}
