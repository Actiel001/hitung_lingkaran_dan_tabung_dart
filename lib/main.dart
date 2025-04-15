import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController jarijarilingkaranController = TextEditingController();
  TextEditingController luaslingkaranController = TextEditingController();
  TextEditingController kelilinglingkaranController = TextEditingController();

  TextEditingController jarijariTabungController = TextEditingController();
  TextEditingController tinggiTabungController = TextEditingController();
  TextEditingController volumeTabungController = TextEditingController();
  TextEditingController luasSelimutTabungController = TextEditingController();
  TextEditingController luasPermukaanTabungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Latihan OOP"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 94, 97, 94),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Rumus OOP"),
                    TextField(
                      controller: jarijarilingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Lingkaran")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){
                        setState(() {
                          if (jarijarilingkaranController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: SnackBar(
                                  content: Text(
                                    "Jari Jari Lingkaran Harap diisi"))));
                                    return;
                          }
                          double jariJari =
                          double.parse(jarijarilingkaranController.text);
                          Lingkaran lingkaran = Lingkaran(jariJari);
                          luaslingkaranController.text = 
                            lingkaran.getLuasLingkaran().toString();
                          kelilinglingkaranController.text = 
                            lingkaran.getKelilingLingkaran().toString();
                          
                        });
                      }, child: const Text("Proses"),
                      ),
                    ),
                    TextField(
                      controller: luaslingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Luas Lingkaran")
                      ),
                    ),
                    TextField(
                      controller: kelilinglingkaranController,
                      decoration: const InputDecoration(
                        label: Text("Keliling Lingkaran")
                      ),
                    )
                  ],
                ),
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 152, 158, 158),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Rumus Tabung"),
                    TextField(
                      controller: jarijariTabungController,
                      decoration: const InputDecoration(
                        label: Text("Jari Jari Tabung"),
                      ),
                    ),
                    TextField(
                      controller: tinggiTabungController,
                      decoration: const InputDecoration(
                        label: Text("Tinggi Tabung")
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          if (jarijariTabungController.text.isEmpty || 
                          tinggiTabungController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: SnackBar(
                                  content: Text(
                                    "Jari Jari dan Tinggi Tabung Harap diisi"))));
                                    return;
                        }
                        double jariJari =
                          double.parse(jarijariTabungController.text);
                        double tinggi =
                          double.parse(tinggiTabungController.text);

                        Tabung tabung = Tabung(jariJari, tinggi);

                        volumeTabungController.text =
                          tabung.getVolumeTabung().toString();

                        luasSelimutTabungController.text =
                          tabung.getLuasSelimutTabung().toString();
                        luasPermukaanTabungController.text =
                          tabung.getLuasPermukaanTabung().toString();
                       });
                      }, 
                      child: const Text("Proses"),
                      ),
                    ),
                    TextField(
                      controller: volumeTabungController,
                      decoration: const InputDecoration(
                        label: Text("Volume Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasSelimutTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Selimut Tabung"),
                      ),
                    ),
                    TextField(
                      controller: luasPermukaanTabungController,
                      decoration: const InputDecoration(
                        label: Text("Luas Permukaan Tabung")
                      ),
                    )
                  ],
                ),
              )),
          )
        ],
      ),
    );
  }
}

class Lingkaran {
  double? _jariJari;
  
  Lingkaran([this._jariJari]);
  
  double getLuasLingkaran() {
    return 22/7 * _jariJari!;
  }
  
  double getKelilingLingkaran() {
    return 2*22/7 *_jariJari!;
  }
}
class Tabung extends Lingkaran {
  double? _tinggi;

  Tabung([super._jariJari, this._tinggi]);

  double? get getTinggi {
    return _tinggi;
  }
  set setTinggi(double tinggi){
    _tinggi = tinggi;
  }
  double getVolumeTabung(){
    return getLuasLingkaran() * _tinggi!;
  }
  double getLuasSelimutTabung(){
    return getKelilingLingkaran() * _tinggi!;
  }
  double getLuasPermukaanTabung(){
    return getLuasSelimutTabung() + 2 * getLuasLingkaran();
  } 
}