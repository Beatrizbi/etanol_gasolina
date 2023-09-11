import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerEtanol = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = ""; 

  void _Calcular() {
    double? precoEtanol = double.tryParse(_controllerEtanol.text);
     double? precoGasolina = double.tryParse(_controllerGasolina.text);
    
    if(precoEtanol == null || precoGasolina == null) {
      //print("Número inválido, digite números maiores que 0 e utilizando (.)");
      setState(() {
     _textoResultado = 
         "Número inválido, digite números maiores que 0 e utilizando (.)";

      });
    } else{
      if((precoEtanol/precoGasolina)>=0.7){
        setState(() {
          _textoResultado = "melhor abastecer com gasolina";
          _limpaCampos();
        });

        } else {
            setState(() {
          _textoResultado = "melhor abastecer com etanol";
        });
      }
    }
  }

  void _limpaCampos() {
    _controllerEtanol.clear();
    _controllerGasolina.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Etanol x Gasolina"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("imagens/etanolgasolina.png"),
                    width: 200,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 62, 247, 6),
                      decoration: TextDecoration.underline),
                ),
              )),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço Etanol Ex 3.50"),
                style: TextStyle(fontSize: 25),
                controller: _controllerEtanol,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço Gasolina Ex 7.50"),
                style: TextStyle(fontSize: 25),
                controller: _controllerGasolina,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        backgroundColor: Colors.blue,
                        textStyle: TextStyle(fontSize: 25
                        )
                        ),
                    onPressed: _Calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Center(
                child: Padding(
                   padding: EdgeInsets.all(20),
                   child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.red),
                   )
                )


              )
            ],
          ),
        ),
      ),
    );
  }
}
