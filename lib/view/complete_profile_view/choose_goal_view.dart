// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:be_fit/common/color_extension.dart';
// import 'package:be_fit/common/text_style.dart';

// class ChooseGoalView extends StatefulWidget {
//   const ChooseGoalView({super.key});

//   @override
//   ChooseGoalViewState createState() => ChooseGoalViewState();
// }

// class ChooseGoalViewState extends State<ChooseGoalView> {
//   // List of motives
//   final List<String> motives = [
//     'Lose Weight',
//     'Get Fit',
//     'Build Muscle',
//     'Improve Flexibility',
//     'Boost Stamina',
//   ];

//   // Variable to hold the selected motive
//   String? selectedMotive;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.neutralColorSoftWhite,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             //! Heading
//             Text(
//               'Choose Your Goal',
//               style: AppTextStyles.heading2,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),

//             //! Horizontal Scrollable List of Motives
//             SizedBox(
//               height: 120.h, // You can adjust the height of the card
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: motives.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedMotive = motives[index];
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.w),
//                       decoration: BoxDecoration(
//                         color: selectedMotive == motives[index]
//                             ? AppColors.primaryColorOrange
//                             : Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                             blurRadius: 6,
//                           ),
//                         ],
//                       ),
//                       width: 200.w,
//                       child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(vertical: 12.h),
//                           child: Text(
//                             motives[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontFamily: 'Lexend',
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w600,
//                               color: selectedMotive == motives[index]
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
