import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:optex_app/presentation/filter/cubit/filter_cubit.dart';
import 'package:optex_app/presentation/filter/widgets/custom_chip.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
 

  // Text controllers for price range text fields
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();



  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit(),
      child: Builder(
        builder: (context) {
          final filterState = context.watch<FilterCubit>().state;
          _minPriceController.text = filterState.minPrice.toString();
          _maxPriceController.text = filterState.maxPrice.toString();

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text('فلترة'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<FilterCubit>().resetFilters();
                    },
                    child: Text(
                      'رجوع للافتراضي',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Section
                      Text('الفئة', style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.real_estate_agent_rounded ,color: Colors.orange, ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: 'اختر الفئة',
                          border: OutlineInputBorder(),
                        ),
                        value: filterState.selectedCategory, // Use selectedCategory here
                        onChanged: (value) {
                          context.read<FilterCubit>().updateCategory(value);
                        },
                        items: ['عقارات', 'سيارات', 'إلكترونيات']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                      ),

                      const SizedBox(height: 20),

               
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ListTile(
                          title: const Text('اختر الموقع'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Location selection logic
                          },
                        ),
                      ),
                     

                      const SizedBox(height: 20),

                      // Main Sections Section
                      Text(
                        'الاقساط الشهريه',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                        const SizedBox(height: 20),
                      
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                

                      const SizedBox(height: 20),

                      // Type Section - Replaced SingleChildScrollView with Wrap
                      Text(
                        'النوع',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          CustomChip(
                            label: 'الكل',
                            isActive: filterState.selectedType == 'الكل',
                            onTap: () {
                              context.read<FilterCubit>().updateType('الكل');
                            },
                          ),
                          CustomChip(
                            label: 'توين هاوس',
                            isActive: filterState.selectedType == 'توين هاوس',
                            onTap: () {
                              context.read<FilterCubit>().updateType('توين هاوس');
                            },
                          ),
                          CustomChip(
                            label: 'فيلا منفصلة',
                            isActive: filterState.selectedType == 'فيلا منفصلة',
                            onTap: () {
                              context.read<FilterCubit>().updateType('فيلا منفصلة');
                            },
                          ),
                          CustomChip(
                            label: 'تاون هاوس',
                            isActive: filterState.selectedType == 'تاون هاوس',
                            onTap: () {
                              context.read<FilterCubit>().updateType('تاون هاوس');
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Number of Rooms Section - Replaced Row with Wrap
                      Text(
                        'عدد الغرف',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                        const SizedBox(height: 20),
                     
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          CustomChip(
                            label: 'الكل',
                            isActive: filterState.selectedRooms == 'الكل',
                            onTap: () {
                              context.read<FilterCubit>().updateRooms('الكل');
                            },
                          ),
                          CustomChip(
                            label: 'غرفتين',
                            isActive: filterState.selectedRooms == 'غرفتين',
                            onTap: () {
                              context.read<FilterCubit>().updateRooms('غرفتين');
                            },
                          ),
                          CustomChip(
                            label: '3 غرف',
                            isActive: filterState.selectedRooms == '3 غرف',
                            onTap: () {
                              context.read<FilterCubit>().updateRooms('3 غرف');
                            },
                          ),
                          CustomChip(
                            label: '4 غرف',
                            isActive: filterState.selectedRooms == '4 غرف',
                            onTap: () {
                              context.read<FilterCubit>().updateRooms('4 غرف');
                            },
                          ),
                          CustomChip(
                            label: '5 غرف+',
                            isActive: filterState.selectedRooms == '5 غرف+',
                            onTap: () {
                              context.read<FilterCubit>().updateRooms('5 غرف+');
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Price Section - Replaced with TextFields
                      Text(
                        'السعر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                       const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _minPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'الحد الأدنى',
                                hintText: '0',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixText: 'جنييه',
                              ),
                              onChanged: (value) {
                                context.read<FilterCubit>().updateMinPrice(int.tryParse(value) ?? 0);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _maxPriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'الحد الأقصى',
                                hintText: '10000',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixText: 'جنييه',
                              ),
                              onChanged: (value) {
                                context.read<FilterCubit>().updateMaxPrice(int.tryParse(value) ?? 10000);
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Payment Method Section - Replaced Row with Wrap
                      Text(
                        'طريقة الدفع',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                        const SizedBox(height: 20),
                  
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          CustomChip(
                            label: 'أي',
                            isActive: filterState.paymentMethod == 'any',
                            onTap: () {
                              context.read<FilterCubit>().updatePaymentMethod('any');
                            },
                          ),
                          CustomChip(
                            label: 'تقسيط',
                            isActive: filterState.paymentMethod == 'installment',
                            onTap: () {
                              context.read<FilterCubit>().updatePaymentMethod('installment');
                            },
                          ),
                          CustomChip(
                            label: 'كاش',
                            isActive: filterState.paymentMethod == 'cash',
                            onTap: () {
                              context.read<FilterCubit>().updatePaymentMethod('cash');
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Item Condition Section - Replaced Row with Wrap
                      Text(
                        'حالة العقار',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                        const SizedBox(height: 20),
             
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          CustomChip(
                            label: 'أي',
                            isActive: filterState.selectedCondition == 'any_condition',
                            onTap: () {
                              context.read<FilterCubit>().updateCondition('any_condition');
                            },
                          ),
                          CustomChip(
                            label: 'قيد الإنشاء',
                            isActive: filterState.selectedCondition == 'under_construction',
                            onTap: () {
                              context.read<FilterCubit>().updateCondition('under_construction');
                            },
                          ),
                          CustomChip(
                            label: 'جاهز',
                            isActive: filterState.selectedCondition == 'ready',
                            onTap: () {
                              context.read<FilterCubit>().updateCondition('ready');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // Apply filters logic
                    // You can access price values using:
                    // int.tryParse(_minPriceController.text) ?? 0
                    // int.tryParse(_maxPriceController.text) ?? 10000
                  },
                  child: Text('شاهد +10,000 نتائج'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
