import 'package:flutter/material.dart';
import 'package:markus/Objects/user.dart';
import 'package:markus/values.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 250,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      child: Text('Log In',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
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
                      child: Text('Sign In', style: TextStyle(fontSize: 18)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'signin');
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}