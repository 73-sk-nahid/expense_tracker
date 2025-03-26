// import 'package:expense_tracker/app/app_colors.dart';
// import 'package:flutter/material.dart';
//
// class SetAppPin extends StatefulWidget {
//   const SetAppPin({super.key, required this.title, this.pin});
//
//   final String title;
//   final String? pin;
//
//   static const String name = '/set-app-pin';
//
//   @override
//   State<SetAppPin> createState() => _SetAppPinState();
// }
//
// class _SetAppPinState extends State<SetAppPin> {
//   String pin = '';
//   final int pinLength = 4;
//
//   void onKeyPress(String value) {
//     if (value == "delete") {
//       if (pin.isNotEmpty) {
//         setState(() {
//           pin = pin.substring(0, pin.length - 1);
//         });
//       }
//     }
//       else if (value == "enter") {
//         if (pin.length == pinLength) {
//           // Navigate to next screen (Replace with your route)
//           if(widget.title == 'Let\'s setup your PIN') {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => SetAppPin(title: "Ok. Retype your PIN again.", pin: pin,),
//               ),
//             );
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("PIN Entered: $pin")),
//             );
//           }
//           if (widget.title == "Ok. Retype your PIN again." && widget.pin == pin) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("✅ PIN Matched! Re-Entered: $pin")),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("❌ PINs do not match! Please try again.")),
//             );
//           }
//
//         }
//       }
//      else {
//       if (pin.length < pinLength) {
//         setState(() {
//           pin += value;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.themeColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const Spacer(),
//
//             // Title Text
//              Text(
//               widget.title,
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             const SizedBox(height: 20),
//
//             // PIN Circles
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 pinLength,
//                 (index) => Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: CircleAvatar(
//                     radius: 10,
//                     backgroundColor: index < pin.length
//                         ? Colors.white
//                         : Colors.white.withOpacity(0.5),
//                   ),
//                 ),
//               ),
//             ),
//
//             const Spacer(), // Pushes keypad to bottom
//
//             // Number Pad
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//               child: Column(
//                 children: [
//                   for (var row in [
//                     ["1", "2", "3"],
//                     ["4", "5", "6"],
//                     ["7", "8", "9"],
//                     ["delete", "0", "enter"]
//                   ])
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: row.map((key) {
//                         return GestureDetector(
//                           onTap: ()=> onKeyPress(key),
//                           child: Container(
//                             width: 80,
//                             height: 80,
//                             alignment: Alignment.center,
//                             child: key == "delete"
//                                 ? const Icon(Icons.backspace,
//                                     color: Colors.white, size: 30)
//                                 : key == "enter"
//                                     ? const Icon(Icons.arrow_forward,
//                                         color: Colors.white, size: 30)
//                                     : Text(
//                                         key,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 35,
//                                         ),
//                                       ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 40), // Bottom padding for better spacing
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/intro_screens/setup_account_screen.dart';
import 'package:flutter/material.dart';

class SetAppPin extends StatefulWidget {
  const SetAppPin({super.key, required this.title, this.pin});

  final String title;
  final String? pin;

  static const String name = '/set-app-pin';

  @override
  State<SetAppPin> createState() => _SetAppPinState();
}

class _SetAppPinState extends State<SetAppPin> {
  String pin = '';
  final int pinLength = 4;

  void onKeyPress(String value) {
    if (value == "delete") {
      if (pin.isNotEmpty) {
        setState(() {
          pin = pin.substring(0, pin.length - 1);
        });
      }
    } else if (value == "enter") {
      if (pin.length == pinLength) {
        if (widget.title == "Let's setup your PIN") {
          // ✅ Show message first, then navigate
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("PIN Entered: $pin")),
          );

          // ✅ Navigate to confirmation screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SetAppPin(
                title: "Ok. Retype your PIN again.",
                pin: pin,
              ),
            ),
          );
        } else if (widget.title == "Ok. Retype your PIN again." && widget.pin == pin) {
          // ✅ PIN Matched
          Navigator.pushNamed(context, SetupAccountScreen.name);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("✅ PIN Matched!")),
          );

          // ✅ Close the PIN setup screen
          //Navigator.pop(context);
        } else {
          // ❌ PIN does not match
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("❌ PINs do not match! Please try again.")),
          );

          // Reset PIN entry
          setState(() {
            pin = "";
          });
        }
      }
    } else {
      if (pin.length < pinLength) {
        setState(() {
          pin += value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // Title Text
            Text(
              widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),

            // PIN Circles
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pinLength,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: index < pin.length
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Number Pad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  for (var row in [
                    ["1", "2", "3"],
                    ["4", "5", "6"],
                    ["7", "8", "9"],
                    ["delete", "0", "enter"]
                  ])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: row.map((key) {
                        return GestureDetector(
                          onTap: () => onKeyPress(key),
                          child: Container(
                            width: 80,
                            height: 80,
                            alignment: Alignment.center,
                            child: key == "delete"
                                ? const Icon(Icons.backspace, color: Colors.white, size: 30)
                                : key == "enter"
                                ? const Icon(Icons.arrow_forward, color: Colors.white, size: 30)
                                : Text(
                              key,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 40), // Bottom padding
          ],
        ),
      ),
    );
  }
}