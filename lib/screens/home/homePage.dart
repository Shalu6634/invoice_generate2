import 'package:flutter/material.dart';

import '../../utils/globalVar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'Invoices',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ...List.generate(
              DataList.length,
                  (index) => SizedBox(
                height: 105,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectIndex = index;
                    });
                    Navigator.of(context).pushNamed('/detail');
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      ListTile(
                          subtitle: Text('${DataList[index].data}'),
                       title: Text('${DataList[index].name}'),
                        trailing: Text(
                          '${DataList[index].price}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
