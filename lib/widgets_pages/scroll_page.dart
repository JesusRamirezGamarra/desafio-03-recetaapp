import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  String correo;
  Color bgColor;
  ScrollPage({required this.correo, required this.bgColor});

  Widget buildContainers(String text) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context, "dato que se devuelve al log");
      }),
      // appBar: AppBar(
      //   title: Text("Scroll Page"),
      //   // leading: Container(),
      // ),
      body: Column(
        children: [
          Text("CABECERA 1"),
          Text("Tu correo es:"),
          Text(correo),
          Expanded(
            child: SingleChildScrollView(
              // scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_left),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildContainers("111"),
                        ),
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                  buildContainers("2"),
                  buildContainers("2"),
                  ...List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("HIJO"),
                    ),
                  ),
                  buildContainers("3"),
                  buildContainers("3"),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildContainers("separated $index"),
                        separatorBuilder: (context, index) => Container(
                              width: 20,
                              height: 20,
                              color: Colors.black,
                            ),
                        itemCount: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
