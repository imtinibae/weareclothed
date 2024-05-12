import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
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

class NewPage extends StatelessWidget {
   NewPage({Key? key}) : super(key: key);

  // Structure pour mapper les événements aux dates
  final Map<DateTime, List<Event>> events = {
    DateTime.now(): [Event(imagePath: 'assets/images/fit1.jpeg')],
    DateTime.now().add(const Duration(days: 2)): [Event(imagePath: 'assets/images/fit1.jpeg')],
    // Ajoutez d'autres dates et événements ici
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('New Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/face2.jpeg'),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nom Utilisateur',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Description de l\'utilisateur',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton Suivre est pressé
                  },
                  child: Text('ADD'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0), // Espacement
          // Calendrier avec miniatures d'image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                calendarFormat: CalendarFormat.month,
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  // Adjust the size of the calendar cells
                  defaultTextStyle: TextStyle(fontSize: 18),
                  weekendTextStyle: TextStyle(fontSize: 18 ),
                  todayTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                eventLoader: _getEventsForDay,
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    if (date.year == 2024 && date.month == 5 && date.day == 13) {
                      final List<Event>? typedEvents = events as List<
                          Event>?; // Convertir events en List<Event>?
                      final Event? event = typedEvents?.isNotEmpty ?? false
                          ? typedEvents!.first
                          : null;
                      if (event != null) {
                        return Positioned(
                          right: 1,
                          bottom: 1,
                          child: ClipOval(
                            child: Image.asset(
                              event.imagePath,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    }
                    return const SizedBox.shrink(); // Pas d'image
                  },
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  // Action lorsqu'un jour est sélectionné
                },
                selectedDayPredicate: (day) {
                  return isSameDay(DateTime.now(), day);
                },
              ),
            ),
          ),
          SizedBox(height: 20.0), // Espacement
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "My Friends" est pressé
                    print('My Friends button pressed');
                  },
                  child: Text('My Friends'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Settings" est pressé
                    print('Settings button pressed');
                  },
                  child: Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Fav Brands" est pressé
                    print('Fav Brands button pressed');
                  },
                  child: Text('Fav Brands'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // Fonction pour récupérer les événements associés à une date donnée
   List<Event> _getEventsForDay(DateTime day) {
     // Exemple : retourner une liste d'événements pour la date donnée
     return [
       Event(imagePath: 'assets/images/fit1.jpeg'),
     ];
   }
}

// Modèle d'événement
class Event {
  final String imagePath;

  Event({required this.imagePath});
}