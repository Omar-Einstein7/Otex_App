import 'package:flutter/material.dart';

import 'package:optex_app/l10n/app_localizations.dart';
import 'package:optex_app/presentation/filter/widgets/custom_chip.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedCategory;
  String? selectedLocation;
  String? selectedMainSection;
  String selectedType = 'الكل'; // Initialize with a default value
  String selectedRooms = 'الكل'; // Initialize with a default value
  String paymentMethod = 'any'; // Initialize with a default value
  String selectedCondition = 'any_condition'; // Initialize with a default value

  // Text controllers for price range text fields
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with default values
    _minPriceController.text = '0';
    _maxPriceController.text = '10000';
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

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
                // Reset filters logic
                setState(() {
                  selectedCategory = null;
                  selectedLocation = null;
                  selectedMainSection = null;
                  selectedType = 'الكل';
                  selectedRooms = 'الكل';
                  paymentMethod = 'any';
                  selectedCondition = 'any_condition';
                  _minPriceController.text = '0';
                  _maxPriceController.text = '10000';
                });
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
           
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'اختر الفئة',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedCategory, // Use selectedCategory here
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
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
                      isActive: selectedType == 'الكل',
                      onTap: () {
                        setState(() {
                          selectedType = 'الكل';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'توين هاوس',
                      isActive: selectedType == 'توين هاوس',
                      onTap: () {
                        setState(() {
                          selectedType = 'توين هاوس';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'فيلا منفصلة',
                      isActive: selectedType == 'فيلا منفصلة',
                      onTap: () {
                        setState(() {
                          selectedType = 'فيلا منفصلة';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'تاون هاوس',
                      isActive: selectedType == 'تاون هاوس',
                      onTap: () {
                        setState(() {
                          selectedType = 'تاون هاوس';
                        });
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
                      isActive: selectedRooms == 'الكل',
                      onTap: () {
                        setState(() {
                          selectedRooms = 'الكل';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'غرفتين',
                      isActive: selectedRooms == 'غرفتين',
                      onTap: () {
                        setState(() {
                          selectedRooms = 'غرفتين';
                        });
                      },
                    ),
                    CustomChip(
                      label: '3 غرف',
                      isActive: selectedRooms == '3 غرف',
                      onTap: () {
                        setState(() {
                          selectedRooms = '3 غرف';
                        });
                      },
                    ),
                    CustomChip(
                      label: '4 غرف',
                      isActive: selectedRooms == '4 غرف',
                      onTap: () {
                        setState(() {
                          selectedRooms = '4 غرف';
                        });
                      },
                    ),
                    CustomChip(
                      label: '5 غرف+',
                      isActive: selectedRooms == '5 غرف+',
                      onTap: () {
                        setState(() {
                          selectedRooms = '5 غرف+';
                        });
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
                          // Validate and update state if needed
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
                          // Validate and update state if needed
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
                      isActive: paymentMethod == 'any',
                      onTap: () {
                        setState(() {
                          paymentMethod = 'any';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'تقسيط',
                      isActive: paymentMethod == 'installment',
                      onTap: () {
                        setState(() {
                          paymentMethod = 'installment';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'كاش',
                      isActive: paymentMethod == 'cash',
                      onTap: () {
                        setState(() {
                          paymentMethod = 'cash';
                        });
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
                      isActive: selectedCondition == 'any_condition',
                      onTap: () {
                        setState(() {
                          selectedCondition = 'any_condition';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'قيد الإنشاء',
                      isActive: selectedCondition == 'under_construction',
                      onTap: () {
                        setState(() {
                          selectedCondition = 'under_construction';
                        });
                      },
                    ),
                    CustomChip(
                      label: 'جاهز',
                      isActive: selectedCondition == 'ready',
                      onTap: () {
                        setState(() {
                          selectedCondition = 'ready';
                        });
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

  Widget _buildRoomOption(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.blue)),
    );
  }
}
