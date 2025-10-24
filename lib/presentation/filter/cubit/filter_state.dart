part of 'filter_cubit.dart';

class FilterState {
  final String? selectedCategory;
  final String? selectedLocation;
  final String? selectedMainSection;
  final String selectedType;
  final String selectedRooms;
  final String paymentMethod;
  final String selectedCondition;
  final int minPrice;
  final int maxPrice;

  const FilterState({
    this.selectedCategory,
    this.selectedLocation,
    this.selectedMainSection,
    this.selectedType = 'الكل',
    this.selectedRooms = 'الكل',
    this.paymentMethod = 'any',
    this.selectedCondition = 'any_condition',
    this.minPrice = 0,
    this.maxPrice = 10000,
  });

}