import 'package:fetch_data_from_internet/album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fetch_data_from_internet/fetch_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch data from internet"),
      ),
      body: Center(
        child: FutureBuilder<Album>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Text("${snapshot.data!.userId}"),
                    Text("${snapshot.data!.id}"),
                    Text(snapshot.data!.title),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
