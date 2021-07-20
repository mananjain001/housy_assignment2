import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:housy_assignment2/models/MoviesModel.dart';
import 'package:provider/provider.dart';
import 'models/MoviesItemModel.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<MoviesItemModel>> moviesList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesModel(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Company: Housy\n"
                          "Address: Pune, India\n"
                          "Phone: XXXXXXXXX09\n"
                          "Email: XXXXXX@housy.com")));
                })
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Consumer<MoviesModel>(
                    builder: (context, movies, child) {
                      return movies.list.length == 0
                          ? Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: movies.list.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = movies.list[index];
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 200,
                                            child: Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Transform.rotate(
                                                        angle:
                                                            225 * math.pi / 180,
                                                        child: Icon(Icons
                                                            .signal_cellular_4_bar),
                                                      ),
                                                      Text(item.votes),
                                                      Transform.rotate(
                                                        angle:
                                                            45 * math.pi / 180,
                                                        child: Icon(Icons
                                                            .signal_cellular_4_bar),
                                                      ),
                                                      Text("Votes")
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      height: 200,
                                                      width: 150,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          item.posterLink,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            250,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item.name,
                                                            style: TextStyle(
                                                                fontSize: 22),
                                                          ),
                                                          CustomTextRow(
                                                            title: "Genre",
                                                            text: item.genre,
                                                          ),
                                                          CustomTextRow(
                                                            title: "Director",
                                                            text: item.director,
                                                          ),
                                                          CustomTextRow(
                                                            title: "Starring",
                                                            text: item.starring,
                                                          ),
                                                          Text(item.language +
                                                              " | " +
                                                              calculateDate(item
                                                                  .releaseDate)),
                                                          Text(
                                                            item.views +
                                                                " views | Voted by " +
                                                                item.votes +
                                                                " people",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          MaterialButton(
                                            minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                50,
                                            color: Colors.blue,
                                            onPressed: () {},
                                            child: Text("Watch Trailer"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

calculateDate(String releaseDate) {
  var day =
      DateTime.fromMillisecondsSinceEpoch(int.tryParse(releaseDate) * 1000)
          .day
          .toString();
  var month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ][DateTime.fromMillisecondsSinceEpoch(int.tryParse(releaseDate) * 1000)
          .month -
      1];

  return day + " " + month;
}

class CustomTextRow extends StatelessWidget {
  String title, text;

  CustomTextRow({@required this.text, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title + ": ",
          style: TextStyle(color: Colors.grey),
        ),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
