// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_import, avoid_print, no_leading_underscores_for_local_identifiers, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _texto = '';

_atualizar() async{

  String url = 'https://blockchain.info/ticker';

  http.Response resposta;

  resposta = await http.get(Uri.parse(url));

  Map retorno = jsonDecode(resposta.body);
  
  print(resposta.statusCode);  
  print(resposta.request);  

  String _valor = retorno['BRL']['buy'].toString();    

  _texto = 'R\$ $_valor';

  setState(() {
    _valor;
  });

  print(_valor);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset('images/bitcoin.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(_texto,
              style: TextStyle(
                fontSize: 30
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 15, 30, 15)),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.orange
                  )
                ),                
                onPressed: _atualizar,
                child: Text(
                  'Atualizar',
                  style: TextStyle(
                    fontSize: 20
                  ),
                )),
            )
          ],
        ),
      ),
    );
  }
}