import 'package:chicken_road_tracker/models/chicken_model.dart';
import 'package:chicken_road_tracker/services/hive_service.dart';
import 'package:flutter/material.dart';

class AddChickenScreen extends StatefulWidget {
  const AddChickenScreen({super.key});

  @override
  State<AddChickenScreen> createState() => _AddChickenScreenState();
}

class _AddChickenScreenState extends State<AddChickenScreen> {
  ChickenModel chicken = ChickenModel.empty();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFB9F8CF), Color(0xFFCBFBF1), Color(0xFFDBEAFE)],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/icons/arrow_left.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add Chicken",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E2939),
                            ),
                          ),
                          Text(
                            "Add a new friend to your flock",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4A5565),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Image.asset(
                    "assets/images/chicken_banner.png",
                    width: double.maxFinite,
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFC27AFF),
                                    Color(0xFFFB64B6),
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/bird.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1E2939),
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              chicken = chicken.copyWith(name: value.trim());
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "e.g., Clucky",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff99A1AF),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9FAFB),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF51A2FF),
                                    Color(0xFF00D5BE),
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/bird.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Breed",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1E2939),
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              chicken = chicken.copyWith(breed: value.trim());
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "e.g., Rhode Island Red",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff99A1AF),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9FAFB),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFFF8904),
                                    Color(0xFFFF6467),
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/paint.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Color",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1E2939),
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              chicken = chicken.copyWith(color: value.trim());
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "e.g., Brown",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff99A1AF),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9FAFB),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF05DF72),
                                    Color(0xFF00D492),
                                  ],
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/icons/cake.png",
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Age (months)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1E2939),
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              chicken = chicken.copyWith(
                                ageInMonths: int.tryParse(value.trim()),
                              );
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "e.g., 6",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff99A1AF),
                            ),
                            filled: true,
                            fillColor: Color(0xffF9FAFB),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      if (!chicken.isFilled) return;
                      HiveService.addChicken(chicken).then((_) {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 68,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF05DF72), Color(0xFF00D492)],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Chicken",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
