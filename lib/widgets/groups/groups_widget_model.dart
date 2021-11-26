import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_tod/domain/entity/group.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupsWidgetModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get  groups => _groups.toList();

  GroupsWidgetModel(){
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }
 void _readGroupsFromHive(Box<Group> box){
   _groups = box.values.toList();
   notifyListeners();
 }

  void _setup()async{
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    _readGroupsFromHive(box);
    box.listenable().addListener(() => _readGroupsFromHive(box));
  }
}

class GroupsWidgetModelProvider extends InheritedNotifier {
  final GroupsWidgetModel model;

  const GroupsWidgetModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static GroupsWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsWidgetModelProvider>();
  }

  static GroupsWidgetModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType()?.widget;
    return widget is GroupsWidgetModelProvider ?widget : null;
  }
}
