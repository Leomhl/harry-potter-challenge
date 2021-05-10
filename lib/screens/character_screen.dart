import 'package:flutter/material.dart';
import 'package:harry_potter_challenge/components/liked.dart';
import 'package:harry_potter_challenge/models/character.dart';

class CharacterScreen extends StatefulWidget {

  Character character;

  CharacterScreen({this.character});

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool _favorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text(
          widget.character.name,
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: [
                        Image.network(
                          widget.character.image,
                          width: 100,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.character.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Text(
                              widget.character.house,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            child: Liked(
                              isSelected: _favorite,
                              onPressed: (){
                                setState((){
                                  _favorite = !_favorite;
                                });
                              }
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        )

                      ]
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Nome: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.name),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Casa: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.house),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Ator(a): ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.actor),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Aluno(a): ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.hogwartsStudent ? "Sim": "Não"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Aniversário: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.dateOfBirth),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Cor dos olhos: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.character.eyeColour),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}