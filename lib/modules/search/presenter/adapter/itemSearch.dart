import 'package:desafio/modules/search/domain/entities/result_search.dart';
import 'package:desafio/modules/search/infra/models/classeJson.dart';
import 'package:flutter/material.dart';

class ItemPokemon extends StatelessWidget {

  ResultSearch resultSearch;
  VoidCallback onTapPokemon;


  ItemPokemon({
    @required this.resultSearch,
    this.onTapPokemon,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: this.onTapPokemon,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SizedBox(
              width: 100,
              height: 100,
              //child: Image.network(
                //resultSearch.image == null ? " " : resultSearch.image,
               // fit: BoxFit.cover,
              //),
            ),
              Container(
                  height: 44,
                decoration: BoxDecoration(
                    color: Color(0xff3761A8),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18))
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                     child: Text(
                       resultSearch.name == null ? "" : resultSearch.name,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
              ),
           ],
          ),
      ),
    );
  }
}
