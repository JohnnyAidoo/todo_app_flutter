import 'package:flutter/material.dart';
import 'components/theme.dart';
import 'package:hexcolor/hexcolor.dart';

void main(List<String> args) {
  runApp(AppEntry());
}

class AppEntry extends StatefulWidget {
  AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  final _textController = TextEditingController();

  final List<String> _todos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Note App'),
          centerTitle: true,
          backgroundColor: HexColor(ctaColor!),
        ),
        body: Column(
          children: [
            const Text(
              'Todos',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      shape: const BeveledRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(0, 0))),
                      title: Text(_todos[index]),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      color: Colors.black26,
                    );
                  }),
                  itemCount: _todos.length),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hoverColor: HexColor(ctaColor!),
                          fillColor: HexColor(ctaColor!),
                          focusColor: HexColor(ctaColor!),
                          iconColor: HexColor(ctaColor!),
                          hintText: 'input todo',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                _textController.clear();
                              },
                              icon: const Icon(Icons.close))),
                      controller: _textController,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        setState(() {
                          _todos.add(_textController.text);
                          _textController.clear();
                        });
                      }
                    },
                    color: HexColor(ctaColor!),
                    height: 60,
                    child: const Text('ADD'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
