import 'package:flutter/material.dart';
import 'rick_morties_view_model.dart';

class RickMortiesView extends RickMortiesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        fetchAllData();
      }),
      appBar: AppBar(title: Text("Rick and Morty"),),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(models[index].image ?? 'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
              ),
              title: Text(models[index].name ?? ""),
              subtitle: Text(models[index].created ?? ""),
              trailing: Text(models[index].episode ?? ""),
            ),
          );
        },
      ),
    );
  }
}
