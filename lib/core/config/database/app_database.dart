import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 6, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Drop all tables to recreate them with new schema and default data
      await db.execute('DROP TABLE IF EXISTS products');
      await db.execute('DROP TABLE IF EXISTS categories');
      await db.execute('DROP TABLE IF EXISTS packages');
      await _createDB(db, newVersion);
    }
  }

  Future<void> _createDB(Database db, int version) async {
    // Categories table
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT
      )
    ''');

    // Insert a default category
    await db.insert('categories', {'name': 'Default Category', 'description': 'A default category for products'});

    // Products table
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        category_id INTEGER,
        image_url TEXT,
        FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
      )
    ''');

    // Insert 8 default products
    final defaultProducts = [
      {'name': 'جاكيت من الصوف مناسب', 'price': 9.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture.png'},
      {'name': 'Default Product 2', 'price': 12.49, 'category_id': 1, 'image_url': 'lib/assets/images/Picture (1).png'},
      {'name': 'Default Product 3', 'price': 7.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture (2).png'},
      {'name': 'Default Product 4', 'price': 15.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture.png'},
      {'name': 'Default Product 5', 'price': 5.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture (1).png'},
      {'name': 'Default Product 6', 'price': 19.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture.png'},
      {'name': 'Default Product 7', 'price': 8.49, 'category_id': 1, 'image_url': 'lib/assets/images/Picture (1).png'},
      {'name': 'Default Product 8', 'price': 11.99, 'category_id': 1, 'image_url': 'lib/assets/images/Picture.png'},
    ];
    for (final product in defaultProducts) {
      await db.insert('products', product);
    }
    
    // Packages table
    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        price REAL NOT NULL
      )
    ''');
  }
  
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
