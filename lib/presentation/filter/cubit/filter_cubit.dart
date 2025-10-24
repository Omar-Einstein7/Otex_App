import 'package:bloc/bloc.dart';


part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState());

  void updateCategory(String? category) {
    emit(FilterState(
      selectedCategory: category,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateLocation(String? location) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: location,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateMainSection(String? mainSection) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: mainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateType(String type) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: type,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateRooms(String rooms) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: rooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updatePaymentMethod(String method) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: method,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateCondition(String condition) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: condition,
      minPrice: state.minPrice,
      maxPrice: state.maxPrice,
    ));
  }

  void updateMinPrice(int price) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: price,
      maxPrice: state.maxPrice,
    ));
  }

  void updateMaxPrice(int price) {
    emit(FilterState(
      selectedCategory: state.selectedCategory,
      selectedLocation: state.selectedLocation,
      selectedMainSection: state.selectedMainSection,
      selectedType: state.selectedType,
      selectedRooms: state.selectedRooms,
      paymentMethod: state.paymentMethod,
      selectedCondition: state.selectedCondition,
      minPrice: state.minPrice,
      maxPrice: price,
    ));
  }

  void resetFilters() {
    emit(const FilterState());
  }
}