import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (0.8 - 0.05),
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: Image.asset(
                "imagens/logo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * (0.3),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset("imagens/pokeapi.png"),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 26, left: 8),
                                    child: TextButton(
                                      child: Text(
                                        "Criar conta",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          padding: EdgeInsets.fromLTRB(
                                              32, 16, 32, 16),
                                          primary: Colors.transparent),
                                      onPressed: () {},
                                    ),
                                  )),
                                  Padding(padding: EdgeInsets.all(10.0)),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 26, right: 8),
                                    child: TextButton(
                                      child: Text(
                                        "Entar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          padding: EdgeInsets.fromLTRB(
                                              32, 16, 32, 16),
                                          primary: Colors.transparent),
                                      onPressed: () {
                                        showMaterialModalBottomSheet(
                                            expand: true,
                                            enableDrag: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ListPage();
                                            });
                                      },
                                    ),
                                  )),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
