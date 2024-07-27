import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  List<Location> locationsList = [
    const Location(
      title: 'Casa',
      time: TimeOfDay(hour: 3, minute: 32),
    ),
    const Location(
      title: 'Trabalho',
      time: TimeOfDay(hour: 5, minute: 11),
    ),
    const Location(
      title: 'Faculdade',
      time: TimeOfDay(hour: 4, minute: 56),
    ),
    const Location(
      title: 'Amiga',
      time: TimeOfDay(hour: 10, minute: 43),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    locationsList.sort(
      (a, b) => a.time != null && b.time != null
          ? ((a.time!.hour) * 60 + a.time!.minute)
              .compareTo(((b.time!.hour) * 60 + b.time!.minute))
          : 1,
    );

    return Scaffold(
      backgroundColor: AppColors.blue3,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.blue3,
        unselectedItemColor: AppColors.blue1,
        backgroundColor: AppColors.orange,
        onTap: (value) => Navigator.push,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: AppColors.blue3,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calendário',
            icon: Icon(
              Icons.calendar_month,
              color: AppColors.blue3,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: AppColors.blue3,
        title: Text(
          widget.title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: AppColors.blue2,
                    child: Text(
                      DateFormat('dd/MM/yyyy').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                        fontSize: 32.0,
                        color: AppColors.brightOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: locationsList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LocationCard(
                    title: locationsList[index].title,
                    time: locationsList[index].time,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue1,
        foregroundColor: AppColors.brightOrange,
        onPressed: () => addLocation(
          context,
          (title, time) {
            setState(() {
              locationsList.add(
                Location(
                  title: title,
                  time: time,
                ),
              );
            });

            Navigator.of(context).pop();
            print(locationsList);
          },
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  addLocation(
    BuildContext context,
    Function(String title, TimeOfDay? time) addLocationToList,
  ) async {
    TimeOfDay? selectedTime;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BottomSheet(
        backgroundColor: AppColors.blue2,
        onClosing: () {},
        builder: (context) => SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.brightOrange,
                      child: IconButton(
                        icon: Icon(
                          Icons.close_outlined,
                          color: AppColors.blue3,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Título',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: AppColors.brightOrange,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.white,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.brightOrange,
                                ),
                              ),
                              fillColor: AppColors.brightOrange,
                              focusColor: AppColors.brightOrange,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            controller: titleController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Horário',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: AppColors.brightOrange,
                      ),
                    ),
                    const VSpace(8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            canRequestFocus: false,
                            onTap: () async =>
                                selectedTime = await openTimePicker(context),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.white,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                                borderSide: BorderSide(
                                  color: AppColors.brightOrange,
                                ),
                              ),
                              fillColor: AppColors.brightOrange,
                              focusColor: AppColors.brightOrange,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            controller: timeController,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => addLocationToList(
                        titleController.text,
                        selectedTime,
                      ),
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<TimeOfDay?> openTimePicker(BuildContext localContext) async {
    final time = await showTimePicker(
      context: localContext,
      initialTime: TimeOfDay.now(),
    );

    if (context.mounted) {
      timeController.text = time!.format(localContext);
      return time;
    }
    return null;
  }
}

class VSpace extends StatelessWidget {
  final double height;

  const VSpace(
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class Location extends Equatable {
  final String title;
  final TimeOfDay? time;

  const Location({
    required this.title,
    this.time,
  });

  @override
  List<Object?> get props => [
        title,
        time,
      ];
}

class LocationCard extends StatelessWidget {
  final String title;
  final TimeOfDay? time;

  const LocationCard({
    required this.title,
    this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 110,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF002E4E),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          if (time != null) ...[
            Positioned(
              left: 0,
              bottom: 0,
              top: 40,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF00406C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: Text(
                  time!.format(context),
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class TaskCategory {
  final IconData icon;
  final bool isDone;
  final Color iconColor;
  TaskCategory({
    required this.icon,
    required this.isDone,
    required this.iconColor,
  });
}

Color getColorFromHex(String value) {
  final formattedValue = value.replaceAll('#', '');
  return Color(int.parse('0xff$formattedValue'));
}

class AppColors {
  static Color blue3 = const Color(0xFF001233);
  static Color blue2 = const Color(0xFF002E4E);
  static Color blue1 = const Color(0xFF00406C);
  static Color white = const Color(0xFFFFFFFF);
  static Color orange = const Color(0xFFFF9500);
  static Color brightOrange = const Color(0xFFFFA200);
}
