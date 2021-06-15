import 'package:bilhete_eletronico/widgets/appBarUser_widget.dart';
import 'package:flutter/material.dart';

class HorarioPage extends StatefulWidget {
  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  String nomeBairro = "";
  var _bairros = ['Gaspar Lopes', 'Jd. Alvorada', 'Itaparica', 'Pinheirinho'];
  var _itemSelecionado = 'Gaspar Lopes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUserWidgets(),
      body: criaDropDownButton(),
    );
  }

  criaDropDownButton() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          Text("HORÁRIOS"),
          Text("Selecione o bairro"),
          TextField(
            onSubmitted: (String userInput) {
              setState(() {
                debugPrint('chamei setState');
                nomeBairro = userInput;
              });
            },
          ),
          DropdownButton<String>(
            items: _bairros.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
                this._itemSelecionado = novoItemSelecionado;
              });
            },
            value: _itemSelecionado,
          ),
          if (_itemSelecionado == 'Gaspar Lopes')
            // {
            SizedBox(height: 30),
          Text('Sentido  | Centro para o bairro'),
          SizedBox(height: 10),
          Text('5:45 - 6:45 - 7:45 - 8:45 - 9:45 - 10:45 - 11:45'),
          Text('12:45 - 13:45 - 14:45 - 15:45 - 16:45 - 17:45 - 18:45'),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text('Sentido  | Bairro para o Centro'),
          SizedBox(height: 10),
          Text('6:15 - 7:15 - 8:15 - 9:15 - 10:15 - 11:15 - 12:15'),
          Text('13:15 - 14:15 - 15:15 - 16:15 - 17:15 - 18:15 - 19:15'),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 40),
          Text(
              'O horários acima descritos podem variar de \nacordo com o fluxo do trânsito no dia.'),
          // },
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[700],
                  onPrimary: Colors.white,
                  //shadowColor: Colors.green,
                  elevation: 0,
                ),
                child: Text('VOLTAR')),
          ),
        ],
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }
}
