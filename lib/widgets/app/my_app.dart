import 'package:flutter/material.dart';
import 'package:hive_tod/widgets/group_form/group_form_widget.dart';
import 'package:hive_tod/widgets/groups/groups_widget.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
       '/groups': (c) => GroupsWidget(),
        '/groups/form':(c)=> GroupFormWidget()




      },
      initialRoute: '/groups',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    );
  }
}