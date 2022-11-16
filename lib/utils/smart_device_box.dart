import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_room_ui/constants.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerStatus;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.powerStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerStatus ? Colors.grey.shade400 : Colors.black38,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Column(children: [
            //* Icon
            Image.asset(
              iconPath,
              color: KPrimaryColor,
              height: 120,
            ),

            const SizedBox(
              height: 20,
            ),

            //* Smart Device name
            Text(
              deviceName,
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  color: powerStatus ? Colors.black : Colors.white),
            ),

            const SizedBox(
              height: 9,
            ),

            //* Switches
            CupertinoSwitch(
              value: powerStatus,
              onChanged: onChanged,
              activeColor: KPrimaryColor,
              trackColor: KPrimaryColor,
              thumbColor: Colors.grey,
            )
          ]),
        ),
      ),
    );
  }
}
