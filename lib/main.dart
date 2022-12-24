import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_bar/login.dart';

void main() {
  runApp(MyHomePage());
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>MyHomePage(),
        '/login':(context)=>loginScreen(),

      },
      initialRoute: '/',
      home: Scaffold(
          appBar: AppBar(title:
          const Text("Hello 😊")),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                          'Menu', style: TextStyle(color: Colors.white, fontSize: 60)
                      ),
                      ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                        child:
                        Icon(Icons.login_rounded),)
                    ],
                  ),
                ),
                ),
              Container(
                child: Center(
                  child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 60)),
                ),
                color: Colors.grey,
              ),
              Container(
                child: Center(
                  child: Text('Chat', style: TextStyle(color: Colors.white, fontSize: 60)),
                ),
                color: Colors.blueGrey,
              ),
              Container(
                child: Center(
                  child: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 60)),
                ),
                color: Colors.cyanAccent,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index){
            setState(() {
              _pageController.jumpToPage(index);
            });

          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(title: Text("Menu"), icon: Icon(Icons.apps)),
            BottomNavyBarItem(title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavyBarItem(title: Text("Messages"), icon: Icon(Icons.chat_bubble)),
            BottomNavyBarItem(title: Text("Settings"), icon: Icon(Icons.settings)),

          ]
        ),
        drawer: Drawer(

          child: new ListView(
            children: [
              //header
              new UserAccountsDrawerHeader(accountName: Text('Anushka Mokashi'),
                  accountEmail: Text('anushkamokashi@gmail.com') )
            ],
          ),
        ),
      ),
    );

  }


  }

