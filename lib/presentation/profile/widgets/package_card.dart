import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optex_app/presentation/profile/bloc/plan_cubit.dart';

import 'package:optex_app/presentation/profile/widgets/rps_custom_painter.dart';

class PackageCard extends StatelessWidget {
  final int index;
  final String title;
  final String price;
  final bool isSelected;
  final String? badge;
  final Color badgeColor;
  final Color badgeTextColor;
  final List<String> features;
  final bool showViewsMultiplier;
  final List<int> num;

  const PackageCard({
    Key? key,
    required this.index,
    required this.title,
    required this.price,
    required this.isSelected,
    this.badge,
    this.badgeColor = Colors.red,
    this.badgeTextColor = const Color(0xffFF4144),
    required this.features,
    this.showViewsMultiplier = false,
     required this.num,
  }) : super(key: key);

  final List<String> _featureIcons = const [
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
                              context.read<PlanCubit>().selectPlan(index);
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
                      '${price} ج.م',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: features
                          .asMap()
                          .entries
                          .map(
                            (entry) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    _featureIcons[entry.key %
                                        _featureIcons.length],
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    entry.value,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(width: 10),
                    if (showViewsMultiplier)
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(58, 129, 63, 0.05),

                                border: Border(
                                  top: BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  left: BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                  right: BorderSide(
                                    color: Colors.green,
                                    width: 2,
                                  ),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child:  Text(
                                num[index].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "ضعف عدد\nالمشاهدات",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
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
                  CustomPaint(
                    size: const Size(150, 30),
                    painter: RPSCustomPainter(),
                  ),
                  Center(
                    child: Text(
                      badge!,
                      style: TextStyle(
                        color: badgeTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
