// import 'package:flutter/material.dart';

// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());

//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         height: 80,
//         elevation: 0,
//         selectedIndex: controller.selectedIndex.value,
//         onDestinationSelected: (index) =>
//             controller.selectedIndex.value = index,
//         destinations: const [
//           NavigationDestination(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           NavigationDestination(
//             icon: Icon(Icons.switch_account),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     Container(
//       color: Colors.green,
//     ),
//   ];
// }
