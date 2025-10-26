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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Section
                      ListTile(
                        leading: Icon(Icons.real_estate_agent_rounded, color: Color.fromRGBO(249, 91, 28, 1)),
                        title: Text(filterState.selectedCategory ?? 'الفئة', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('اختر الفئة التي تريد البحث عنها'),
                        trailing: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context, // Pass the context that has access to FilterCubit
                              builder: (BuildContext dialogContext) { // Use a new context for the dialog
                                return BlocProvider.value(
                                  value: context.read<FilterCubit>(), // Provide the existing cubit to the dialog's subtree
                                  child: AlertDialog(
                                    title: Text('اختر الفئة'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          ...['شقة', 'فيلا', 'مكتب', 'محل', 'أرض'].map((String category) {
                                            return Builder(
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    context.read<FilterCubit>().updateCategory(category);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(category),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text('تغيير'),
                        ),
                      ),
                      const SizedBox(height: 20),
                  
                                 
                      Container(
                        decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                          
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: const Text('اختر الموقع'),
                          subtitle: Text(filterState.selectedLocation ?? 'اختر الموقع'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return BlocProvider.value(
                                  value: context.read<FilterCubit>(),
                                  child: AlertDialog(
                                    title: Text('اختر الموقع'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          ...['مكة المكرمة', 'المنطقة الشرقية', 'المنطقة الشرقية', 'المنطقة الشرقية', 'المنطقة الشرقية'].map((String location) {
                                            return Builder(
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    context.read<FilterCubit>().updateLocation(location);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(location),
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          
                            
                            // Location selection logic
                          },
                        ),
                      ),
                     
                  
                      const SizedBox(height: 20),
                  
                      // Main Sections Section
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'الاقساط الشهريه',
                           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                      ),
                        const SizedBox(height: 20),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),

                        child: Row(
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
                      ),
                                  
                  
                      const SizedBox(height: 20),
                  
                      // Type Section - Replaced SingleChildScrollView with Wrap
                      Text(
                        'النوع',
                         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                                
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              
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
                                
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                
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
