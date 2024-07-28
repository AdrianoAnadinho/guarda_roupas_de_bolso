import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/models/enums/category.dart';
import 'package:guarda_roupas_de_bolso/models/task_category.dart';
import 'package:guarda_roupas_de_bolso/widgets/custom_icon_button.dart';
import 'package:guarda_roupas_de_bolso/widgets/h_space.dart';

class LocationCard extends StatefulWidget {
  final String title;
  final TimeOfDay? time;
  final List<TaskCategory>? categories;
  final bool isExpanded;
  final Function(Category category, String key) onTap;
  final Function(String key) onDelete;

  const LocationCard({
    required this.title,
    required this.onTap,
    required this.onDelete,
    this.isExpanded = true,
    this.categories,
    this.time,
    super.key,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  late bool isCardExpanded;
  @override
  void initState() {
    isCardExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardTitle = widget.title;
    final cardTime = widget.time;
    final cardCategories = widget.categories;
    final onTapFunction = widget.onTap;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: cardCategories != null &&
                  cardCategories.every(
                    (element) => element.isDone,
                  )
              ? Colors.green
              : Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF002E4E),
                    borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(20.0),
                      bottom: isCardExpanded
                          ? Radius.zero
                          : const Radius.circular(
                              20.0,
                            ),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const HSpace(16.0),
                      IconButton(
                        onPressed: () => widget.onDelete(widget.title),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 36.0,
                        ),
                      ),
                      const HSpace(16.0),
                      if (cardTime != null) ...[
                        Text(
                          cardTime.format(context),
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (cardCategories != null &&
                          cardCategories.every(
                            (element) => element.isDone,
                          )) ...[
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.green,
                          child: Icon(
                            size: 18,
                            weight: 50,
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      ],
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCardExpanded = !isCardExpanded;
                          });
                        },
                        icon: Icon(
                          !isCardExpanded
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Colors.white,
                          size: 36.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (isCardExpanded && cardCategories != null) ...[
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(214, 253, 197, 11),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20.0),
                      ),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardCategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) => CustomIconButton(
                        icon: cardCategories[index].icon,
                        isDone: cardCategories[index].isDone,
                        onPress: () => onTapFunction(
                          cardCategories[index].category,
                          cardTitle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
