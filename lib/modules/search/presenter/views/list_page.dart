import 'package:desafio/modules/search/presenter/adapter/itemSearch.dart';
import 'package:desafio/modules/search/presenter/search/search_bloc.dart';
import 'package:desafio/modules/search/presenter/search/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:page_transition/page_transition.dart';

import 'detalhes_page.dart';


class ListPage extends StatefulWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  void initState() {
    super.initState();
    bloc.add("a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 34.0,
                ),
              ),
              SliverAppBar(
                backwardsCompatibility: false,
                floating: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset("imagens/pokeapi.png"),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: StreamBuilder(
                          stream: bloc,
                          builder: (context, snapshot) {
                            final state = bloc.state;

                            if (state is SearchStart) {
                              return Center(
                                child: Text(""),
                              );
                            }
                            if (state is SearchError) {
                              return Center(
                                child: Text("Houve um erro"),
                              );
                            }
                            if (state is SearchLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final list = (state as SearchSuccess).list;
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemPokemon(
                                  resultSearch: list[index],
                                  onTapPokemon: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            child: DetalhesPage(
                                                list[index].name)));
                                  },
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
