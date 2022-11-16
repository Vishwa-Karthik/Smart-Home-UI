import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_room_ui/utils/smart_device_box.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Grid View Data
  List mySmartDevices = [
    ["Smart Light", "assets/icons/bulb.png", true],
    ["Air Conditioner", "assets/icons/ac.png", false],
    ["Television", "assets/icons/tv.png", true],
    ["Fan", "assets/icons/fan.png", true],
  ];

  //* Swtich Use Function
  void powerSwitchChanged(int index, bool value) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Menu Icon
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 30,
                    color: KPrimaryColor,
                  ),

                  //* Person Icon
                  const Icon(
                    Icons.person,
                    color: KPrimaryColor,
                    size: 35,
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              //* TExt title
              Text(
                "Welcome Home,",
                style: GoogleFonts.aBeeZee(
                    color: KPrimaryColor, fontSize: 25, letterSpacing: 2),
              ),
              Text(
                "Vishwa Karthik",
                style: GoogleFonts.aBeeZee(
                    color: KSecondaryColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 35),
              ),

              const Divider(
                color: KPrimaryColor,
                thickness: 2,
              ),

              const SizedBox(
                height: 25,
              ),

              //* Smart Devices and Grid

              //? Title
              Text(
                "SMART DEVICES",
                style: GoogleFonts.aBeeZee(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),

              //? Grid View and its builder

              Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevices.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        deviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerStatus: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(index, value),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
