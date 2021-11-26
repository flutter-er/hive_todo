import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'widgets/app/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  runApp( MyApp());
}



