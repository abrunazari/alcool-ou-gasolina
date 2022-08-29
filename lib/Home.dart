import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular (){
    
    double? precoAlcool =  double.tryParse(_controllerAlcool.text);
    double? precoGasolina =  double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {

      setState (() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });

    }else {

      /*
       * Se o preço do álcool divido pelo preço da gasolina
       for >= a 0.7 é melhor abastecer com gasolina
       senão, é melhor utilizar álcool
       */

     if ( (precoAlcool / precoGasolina) >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
     }else {
       setState(() {
         _textoResultado = "Melhor abastecer com álcool";
       });
     }
     _limparCampos ();
     }
  }
    void _limparCampos (){
      _controllerGasolina.text = "";
      _controllerAlcool.text = "";


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.grey,
      ),
      body: Container (
        child: SingleChildScrollView (
          padding: EdgeInsets.all(32),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Image.asset('imagens/alcool_ou_gasolina.jpeg'),
              ),
              Padding (
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para o abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                    labelText: "Preço Álcool",
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool,
              ),
              TextField (
                keyboardType: TextInputType.number,
                decoration: InputDecoration (
                    labelText: "Preço Gasolina"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding (
                padding: EdgeInsets.only(top:10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                            color: Colors.white
                        ),
                        padding: EdgeInsets.all(15)),
                    child: Text (
                      "Calcular",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    onPressed: _calcular
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text (
                  _textoResultado,
                  style: TextStyle (
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
