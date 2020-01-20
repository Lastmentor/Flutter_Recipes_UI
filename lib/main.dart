import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  TabController controller;
  TabController controllerRecip;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
    controllerRecip = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    controllerRecip.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/back.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 20),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.0),
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        image: AssetImage('assets/pic.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 230, left: 170),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Elisabeth", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 8),
                          Text("1.974 Followers", style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),),
                        ],
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFebf4ef)
                        ),
                        child: Center(
                          child: Text("Follow", style: TextStyle(color: Color(0xFF56a378), fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TabBar(
              controller: controllerRecip,
              indicatorColor: Color(0xFF4e9f72),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3.0,
              isScrollable: true,
              labelColor: Colors.black,
              labelStyle:
              TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black.withOpacity(0.5),
              tabs: <Widget>[
                new Tab(
                  child: Text(
                    'Recipes',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                new Tab(
                  child: Text(
                    'Galleries',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                new Tab(
                  child: Text(
                    'Story',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 310,
            child: TabBarView(
              controller: controllerRecip,
              children: <Widget>[
                tabBarRecipes(),
                tabBarRecipes(),
                tabBarRecipes(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        child: TabBar(
            controller: controller,
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            isScrollable: false,
            labelColor: Color(0xFF4e9f72),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelColor:
            Colors.grey.withOpacity(0.7),
            tabs: [
              new Tab(icon: new Icon(Icons.home, size: 28,)),
              new Tab(icon: new Icon(Icons.flag, size: 28)),
              new Tab(icon: new Icon(Icons.verified_user, size: 28)),
              new Tab(icon: new Icon(Icons.account_box, size: 28)),
            ]
        ),
      ),
    );
  }

  tabBarRecipes() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("Recommended", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              Text("SEE ALL", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1.5, color: Color(0xFF4e9f72))),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildFoodCard("assets/pizza.jpg", "Quesadizzas", "Dinner", "Heavy Food", 4.5),
              _buildFoodCard("assets/wrap.jpg", "Mexican Wrap", "Dinner", "Heavy Food", 4.0),
              _buildFoodCard("assets/salad.jpg", "Chicken Salad", "Dinner", "Light Food", 5.0),
            ],
          ),
        )
      ],
    );
  }

  _buildFoodCard(String pic, String name, String gohan, String type, double rate) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 15),
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2)
          )
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0)
                ),
                image: DecorationImage(
                  image: AssetImage(pic),
                  fit: BoxFit.cover
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Text(gohan, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFd9d9d9))),
                      SizedBox(width: 20),
                      Text(type, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFd9d9d9))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RatingBar(
                        initialRating: rate,
                        allowHalfRating: true,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(rate.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
