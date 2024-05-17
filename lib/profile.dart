import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key});

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
        title: const Text('weareclothed'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/face2.jpeg'),
                ),
                const SizedBox(width: 16.0),
                const Expanded(
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
                  child: const Text('ADD'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0), // Espacement
          // Calendrier avec miniatures d'image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                calendarFormat: CalendarFormat.month,
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
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
                          Event>?;
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
          const SizedBox(height: 20.0), // Espacement
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
                  child: const Text('My Friends'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Settings" est pressé
                    print('Settings button pressed');
                  },
                  child: const Text('Settings'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lorsque le bouton "Fav Brands" est pressé
                    print('Fav Brands button pressed');
                  },
                  child: const Text('Fav Brands'),
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
