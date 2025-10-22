import 'package:optex_app/core/config/database/app_database.dart';
import 'package:dartz/dartz.dart';

class Package {
  final int id;
  final String name;
  final String description;
  final double price;

  Package({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory Package.fromMap(Map<String, dynamic> map) {
    return Package(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }
}

abstract class PackageDao {
  Future<List<Package>> getAllPackages();
  Future<Package?> getPackageById(int id);
  Future<void> insertPackage(Package package);
  Future<void> updatePackage(Package package);
  Future<void> deletePackage(int id);
}

class PackageDaoImpl implements PackageDao {
  final AppDatabase _appDatabase;

  PackageDaoImpl(this._appDatabase);

  @override
  Future<List<Package>> getAllPackages() async {
    final db = await _appDatabase.database;
    final result = await db.query('packages');
    return result.map((e) => Package.fromMap(e)).toList();
  }

  @override
  Future<Package?> getPackageById(int id) async {
    final db = await _appDatabase.database;
    final result = await db.query('packages', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Package.fromMap(result.first);
    } else {
      return null;
    }
  }

  @override
  Future<void> insertPackage(Package package) async {
    final db = await _appDatabase.database;
    await db.insert('packages', package.toMap());
  }

  @override
  Future<void> updatePackage(Package package) async {
    final db = await _appDatabase.database;
    await db.update('packages', package.toMap(), where: 'id = ?', whereArgs: [package.id]);
  }

  @override
  Future<void> deletePackage(int id) async {
    final db = await _appDatabase.database;
    await db.delete('packages', where: 'id = ?', whereArgs: [id]);
  }
}