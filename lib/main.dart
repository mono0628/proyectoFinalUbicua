//Osmar Andres Valencia Vallejo - 1037645457

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Ubicua',
      theme: ThemeData(
       // colorScheme: ColorScheme.light(primary: ),
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.amber,brightness:Brightness.light,primary: Colors.blueAccent,secondary: Colors.purple),
        useMaterial3:false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SingingCarac {dolar,euro,libra,yen}

class Data{
  

}

class _MyHomePageState extends State<MyHomePage> {

Map<String,dynamic> lenguas =
    {"lenguajes":[
    {
      "nombre":"Flutter",
      "descripcion":"Flutter es un SDK de código fuente abierto de desarrollo de aplicaciones móviles creado por Google. Suele usarse para desarrollar interfaces de usuario para aplicaciones en Android, iOS y Web así como método primario para crear aplicaciones para Google Fuchsia",
      "img":"https://i0.wp.com/www.jesuscuesta.blog/wp-content/uploads/2021/06/flutter.png"
    },
    {
      "nombre":"Node",
      "descripcion":"Node.js es un entorno en tiempo de ejecución multiplataforma, de código abierto, para la capa del servidor basado en el lenguaje de programación JavaScript, asíncrono, con E/S de datos en una arquitectura orientada a eventos y basado en el motor V8 de Google",
      "img":"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/590px-Node.js_logo.svg.png"
    },
    {
      "nombre":"React",
      "descripcion":"React es una librería Javascript de código abierto diseñada para crear interfaces de usuario con el objetivo de facilitar el desarrollo de aplicaciones en una sola página. Es mantenido por Facebook y la comunidad de software libre. En el proyecto hay más de mil desarrolladores libres",
      "img":"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/512px-React-icon.svg.png"
    },
    {
      "nombre":"PHP",
      "descripcion":"PHP es un lenguaje de programación interpretado​ del lado del servidor y de uso general que se adapta especialmente al desarrollo web.​ Fue creado inicialmente por el programador danés-canadiense Rasmus Lerdorf en 1994.​",
      "img":"https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/1280px-PHP-logo.svg.png"
    },
    {
      "nombre":"Laravel",
      "descripcion":"Laravel es un framework de código abierto para desarrollar aplicaciones y servicios web con PHP 5, PHP 7 y PHP 8",
      "img":"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Laravel.svg/800px-Laravel.svg.png"
    },
    {
      "nombre":"Angular",
      "descripcion":"Angular es un framework para aplicaciones web desarrollado en TypeScript, de código abierto, mantenido por Google, que se utiliza para crear y mantener aplicaciones web de una sola página.",
      "img":"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.png"
    }
  ]
};

late List conteo; 


void initState(){

conteo = lenguas["lenguajes"];

}
var title = ["Calculadora de notas","Convertidor de monedas","Libre"];
String titulo = "";


//calculadora
final numero1 = TextEditingController();
final numero2 = TextEditingController();
final numero3 = TextEditingController();
final numero4 = TextEditingController();
int currentPageIndex = 0;
String mensaje  ="";
double calculo = 0;
double num1 = 0;
double num2 =0;
double num3 = 0;
double num4 =0;


  void _limpiar(){
    setState(() {
      calculo = 0;
      calculoConversor = 0;
      //numero1=dispose();
  
    });
  }

  void _calcular(){
    num1 = double.parse(numero1.text);
    num2 = double.parse(numero2.text);
    num3 = double.parse(numero3.text);
    num4 = double.parse(numero4.text);
    if(num1>=0 && num2>=0 && num3>=0 && num4>=0){
      calculo =  num1+num2+num3+num4;
      calculo = calculo / 4;

        if(calculo>=3.5){
          mensaje = "Gano";
        }else{
          mensaje = "Perdio";
        }
    }else{
      mensaje = "Los numeros deben ser mayores o iguales a 0";
    }
    setState(() {   
      mensaje = mensaje;
    });
  }

//conversor
SingingCarac? opcion = SingingCarac.euro;
final valorCOP = TextEditingController();
double calculoConversor = 0;
double cal = 0;
double monedaCOP = 0;
double peso = 0;
String moneda = "";

final formate = new NumberFormat("#,###,##","en_EU");

//lenguajes

  void _convertir(){
   
    monedaCOP = double.parse(valorCOP.text);
  
    setState(() {
  

    switch(moneda){
      // ignore: constant_pattern_never_matches_value_type
      case "Euro":
      peso = 4392;
      calculoConversor = monedaCOP * peso;
      break;
      case "Dolar":
      peso = 4211;
      calculoConversor = monedaCOP * peso;
      break;
      case "Libra":
      peso = 4983;
      calculoConversor = monedaCOP * peso;
      break;
      case "Yen":
      peso = 72.17;
      calculoConversor = monedaCOP * peso;
      break;
      default:
      cal = 0;
    }

      });
    
  }
  
