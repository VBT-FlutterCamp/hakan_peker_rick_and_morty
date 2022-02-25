import 'package:flutter/material.dart';
import 'rick_morties_view_model.dart';

class RickMortiesView extends RickMortiesViewModel {
  bool isLoading = false;
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: ()  {
          changeLoading();

          fetchAllData();
        }),
        appBar: AppBar(
          title: Text("Rick and Morty"),
        ),
        body: isLoading
            ? ListView.builder(
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
              )
            : Center(child: CircularProgressIndicator()));
  }
}
