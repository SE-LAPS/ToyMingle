import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SwapDatabase {
  static final SwapDatabase instance = SwapDatabase._init();
  static Database? _database;

  SwapDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('swaps.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE swaps(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      toyName TEXT NOT NULL,
      condition TEXT NOT NULL,
      category TEXT NOT NULL,
      description TEXT NOT NULL,
      height TEXT,
      width TEXT,
      weight TEXT,
      ageRange TEXT NOT NULL,
      imagePath TEXT
    )
    ''');
  }

  Future<int> createSwapItem(Map<String, dynamic> swapItem) async {
    final db = await instance.database;
    
    // Handle the image file separately
    String? imagePath;
    if (swapItem['imagePath'] != null) {
      File imageFile = swapItem['imagePath'];
      imagePath = imageFile.path;
    }
    
    // Create a copy of the swapItem with the image path as string
    final itemToInsert = {
      'toyName': swapItem['toyName'],
      'condition': swapItem['condition'],
      'category': swapItem['category'],
      'description': swapItem['description'],
      'height': swapItem['height'],
      'width': swapItem['width'],
      'weight': swapItem['weight'],
      'ageRange': swapItem['ageRange'],
      'imagePath': imagePath,
    };
    
    return await db.insert('swaps', itemToInsert);
  }

  Future<List<Map<String, dynamic>>> readAllSwapItems() async {
    final db = await instance.database;
    final result = await db.query('swaps');
    
    return result.map((item) {
      // Convert image path back to File object
      Map<String, dynamic> swapItem = Map.from(item);
      if (swapItem['imagePath'] != null) {
        swapItem['imagePath'] = File(swapItem['imagePath']);
      }
      return swapItem;
    }).toList();
  }

  Future<int> updateSwapItem(int id, Map<String, dynamic> swapItem) async {
    final db = await instance.database;
    
    // Handle the image file separately
    String? imagePath;
    if (swapItem['imagePath'] != null) {
      File imageFile = swapItem['imagePath'];
      imagePath = imageFile.path;
    }
    
    // Create a copy of the swapItem with the image path as string
    final itemToUpdate = {
      'toyName': swapItem['toyName'],
      'condition': swapItem['condition'],
      'category': swapItem['category'],
      'description': swapItem['description'],
      'height': swapItem['height'],
      'width': swapItem['width'],
      'weight': swapItem['weight'],
      'ageRange': swapItem['ageRange'],
      'imagePath': imagePath,
    };
    
    return await db.update(
      'swaps',
      itemToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteSwapItem(int id) async {
    final db = await instance.database;
    return await db.delete(
      'swaps',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}