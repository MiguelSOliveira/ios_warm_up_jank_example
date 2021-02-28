import 'package:flutter/material.dart';
import 'package:flutter_app/dialog_popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            child: DialogPopup(
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Text("Hello World"),
                    Theme(
                      data: Theme.of(context).copyWith(
                        cardColor: Colors.cyan,
                      ),
                      child: ExpansionPanelList(
                        children: [
                          ExpansionPanel(
                            headerBuilder: (var context, var isExpanded) {
                              return const ListTile(
                                title: Text(
                                  'This is the title',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                            canTapOnHeader: true,
                            isExpanded: false,
                            body: LimitedBox(
                              maxHeight: MediaQuery.of(context).size.height * 0.4,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    onChanged: (isSelected) {},
                                    value: true,
                                    title: Text(
                                      "This is the title",
                                    ),
                                    subtitle: Text(
                                      'This is the subtitle',
                                      style: Theme.of(context).textTheme.caption.copyWith(
                                            color: Colors.grey,
                                          ),
                                    ),
                                  );
                                },
                                itemCount: 5,
                                shrinkWrap: true,
                              ),
                            ),
                          ),
                        ],
                        expansionCallback: (panelIndex, isExpanded) {},
                        expandedHeaderPadding: const EdgeInsets.all(0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
