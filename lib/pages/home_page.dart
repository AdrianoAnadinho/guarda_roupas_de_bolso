import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/assets/icons/pocket_icons_icons.dart';
import 'package:guarda_roupas_de_bolso/constants.dart';
import 'package:guarda_roupas_de_bolso/hive/boxes/boxes.dart';
import 'package:guarda_roupas_de_bolso/models/enums/enums.dart';
import 'package:guarda_roupas_de_bolso/models/models.dart';
import 'package:guarda_roupas_de_bolso/stores/cubits/home_page_cubit.dart';
import 'package:guarda_roupas_de_bolso/stores/states/home_page_state.dart';
import 'package:guarda_roupas_de_bolso/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final titleFocusNode = FocusNode();
  final cubit = HomePageCubit();
  List<Location> locationsList = [
    // const Location(
    //   title: 'Trabalho',
    //   time: TimeOfDay(hour: 5, minute: 11),
    //   braStatus: false,
    //   pantiesStatus: true,
    //   shirtStatus: true,
    //   shoeStatus: false,
    //   shortsStatus: true,
    //   socksStatus: false,
    // ),
  ];

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            DateRow(
              date: DateTime.now(),
            ),
            BlocBuilder<HomePageCubit, HomePageState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is HomePageLoadedState) {
                  locationsList = state.locations;

                  locationsList.sort(
                    (a, b) => a.time != null && b.time != null
                        ? ((a.time!.hour) * 60 + a.time!.minute)
                            .compareTo(((b.time!.hour) * 60 + b.time!.minute))
                        : 1,
                  );

                  return Expanded(
                    child: ListView.builder(
                      itemCount: locationsList.length,
                      itemBuilder: (context, index) {
                        final location = locationsList[index];

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: LocationCard(
                            onDelete: (key) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColors.orange,
                                  title: const Text(
                                    'Tem certeza que deseja deletar?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.red,
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text(
                                            'NÃO',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const HSpace(16.0),
                                      Expanded(
                                        child: TextButton(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.green,
                                            ),
                                          ),
                                          onPressed: () {
                                            locationsBox.delete(key);
                                            cubit.refreshLocations();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'SIM',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            onTap: (category, key) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColors.orange,
                                  title: Text(
                                    'Tem certeza que deseja alterar ${category.displayName}?',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.red,
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text(
                                            'NÃO',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const HSpace(16.0),
                                      Expanded(
                                        child: TextButton(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.green,
                                            ),
                                          ),
                                          onPressed: () {
                                            locationsBox.put(
                                              key,
                                              location.copyWith(
                                                shirtStatus:
                                                    category == Category.shirt
                                                        ? !location.shirtStatus
                                                        : location.shirtStatus,
                                                shortsStatus:
                                                    category == Category.shorts
                                                        ? !location.shortsStatus
                                                        : location.shortsStatus,
                                                shoeStatus:
                                                    category == Category.shoe
                                                        ? !location.shoeStatus
                                                        : location.shoeStatus,
                                                socksStatus:
                                                    category == Category.socks
                                                        ? !location.socksStatus
                                                        : location.socksStatus,
                                                braStatus:
                                                    category == Category.bra
                                                        ? !location.braStatus
                                                        : location.braStatus,
                                                pantiesStatus: category ==
                                                        Category.panties
                                                    ? !location.pantiesStatus
                                                    : location.pantiesStatus,
                                              ),
                                            );

                                            cubit.refreshLocations();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'SIM',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            isExpanded: _compareTime(
                              TimeOfDay.fromDateTime(
                                DateTime.now(),
                              ),
                              locationsList[index].time,
                            ),
                            title: location.title,
                            time: location.time,
                            categories: [
                              TaskCategory(
                                icon: PocketIcons.shirt,
                                category: Category.shirt,
                                isDone: location.shirtStatus,
                              ),
                              TaskCategory(
                                icon: PocketIcons.shorts,
                                category: Category.shorts,
                                isDone: location.shortsStatus,
                              ),
                              TaskCategory(
                                icon: PocketIcons.shoe,
                                category: Category.shoe,
                                isDone: location.shoeStatus,
                              ),
                              TaskCategory(
                                icon: PocketIcons.socks,
                                category: Category.socks,
                                isDone: location.socksStatus,
                              ),
                              TaskCategory(
                                icon: PocketIcons.bra,
                                category: Category.bra,
                                isDone: location.braStatus,
                              ),
                              TaskCategory(
                                icon: PocketIcons.panties,
                                category: Category.panties,
                                isDone: location.pantiesStatus,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue1,
        foregroundColor: AppColors.brightOrange,
        onPressed: () => addLocation(
          context,
          (title, time) {
            locationsBox.put(
              title,
              Location(
                title: title,
                time: time,
              ),
            );
            cubit.refreshLocations();
            // locationsList.add(
            //   Location(
            //     title: title,
            //     time: time,
            //   ),
            // );

            Navigator.of(context).pop();
            timeController.clear();
            titleController.clear();
          },
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  addLocation(
    BuildContext context,
    Function(
      String title,
      TimeOfDay? time,
    ) addLocationToList,
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
                            focusNode: titleFocusNode,
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
                            onTap: () async {
                              titleFocusNode.unfocus();
                              FocusScope.of(context).unfocus();
                              selectedTime = await openTimePicker(context);
                            },
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
                    const VSpace(48.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.orange,
                          ),
                        ),
                        onPressed: () => addLocationToList(
                          titleController.text,
                          selectedTime,
                        ),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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

  bool _compareTime(TimeOfDay now, TimeOfDay? cardTime) {
    if (cardTime == null) {
      return false;
    }

    if (cardTime.hour < now.hour ||
        (cardTime.hour == now.hour && cardTime.minute < now.minute)) {
      return false;
    }

    return true;
  }
}

Color getColorFromHex(String value) {
  final formattedValue = value.replaceAll('#', '');
  return Color(int.parse('0xff$formattedValue'));
}
