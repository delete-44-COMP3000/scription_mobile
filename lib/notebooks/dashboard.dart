import 'package:flutter/material.dart';
import 'package:scription_mobile/models/notebook.dart';
import 'package:scription_mobile/styles.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.notebook}) : super(key: key);

  final Notebook notebook;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.notebook.name)),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(widget.notebook.summary ?? '', style: Styles.body()),
                    ListTile(
                        leading: Icon(Icons.person, size: 48),
                        title: Text("Characters"),
                        onTap: () {},
                        subtitle: Text(
                            "View characters for ${widget.notebook.name}")),
                    ListTile(
                        leading: Icon(Icons.home, size: 48),
                        title: Text("Locations"),
                        onTap: () {},
                        subtitle:
                            Text("View locations for ${widget.notebook.name}")),
                    ListTile(
                        leading: Icon(Icons.hardware, size: 48),
                        title: Text("Items"),
                        onTap: () {},
                        subtitle:
                            Text("View items for ${widget.notebook.name}")),
                  ],
                ))));
  }
}
