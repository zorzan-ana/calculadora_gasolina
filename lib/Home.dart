import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlccol = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    
    double? precoAlccol = double.tryParse(_controllerAlccol.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlccol == null || precoGasolina == null){
      setState(() {
        _textoResultado = ("Número inválido, digite maiores que 0 e utilizando (.)");
      });

    }else{
      if((precoAlccol / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else
        setState(() {
          _textoResultado = "Melhor abastecer com alcool";
        });
    }
    _limparCampos();
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlccol.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 15
                ),
                controller: _controllerAlccol,

              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: TextStyle(
                    fontSize: 15
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white, padding: EdgeInsets.all(15)),
                  child: Text("Calcular",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(_textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
