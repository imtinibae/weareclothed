import 'package:flutter/material.dart';
import 'profile.dart';


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
                        builder: (context) => NewPage(),
                      ),
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  constraints: const BoxConstraints(
                    minWidth: 60.0,
                    minHeight: 60.0,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/face2.jpeg",
                      fit: BoxFit.cover,
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ImageWithDescription(
                imagePath: "assets/images/fit1.jpeg",
                description: "Fit from thrift shop !",
                onLike: () {
                  // Action lorsque l'icône "like" est pressée
                  print('Liked!');
                },
                onComment: () {
                  // Action lorsque l'icône "comment" est pressée
                  print('Commented!');
                },
                onShare: () {
                  // Action lorsque l'icône "share" est pressée
                  print('Shared!');
                },
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
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const ImageWithDescription({
    Key? key,
    required this.imagePath,
    required this.description,
    this.onLike,
    this.onComment,
    this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 50.0,
          left: 15.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white.withOpacity(0.5),
            child: Row(
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 12.0),
                ReactionBubble(
                  icon: Icons.favorite,
                  onTap: onLike,
                ),
                const SizedBox(width: 12.0),
                ReactionBubble(
                  icon: Icons.comment,
                  onTap: onComment,
                ),
                const SizedBox(width: 12.0),
                ReactionBubble(
                  icon: Icons.share,
                  onTap: onShare,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ReactionBubble extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const ReactionBubble({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(icon, size: 24.0),
      ),
    );
  }
}
