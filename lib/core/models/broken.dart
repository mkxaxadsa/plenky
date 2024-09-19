import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Broken {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String category;
  @HiveField(3)
  String reason;
  @HiveField(4)
  String period;
  @HiveField(5)
  List expenses;
  @HiveField(6)
  String image;
  @HiveField(7)
  String description;
  @HiveField(8)
  bool done;

  Broken({
    required this.id,
    required this.title,
    required this.category,
    required this.reason,
    required this.period,
    required this.expenses,
    required this.image,
    required this.description,
    required this.done,
  });
}

@HiveType(typeId: 1)
class Expense {
  @HiveField(0)
  String title;
  @HiveField(1)
  int price;

  Expense({
    required this.title,
    required this.price,
  });
}

class BrokenAdapter extends TypeAdapter<Broken> {
  @override
  final typeId = 0;

  @override
  Broken read(BinaryReader reader) {
    return Broken(
      id: reader.read(),
      title: reader.read(),
      category: reader.read(),
      reason: reader.read(),
      period: reader.read(),
      expenses: reader.read(),
      image: reader.read(),
      description: reader.read(),
      done: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Broken obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.category);
    writer.write(obj.reason);
    writer.write(obj.period);
    writer.write(obj.expenses);
    writer.write(obj.image);
    writer.write(obj.description);
    writer.write(obj.done);
  }
}

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final typeId = 1;

  @override
  Expense read(BinaryReader reader) {
    return Expense(
      title: reader.read(),
      price: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer.write(obj.title);
    writer.write(obj.price);
  }
}
