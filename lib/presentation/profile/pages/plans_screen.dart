import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/rps_custom_painter.dart'; // إضافة هذا السطر

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  int _selectedPlan = 1; // باقة أكسترا مختارة افتراضياً

  // Define a list of icons to cycle through for each feature
  final List<String> _featureIcons = [
    "lib/assets/icons/acute1.svg",
    "lib/assets/icons/rocket2.svg",
    "lib/assets/icons/keep3.svg",
    "lib/assets/icons/globe4.svg",
    "lib/assets/icons/workspace_premium5.svg",
   "lib/assets/icons/keep3.svg",
    "lib/assets/icons/keep3.svg",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الباقات',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          // العنوان الرئيسي
          Text(
            'اختر الباقات اللي تناسبك',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.cairo().fontFamily,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          // النص التوضيحي
          Text(
            'اختر من الباقات التالية اللي تناسب احتياجاتك',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontFamily: GoogleFonts.cairo().fontFamily,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 24),

          // باقة أساسية
          _buildPackageCard(
            index: 0,
            title: 'أساسية',
            price: '23,000',
            isSelected: _selectedPlan == 0,
            badge: null,
            features: ['عضوية إعلان 30 يوم'],
          ),
          const SizedBox(height: 16),

          // باقة أكسترا
          _buildPackageCard(
            index: 1,
            title: 'أكسترا',
            price: '23,000',
            isSelected: _selectedPlan == 1,
            badge: null,
            features: [
              'عضوية إعلان 30 يوم',
              'تثبيت في أول القائمة لمدة 7 أيام',
              'تثبيت في الإعلانات المميزة (أسبوع)',
            ],
          ),
          const SizedBox(height: 16),

          // باقة بلص
          _buildPackageCard(
            index: 2,
            title: 'بلص',
            price: '23,000',
            isSelected: _selectedPlan == 2,
            badge: 'الأكثر طلباً',
            badgeColor: Colors.red,
            badgeTextColor: Colors.white,
            features: [
              'عضوية إعلان 30 يوم',
              'تثبيت في أول القائمة لمدة 7 أيام',
              'ظهور في محافظات مصر',
              'إشعار لجميع المستخدمين',
              'تثبيت في الإعلانات المميزة (أسبوع)',
            ],
          ),
          const SizedBox(height: 16),

          // باقة سوبر
          _buildPackageCard(
            index: 3,
            title: 'سوبر',
            price: '23,000',
            isSelected: _selectedPlan == 3,
            badge: 'أعلى مشاهدة',
            badgeColor: Colors.red,
            badgeTextColor: Colors.white,
            features: [
              'عضوية إعلان 30 يوم',
              'تثبيت في أول القائمة لمدة 7 أيام',
              'ظهور في محافظات مصر (أسبوع)',
              'إشعار لجميع المستخدمين',
              'تثبيت في الإعلانات المميزة',
              'تثبيت في الإعلانات المميزة',
                   'تثبيت في الإعلانات المميزة',
        
            ],
          ),
          const SizedBox(height: 24),

          // النص في نهاية الصفحة
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                'شاشة مخصصة لك سيتم عرض الباقات التي تناسبك',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontFamily: GoogleFonts.cairo().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildPackageCard({
    required int index,
    required String title,
    required String price,
    required bool isSelected,
    String? badge,
    Color badgeColor = Colors.red,
    Color badgeTextColor = const Color(0xffFF4144),

    required List<String> features,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Header with title and radio button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                _selectedPlan = index;
                              });
                            },
                            activeColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'ج.م $price',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
Divider(),
                // Features list
                ...features
                    .asMap()
                    .entries
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              _featureIcons[entry.key % _featureIcons.length],
                            ),
                            
                            const SizedBox(width: 8),
                            Text(
                              entry.value,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
        if (badge != null)
          Positioned(
            right: 0,
            top: -15,
            child: SizedBox(
              width: 150,
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(size: Size(150, 30), painter: RPSCustomPainter()),
                  Center(
                    child: Text(
                      badge!,
                      style: TextStyle(
                        color: Color(0xffFF4144),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Badge if exists
        // if (badge != null)
        //   Positioned(
        //     top: -8,
        //     left: 16,
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        //       decoration: BoxDecoration(
        //         color: badgeColor,
        //         borderRadius: BorderRadius.circular(16),
        //       ),
        //       child: Text(
        //         badge,
        //         style: TextStyle(
        //           color: badgeTextColor,
        //           fontSize: 12,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
