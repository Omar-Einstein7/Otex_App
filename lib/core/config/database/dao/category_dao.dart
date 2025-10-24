
import 'package:optex_app/core/config/database/app_database.dart';

class Category {
  final int id;
  final String name;
  final String? description;

  Category({
    required this.id,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }
}

abstract class CategoryDao {
  Future<List<Category>> getAllCategories();
  Future<Category?> getCategoryById(int id);
  Future<void> insertCategory(Category category);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(int id);
}

class CategoryDaoImpl implements CategoryDao {
  final AppDatabase _appDatabase;

  CategoryDaoImpl(this._appDatabase);

  @override
  Future<List<Category>> getAllCategories() async {
    final db = await _appDatabase.database;
    final result = await db.query('categories');
    return result.map((e) => Category.fromMap(e)).toList();
  }

  @override
  Future<Category?> getCategoryById(int id) async {
    final db = await _appDatabase.database;
    final result = await db.query('categories', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Category.fromMap(result.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> insertCategory(Category category) async {
    final db = await _appDatabase.database;
    await db.insert('categories', category.toMap());
  }

  @override
  Future<void> updateCategory(Category category) async {
    final db = await _appDatabase.database;
    await db.update('categories', category.toMap(), where: 'id = ?', whereArgs: [category.id]);
  }

  @override
  Future<void> deleteCategory(int id) async {
    final db = await _appDatabase.database;
    await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}