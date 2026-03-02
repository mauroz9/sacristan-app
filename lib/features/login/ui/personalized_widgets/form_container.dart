import 'package:flutter/material.dart';

class FormContainer extends StatefulWidget {
  const FormContainer({super.key});

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 400,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 94, 94, 94),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Este campo es obligatorio';
                    }else if(!_emailRegex.hasMatch(value)){
                      return 'Introduce una dirección email válida';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    focusColor: Color.fromRGBO(31, 60, 139, 1.0),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color.fromRGBO(31, 60, 139, 1.0), width: 2),
                    ),
                    hintText: 'Introduce tu email de usuario',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  "Contraseña",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 94, 94, 94),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Este campo es obligatorio';
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    focusColor: Color.fromRGBO(31, 60, 139, 1.0),
                    filled: true,
                    fillColor: Colors.grey[200],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color.fromRGBO(31, 60, 139, 1.0), width: 2),
                    ),
                    hintText: 'Introduce tu contraseña',
                  ),
                ),
                Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(
                    fontSize: 14,
                    color:Color.fromRGBO(31, 60, 139, 1.0)
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {if(_formKey.currentState!.validate()){
                Navigator.pushReplacementNamed(context, '/home');
              }},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromRGBO(31, 60, 139, 1.0),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
              ),
              child: Text(
                "Iniciar Sesión",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(height: 50,),
            Text("¿Necesitas ayuda? Contacta con tu profesor", style: TextStyle(color: Color.fromARGB(255, 94, 94, 94)),)
          ],
        ),
      ),
    );
  }
}
