part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {
  final String selectedCategory;

  CategoryInitial({this.selectedCategory = 'All Offers'});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryInitial &&
      other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode => selectedCategory.hashCode;
}