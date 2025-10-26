import 'package:flutter/material.dart';
import 'package:optex_app/presentation/profile/widgets/package_card.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optex_app/di.dart';

import '../bloc/plan_cubit.dart';
import '../widgets/rps_custom_painter.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PlanCubit>()..loadPlans(),
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: BlocBuilder<PlanCubit, PlanState>(
          builder: (context, state) {
            if (state is PlanLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PlanError) {
              return Center(child: Text(state.message));
            } else if (state is PlanLoaded) {
              int selectedPlan = state.selectedPlanIndex;

              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 16),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        'اختر الباقات اللي تناسبك',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.cairo().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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

                  // Dynamic Plans List
                  ...state.plans.asMap().entries.map((entry) {
                    final plan = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: PackageCard(
                      
                        index: plan.id,
                        title: plan.name,
                        price: plan.price.toString(),
                        isSelected: selectedPlan == plan.id,
                        badge: plan.id == 2
                            ? 'الأكثر طلباً'
                            : plan.id == 3
                                ? 'أعلى مشاهدة'
                                : plan.id == 4 
                                ? 'أعلى مشاهدة'
                                :null,
                        badgeColor: Colors.red,
                        features: plan.features,
                        showViewsMultiplier: [2, 3, 4].contains(plan.id), num: [0, 0, 7 , 18, 24],
                      ),
                    );
                  }),

                  const SizedBox(height: 24),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'باقات مخصصة لك',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.cairo().fontFamily,
                            ),
                            
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'تواصل معنا لأختيار الباقة المناسبة لك',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              fontFamily: GoogleFonts.cairo().fontFamily,
                            ),
                   
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'فريق المبيعات',
                            style: TextStyle(
                              fontSize: 16,

                              color: Colors.blue,
                            
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.cairo().fontFamily,
                            ),
                       
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
