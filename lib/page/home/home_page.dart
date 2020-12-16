import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcg_bloc/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PokemonModel> pokemons;

  Future<PokemonModel> fetchAlbum() async {
    final response = await http.get('https://api.pokemontcg.io/v1/cards');

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    pokemons = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokemonTCG BLOC"),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<PokemonModel>(
          future: pokemons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: snapshot.data.cards.length,
                  itemBuilder: (context, i) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black45, BlendMode.darken),
                                      image: NetworkImage(
                                          snapshot.data.cards[i].imageUrl)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(1, 3),
                                        blurRadius: 6,
                                        spreadRadius: 0)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text(
                                    "${snapshot.data.cards[i].name}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 26),
                                  )),
                                  Center(
                                    child: Text(
                                      "${snapshot.data.cards[i].subtype}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "HP : ${snapshot.data.cards[i].hp}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),


                                ],
                              )),
                        ),
                        Positioned(bottom: 10,child: Container(
                          width: (MediaQuery.of(context).size.width - 8) / 2 ,
                          child: Text(

                            "${snapshot.data.cards[i].artist}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),)
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
