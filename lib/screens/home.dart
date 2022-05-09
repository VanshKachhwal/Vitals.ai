import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitals_ai/models/test_results.dart';
import 'package:vitals_ai/widgets/drawer.dart';

import '../utils/routes.dart';
import 'camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool takenTest = false;

  void _opencamerapage() {
     Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _opencamerapage,
        tooltip: "Take a Test",
        child: Icon(
          CupertinoIcons.heart
        ),
        ),
      appBar: AppBar(
        title: Text("Vitals.ai"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index){
              final testResult = ResultModel.results[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: GridTile(
                  header: Container(
                    child: Center(
                      child: Text(
                        testResult.name,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade300
                    )
                    ),
                  child: Center(child: Text(
                    testResult.result.toString(),
                    style: TextStyle(
                      fontSize: 20
                    ),
                    )),
                  footer: Container(
                    child: Center(
                      child: Icon(
                        CupertinoIcons.info,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white
                    )
                    ),
                  
                ),
              );
            },
            itemCount: ResultModel.results.length,)
            ),
        ),
      drawer: MyDrawer(),
    );
  }
}