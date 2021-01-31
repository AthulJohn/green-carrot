import 'package:flutter/material.dart';
import 'package:markus/Objects/user.dart';
import 'package:markus/items.dart';
import 'package:markus/to_Database/dbMethods.dart';
import 'package:markus/values.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            width: double.infinity,
            // height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'account',
                  child: Image(
                    height: 70,
                    width: 70,
                    image: AssetImage('assets/accountImage.png'),
                  ),
                ),
                user.signincheck()
                    ? Text(
                        user.getname(),
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                            child: Text('Log In',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                              setState(() {});
                            },
                            padding: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: colors[1],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FlatButton(
                            child:
                                Text('Sign In', style: TextStyle(fontSize: 18)),
                            onPressed: () {
                              Navigator.pushNamed(context, 'signin');
                              setState(() {});
                            },
                            padding: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: colors[3],
                          )
                        ],
                      ),
                ListTile(
                  title: Text('Cart'),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                ),
                ListTile(
                  title: Text('View Profile'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                ),
                ListTile(
                  title: Text('Edit Profile'),
                  leading: Icon(Icons.edit),
                  onTap: () {
                    // Navigator.pushNamed(context, 'cart');
                  },
                ),
                ListTile(
                  title: Text('Retake survey'),
                  leading: Icon(Icons.notes),
                  onTap: () {
                    // Navigator.pushNamed(context, 'cart');
                  },
                ),
                ListTile(
                  title: Text('Cart'),
                  leading: Icon(Icons.shopping_cart),
                  onTap: () {
                    Navigator.pushNamed(context, 'cart');
                  },
                ),
                if (user.signincheck())
                  ListTile(
                    title: Text('Sign Out'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      user.logout();
                      setState(() {});
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