  @override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text("$titulo"),
      ),
      body: _body(),
      bottomNavigationBar: menu(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

Widget _body() => [
     Container(
      color:Colors.white60,
      child: _calculadora(),
      ),
      Container(
      color:Colors.white10,
      child: _conversor(),
      ),
      Container(
        color:Colors.white,
        child:_imagenes(),
      )
  ][currentPageIndex];

Widget _calculadora() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [   
              Text('$calculo',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
              ),
               Text('$mensaje',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              ),
          ],
        ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.all(3),
            child: TextField(
            controller: numero1,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: const InputDecoration(
              labelText: "Nota 1",
              border: OutlineInputBorder(),
              
            ),
            textAlign: TextAlign.center,
          ),
          ),
           Container(
            width: 300,
            padding: const EdgeInsets.all(3),
            child: TextField(
            controller: numero2,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: const InputDecoration(
              labelText: "Nota 2",
              border: OutlineInputBorder(),
            ),
            textAlign: TextAlign.center,
          ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.all(3),
            child: TextField(
            controller: numero3,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: const InputDecoration(
              labelText: "Nota 3",
              border: OutlineInputBorder(),
            ),
            textAlign: TextAlign.center,
          ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.all(3),
            child: TextField(
              controller: numero4,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: const InputDecoration(
                labelText: "Nota 4",
                border: OutlineInputBorder(),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed:(){
                  _calcular();
                },
                child: const Text("Calcular")
                  ),
                  ElevatedButton(
                onPressed:_limpiar,
                child: const Text("Limpiar"),
                  )
            ],
          ),

          
        ],
      
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: Colors.purple,
          )
        ],
      )
      ]
    );
 
Widget _conversor() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [   
              Text(
                formate.format(calculoConversor),
              textAlign: TextAlign.end,
              style:Theme.of(context).textTheme.headline5,

            )
          ],
        ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            RadioListTile<SingingCarac>(
              title: const Text("Euro"),
              activeColor: Colors.purple,
              hoverColor: Colors.blue,
              value:SingingCarac.euro,
               groupValue: opcion,
                onChanged: (value) => {
                  setState((){
                    opcion = value;
                    moneda = "Euro";
                  })          
                },
            ),
            RadioListTile<SingingCarac>(
              title: const Text("Dollar"),
              activeColor: Colors.purple,
              hoverColor: Colors.blue,
              value:SingingCarac.dolar,
               groupValue: opcion,
                onChanged: (value) => {
                  setState((){
                    opcion = value;
                    moneda = "Dolar";
                  })
                },
            ),
            RadioListTile<SingingCarac>(
              title: const Text("Libra"),
              activeColor: Colors.purple,
              hoverColor: Colors.blue,
              value:SingingCarac.libra,
               groupValue: opcion,
                onChanged: (value) => {
                  setState((){
                    opcion = value;
                    moneda = "Libra";
                  })
                },
            ),
            RadioListTile<SingingCarac>(
              title: const Text("Yen"),
              activeColor: Colors.purple,
              hoverColor: Colors.blue,
              value:SingingCarac.yen,
               groupValue: opcion,
                onChanged: (value) => {
                  setState((){
                    opcion = value;
                    moneda = "Yen";
                  })
                },
            ),
           Container(
            width: 300,
            padding: const EdgeInsets.all(7),
            child: TextFormField(
              controller: valorCOP,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: const InputDecoration(
                labelText: "Moneda COP",
                border: OutlineInputBorder(),
                
              ),
              textAlign: TextAlign.center,
          ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed:(){
                  _convertir();
                },
                child: const Text("Convertir"),
                 
                  ),
                  ElevatedButton(
                onPressed:_limpiar,
                child: const Text("Limpiar"),
                 
                  )
            ],
          ),

          
        ],
      
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: Colors.blue,
          )
        ],
      )
      ]
 );

Widget _imagenes() =>Column(
      children: [
        Expanded(child: 
       ListView.builder(
        itemCount:conteo.length,
        itemBuilder: (BuildContext context,int index){
          return Column(
            children: [
            Card(elevation: 1,
            borderOnForeground: true,
            child:ListTile(
              leading: imagen(conteo[index]["img"]),
              title: Text(conteo[index]["nombre"]),
              subtitle: Text(conteo[index]["descripcion"]),
            ),
            ),
            ],
          );
        },
       ))
       
      ],
        
                
);
Widget imagen(img)=>Image.network(img,width:150,height: 100);

Widget menu() => NavigationBar(
  indicatorColor: Colors.amber,
  selectedIndex: currentPageIndex,
  onDestinationSelected: (int value) => {
    setState((){
       currentPageIndex = value;
       titulo = title[currentPageIndex];
    })
  },
  destinations: const <Widget> [
    NavigationDestination(
      selectedIcon: Icon(Icons.calculate_outlined),
      icon: Icon(Icons.calculate_rounded),
       label:"Notas"
       ),
        NavigationDestination(
      selectedIcon: Icon(Icons.price_change_outlined),
      icon: Icon(Icons.price_change_sharp),
       label:"Conversor"
       ),
        NavigationDestination(
      icon: Icon(Icons.animation),
       label:"Libre"
       ),
  ]
  );
}


class Alert extends StatefulWidget {
  const Alert({super.key});

@override
  State<Alert>createState() =>_AlertExample();

  }

  class _AlertExample extends State<Alert> {

    @override
    Widget build(BuildContext context){
        return  AlertDialog(
          title: Text("Suba"),
          actions: <Widget>[
            TextButton(
              onPressed: () {Navigator.pop(context);
              },
              child: const Text("Salir"),
            ),
          ],
        );
    }
}





