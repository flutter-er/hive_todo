import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'groups_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({Key? key}) : super(key: key);

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final model = GroupsWidgetModel();

  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelProvider(model: model, child: _GroupsWidgetBody());
  }
}

class _GroupsWidgetBody extends StatelessWidget {
  const _GroupsWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
        centerTitle: true,
      ),
      body: _GroupListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupsWidgetModelProvider.read(context)?.model.showForm(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
        itemCount: groupsCount,
        separatorBuilder: (BuildContext context, int index) {
          return
            _GroupListRowWidget(indexInList: index);
        },
        itemBuilder: (BuildContext context, int index) {
          return Divider(
            height: 3,
          );
        });
  }
}

class _GroupListRowWidget extends StatelessWidget {
  const _GroupListRowWidget({Key? key, required this.indexInList}) : super(key: key);
  final int indexInList;

  @override
  Widget build(BuildContext context) {
    final group=
        GroupsWidgetModelProvider.read(context)!.model.groups[indexInList];
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => {}),
      ],
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          title: Text(group.name),
          trailing: Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
