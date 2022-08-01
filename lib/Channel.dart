import 'package:imageclassify/models/user.dart';
import 'package:flutter/material.dart';

class Channel extends StatelessWidget {
  const Channel({Key? key}) : super(key: key);

  //static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = [
    User(
        'DR(MRS) P. SENAKA',
        'Hambantota Hospital',
        'https://i1.rgstatic.net/ii/profile.image/751258864480260-1556125479393_Q512/Indira-Kahawita.jpg',
        false),
    User(
        'DR S. ABEYKEERTHI',
        'Anuradhapura Hospital',
        'https://groundviews.org/wp-content/uploads/2012/08/Screen-Shot-2012-08-27-at-11.37.32-PM.jpg',
        false),
    User(
        'DR V.G ABEYVIKRAMA',
        'Colombo Hospital',
        'https://www.nhk.health.gov.lk/images/mahendra/consultants/w_abeykoon.jpg',
        false),
    User(
        'DR UWAYSE AHAMED',
        'Colombo Hospital',
        'https://www.happysrilankans.com/wp-content/uploads/2020/11/Dr.-Uvais-Ahamed.jpg',
        false),
    User(
        'DR JANAKA AKARAWITA',
        'Colombo Hospital',
        'https://s3-us-west-1.amazonaws.com/co-directory-images/janaka-akarawita-6bb12843.jpg',
        false),
    User(
        'DR P. AKURUGODA',
        'Galle Hospital',
        'https://ochrehealth.com.au/wp-content/uploads/2020/08/Dr-Chameera-Akurugoda-400x400.jpeg',
        false),
    User('DR D.M AMARATHUNGA', 'Matara Hospital',
        'https://docplayer.net/docs-images/90/101512065/images/5-4.jpg', false),
    User('DR D. ARIYAWANSA', 'Ambalantoa Hospital',
        'https://i.ytimg.com/vi/IZYZJfqdvq8/maxresdefault.jpg', false),
    User(
        'DR G. ARSECULERATNE',
        'Gampaha Hospital',
        'https://bmkltsly13vb.compat.objectstorage.ap-mumbai-1.oraclecloud.com/cdn.ft.lk/assets/uploads/image_dcdad01ce0.jpg',
        false),
    User(
        'DR D. BANDARA',
        'Mathale Hospital',
        'https://umanitoba.ca/agricultural-food-sciences/sites/agricultural-food-sciences/files/styles/3x2_900w/public/2021-02/fhns-nandika-bandara.jpg',
        false),
    User(
        'DR MAHINDA DE SILVA',
        'Gampaha Hospital',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'DR UPENDRA DE SILVA',
        'Gampaha  Hospital',
        'https://images.unsplash.com/photo-1542534759-05f6c34a9e63?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'DR MANEL DISSANAYAKE',
        'Nugegoda  Hospital',
        'https://images.unsplash.com/photo-1516239482977-b550ba7253f2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'DR D.M.S DISSANAYAKE',
        'Matara  Hospital',
        'https://images.unsplash.com/photo-1542973748-658653fb3d12?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'DR S. EKANAYAKA',
        'Galle Hospital',
        'https://images.unsplash.com/photo-1569443693539-175ea9f007e8?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
    User(
        'DR(MRS) S FELECIA',
        'Karapitiya Hospital',
        'https://images.unsplash.com/photo-1541710430735-5fca14c95b00?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
        false),
  ];

  List<User> _foundedUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _foundedUsers = _users;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = _users
          .where((user) => user.username.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 38,
          child: TextField(
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search Docter Name or Distric"),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: _foundedUsers.length > 0
            ? ListView.builder(
                itemCount: _foundedUsers.length,
                itemBuilder: (context, index) {
                  return userComponent(user: _foundedUsers[index]);
                })
            : Center(
                child: Text(
                "No users found",
                style: TextStyle(color: Colors.black),
              )),
      ),
    );
  }

  userComponent({required User user}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(user.image),
                )),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(user.name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              Text(user.username, style: TextStyle(color: Colors.grey[500])),
            ])
          ]),
          GestureDetector(
            onTap: () {
              setState(() {
                user.isFollowedByMe = !user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
                height: 35,
                width: 110,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color:
                        user.isFollowedByMe ? Colors.redAccent : Color(0xfffff),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: user.isFollowedByMe
                          ? Colors.transparent
                          : Colors.black45,
                    )),
                child: Center(
                    child: Text(
                        user.isFollowedByMe ? 'Channeled' : 'Channel Info',
                        style: TextStyle(
                            color: user.isFollowedByMe
                                ? Colors.white
                                : Colors.black54)))),
          )
        ],
      ),
    );
  }
}
