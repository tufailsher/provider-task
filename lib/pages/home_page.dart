import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/blocs/countries_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      Provider.of<CountriesBLOC>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Countries")),
        ),
        body: Consumer<CountriesBLOC>(
            builder: (context, CountriesBLOC model, child) {
          return model.status.loading
              ? Center(child: CircularProgressIndicator())
              : model.status.error
                  ? Center(
                      child: Column(
                        children: [
                          Text(model.status.friendlyErrorMessage),
                          FlatButton(
                              onPressed: model.loadData, child: Text("retry"))
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: model.countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Text(model.countries[index].name),
                        );
                      });
        }),
      ),
    );
  }
}
