import 'package:flutter/material.dart';
import 'package:wattio_test/data/repositories/api_service.dart.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  List<dynamic> empresasPF = [];
  List<dynamic> empresasPJ = [];

  Future<void> fetchData() async {
    try {
      List<dynamic> dataPF =
          await ApiService.fetchData('descontos_pf_empresas.json');
      List<dynamic> dataPJ =
          await ApiService.fetchData('descontos_pj_empresas.json');

      setState(() {
        empresasPF = dataPF;
        empresasPJ = dataPJ;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "COOPERATIVAS HIDRELETRICAS",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Empresas",
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pessoa Física",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: empresasPF.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(empresasPF[index]['nome']),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pessoa Jurídica",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: empresasPJ.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(empresasPJ[index]['nome']),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}
