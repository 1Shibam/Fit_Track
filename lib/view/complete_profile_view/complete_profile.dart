import 'package:be_fit/common%20widgets/lottie_loading_animation.dart';
import 'package:be_fit/common/color_extension.dart';
import 'package:be_fit/common/text_style.dart';
import 'package:be_fit/preferences/profile_creation_preference.dart';
import 'package:be_fit/view/auth/auth_widgets/build_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  CompleteProfileViewState createState() => CompleteProfileViewState();
}

class CompleteProfileViewState extends State<CompleteProfileView> {
  String? selectedGender;
  DateTime? selectedDate;
  String weightUnit = "kg";
  String heightUnit = "cm";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColorSoftWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              //! simple animation
              Lottie.asset(
                'assets/animations/completeProfile.json',
                height: 240.h,
                width: 240.w,
              ),
              //! headers
              Text(
                'Let\'s complete your profile',
                style: AppTextStyles.heading3,
                textAlign: TextAlign.center,
              ),

              //! Gender Selection
              _buildCard(
                title: "Gender",
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(
                        'Gender',
                        style: AppTextStyles.body2,
                      )),
                  value: selectedGender,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: ["Male", "Female", "Other"]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                ),
              ),

              //! Date of Birth Picker
              _buildCard(
                title: "Date of Birth",
                child: ListTile(
                  title: Text(selectedDate == null
                      ? "Select Date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectDate(context),
                ),
              ),

              //! Weight Input (kg)
              _buildCard(
                title: "Weight",
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.fitness_center,
                      color: AppColors.primaryColorOrange,
                    ),
                    border: const OutlineInputBorder(),
                    hintText: "Enter weight (kg)",
                  ),
                ),
              ),

              //! Height Input (cm)
              _buildCard(
                title: "Height",
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.height,
                      color: AppColors.primaryColorOrange,
                    ),
                    border: const OutlineInputBorder(),
                    hintText: "Enter height (cm)",
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const LottieLoadingAnimation(
                          opacity: 0.4,
                          height: 100,
                          width: 100,
                        );
                      },
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      if (context.mounted) {
                        setProfileSetUpPreference(true);
                        Navigator.pop(context);
                        context.go('/home');
                      }
                    });
                  },
                  child: const BuildPrimaryButton(text: 'Let\'s Go')),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppTextStyles.subtitle1), // Changed to subtitle1 style
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
