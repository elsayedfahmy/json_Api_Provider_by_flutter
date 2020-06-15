import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json/GUI/DetailsScreen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:json/GUI/UserModel.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  Future<List<UserModel>> _getData() async {
// link for json file
    String url =
        'http://www.json-generator.com/api/json/get/bYKKPeXRcO?indent=2';
    http.Response response = await http.get(url);
    var data = json.decode(response.body);

    List<UserModel> users_list = [];
    for (var item in data) {
      UserModel user = UserModel(item['index'], item["about"], item["name"],
          item["picture"], item["company"], item["email"]);
      users_list.add(user);
    }
    // print('>>>>>>>>>>>>>>>>>>>>>>>>>> data =========== ${users_list.length}');
    return users_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GSON API'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getData(),
          builder: (c, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Text('loading ..... '),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data[index].picture + snapshot.data[index]
                                .index.toString() + ".jpg"
                        ),
                      ),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            c) => DetailsScreen(snapshot.data[index])));
                      },
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
