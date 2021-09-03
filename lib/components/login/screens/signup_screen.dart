import 'dart:html';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);
static const routeName ="/signup";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

final GlobalKey<FormState> _formkey = GlobalKey();
TextEditingController _passwordController = new TextEditingController();

void _submit(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.limeAccent,Colors.red,
              ]) ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value)

                            
                            {
                              if(value!.isEmpty || !value.contains('@'))
                              {
                                return 'invalid email';
                              }
                              return null;
                            },
                            onSaved: (value)
                            {

                            },
                            ),

                            TextFormField(
                              decoration: InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value)
                                {
                                  if(value!.isEmpty || value.length<=5)
                                  {
                                    return 'invalid password';
                                  }
                                  return null;
                                },
                                onSaved:(value)
                                {

                                },
                            ),

                            //Confirmation Password
 TextFormField(
                              decoration: InputDecoration(labelText: 'Confirm Password'),
                              obscureText: true,
                              validator: (value)
                                {
                                  // ignore: unrelated_type_equality_checks
                                  if(value!.isEmpty || value.length != _passwordController.text)
                                  {
                                    return 'password does not match';
                                  }
                                  return null;
                                },
                                onSaved:(value)
                                {

                                },
                            ),

                            SizedBox(height:30,),
                            RaisedButton(onPressed: (){_submit();},
                            child: Text('Submit'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                            )
                              ]
                            ),
                        
                      )
                    ),),
                ),
            ),
        ]
      )
    );
  }
}