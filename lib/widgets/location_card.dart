import 'package:flutter/material.dart';
import 'package:guarda_roupas_de_bolso/assets/icons/pocket_icons_icons.dart';
import 'package:guarda_roupas_de_bolso/assets/icons/pocket_wardrobe_icons.dart';

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
    final cardTime = time;

    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
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
            ],
          ),
          Expanded(
            child: Row(
              children: [
                if (cardTime != null) ...[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00406C),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      cardTime.format(context),
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(228, 238, 215, 7),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 75.0,
                              PocketIcons.shirt,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 75.0,
                              PocketIcons.shorts,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 75.0,
                              PocketIcons.shoe,
                            ),
                          ),
                          IconButton(
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            icon: const Icon(
                              size: 75.0,
                              PocketIcons.socks,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 75.0,
                              PocketIcons.underwear,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
