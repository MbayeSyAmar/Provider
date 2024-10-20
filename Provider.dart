// Importation des packages Flutter nécessaires pour créer l'interface utilisateur
import 'package:flutter/material.dart';

// Importation du package Provider pour la gestion de l'état
import 'package:provider/provider.dart';

// Fonction principale de l'application, point d'entrée
void main() {
  // runApp lance l'application Flutter
  runApp(
    // ChangeNotifierProvider est utilisé pour fournir une instance de Counter à l'application
    ChangeNotifierProvider(
      // create permet de créer une nouvelle instance de la classe Counter
      create: (context) => Counter(),
      // MyApp est le widget enfant qui va utiliser ce provider
      child: MyApp(),
    ),
  );
}

// Création de la classe Counter, qui est un ChangeNotifier
// Cette classe sera responsable de la gestion de l'état du compteur
class Counter extends ChangeNotifier {
  
  // Variable privée pour stocker la valeur du compteur
  int _count = 0;

  // Getter pour accéder à la valeur actuelle de _count
  int get count => _count;

  // Méthode pour incrémenter le compteur
  void increment() {
    _count++; // Incrémente le compteur
    // notifyListeners() notifie les widgets qui écoutent ce provider de mettre à jour leur état
    notifyListeners();
  }
}

// Classe MyApp, un StatelessWidget qui ne change pas d'état directement
class MyApp extends StatelessWidget {
  
  // La méthode build crée l'interface utilisateur
  @override
  Widget build(BuildContext context) {
    
    // Retourne un MaterialApp avec une structure de base (Scaffold)
    return MaterialApp(
      home: Scaffold(
        // Barre d'application avec un titre
        appBar: AppBar(title: Text('Provider Example')),
        
        // Le corps de la page, centré
        body: Center(
          // Utilisation d'un widget Column pour organiser les éléments verticalement
          child: Column(
            // Les enfants de la colonne sont centrés verticalement
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Texte qui affiche la valeur actuelle du compteur
              // Provider.of<Counter>(context).count récupère la valeur du compteur depuis le provider
              Text('Counter: ${Provider.of<Counter>(context).count}'),
              
              // Bouton qui permet d'incrémenter le compteur
              ElevatedButton(
                // La méthode onPressed est déclenchée lorsqu'on appuie sur le bouton
                onPressed: () {
                  // Provider.of<Counter>(context, listen: false).increment() appelle la méthode increment
                  // listen: false signifie que ce widget n'a pas besoin d'être mis à jour lorsque l'état change
                  Provider.of<Counter>(context, listen: false).increment();
                },
                // Texte affiché sur le bouton
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}