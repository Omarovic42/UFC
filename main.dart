import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MMACoachApp());
}

class MMACoachApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ULTIMATE FIGHT COACH',
      theme: ThemeData(
        primaryColor: Colors.red[900],
        colorScheme: ColorScheme.dark(
          primary: Colors.red[800]!,
          secondary: Colors.grey[800]!,
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[800],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[700]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[600]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red[700]!),
          ),
          labelStyle: TextStyle(color: Colors.grey[400]),
          fillColor: Colors.grey[900],
          filled: true,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Modèle d'IA pour la génération de programmes d'entraînement
class TrainingAI {
  final Random random = Random();
  
  // Base de données d'exercices par catégorie et niveau
  final Map<String, Map<String, Map<String, List<String>>>> exerciseDatabase = {
    'MMA': {
      'Cardio': {
        'Débutant': [
          'Marche rapide 20 min',
          'Shadow boxing léger 3x3 min',
          'Jogging 30 min à rythme modéré',
          'Travail au sac léger 2x3 min',
          'Corde à sauter débutant 3x1 min',
        ],
        'Intermédiaire': [
          'Corde à sauter 5x3 min (30s repos)',
          'HIIT circuit training 3 tours',
          'Sparring technique 3x3 min',
          'Course fractionée 10x30sec/30sec',
          'Circuit cardio boxe 4 stations',
        ],
        'Avancé': [
          'Sparring cardio 5x5 min (1min repos)',
          'Sprint 10x100m',
          'Circuit complet UFC style 5 tours',
          'Tabata MMA 8 cycles',
          'Session de frappe avec déplacements rapides',
        ],
      },
      'Force': {
        'Débutant': [
          'Pompes 3x10 (1min repos)',
          'Squats 3x15',
          'Crunchs 3x20',
          'Dips assistés 3x8',
          'Mountain climbers 3x30s',
        ],
        'Intermédiaire': [
          'Haltères press 4x8 reps',
          'Tractions assistées 3x8',
          'Développé militaire 3x10',
          'Circuit poids du corps 4 rounds',
          'Squats avec kettlebell 4x12',
        ],
        'Avancé': [
          'Soulevé de terre 5x5 (2min repos)',
          'Bench press 5x5',
          'Squats lourds 4x6',
          'Programme Khabib: 100 pompes, 100 tractions',
          'Clean and press 5x3',
        ],
      },
      'Explosivité': {
        'Débutant': [
          'Sauts sur box 3x8',
          'Sprint léger 5x30m',
          'Shadowboxing explosif 3x2min',
          'Jumping jacks explosifs 3x30s',
          'Squats sautés 3x10',
        ],
        'Intermédiaire': [
          'Lancers de médecine ball 4x10',
          'Burpees explosifs 4x10',
          'Pad work explosif 5x2min',
          'Montées de genoux explosives 4x20s',
          'Sprints avec changements de direction',
        ],
        'Avancé': [
          'Plyométrie avancée 5 exercices',
          'Sparring intensif 5x3min',
          'Explosivité de frappe sur sac lourd',
          'Exercices olympiques explosifs',
          'Double unders à la corde 5x45s',
        ],
      },
      'Technique': {
        'Débutant': [
          'Travail de base (garde, déplacements)',
          'Combos simples 1-2',
          'Défense basique',
          'Apprentissage du jab-cross',
          'Positions de base au sol',
        ],
        'Intermédiaire': [
          'Combinaisons avancées',
          'Contre-attaques',
          'Travail de clinch',
          'Défense et esquives avancées',
          'Transitions debout-sol',
        ],
        'Avancé': [
          'Stratégie de combat avancée',
          'Enchaînements sol-debout',
          'Timing et feintes',
          'Combos personnalisés avancés',
          'Drill spécifiques situation de combat',
        ],
      },
    },
    'Boxe': {
      'Cardio': {
        'Débutant': [
          'Corde à sauter 3x2 min',
          'Shadow boxing technique 3x2 min',
          'Jogging léger 20 min',
          'Footwork drills 3x2 min',
          'Déplacements latéraux 3x1 min',
        ],
        'Intermédiaire': [
          'Sparring léger 4x3 min',
          'Corde à sauter 5x3 min',
          'Circuit cardio-boxe 3 tours',
          'Travail de vitesse au sac 4x2 min',
          'Course fractionée 8x200m',
        ],
        'Avancé': [
          'Sparring intensif 5x3 min (1 min repos)',
          'Circuit pro-boxeur 5 stations',
          'HIIT spécial boxe 10 rounds',
          'Shadowboxing avec poids 5x3 min',
          'Tabata spécial uppercuts/crochets',
        ],
      },
      // Autres catégories pour la boxe...
    },
    'Muay Thai': {
      'Technique': {
        'Débutant': [
          'Travail de base des coups de pied',
          'Position de garde thaï',
          'Coups de genoux sur sac',
          'Blocages simples',
          'Low kicks techniques',
        ],
        'Intermédiaire': [
          'Clinch thaï basique',
          'Combinaisons pieds-poings',
          'Balayages et défenses',
          'Travail aux paos avancé',
          'Coups de coudes techniques',
        ],
        'Avancé': [
          'Clinch thaï avancé avec projections',
          'Enchaînements complexes pieds-genoux-coudes',
          'Stratégie de combat thaï',
          'Travail de timing sur les contres',
          'Sparring technique full thai rules',
        ],
      },
      // Autres catégories pour le Muay Thai...
    },
    'Jiu-Jitsu': {
      'Technique': {
        'Débutant': [
          'Positions de base (garde, montée, etc)',
          'Échappées de base',
          'Techniques de contrôle',
          'Passage de garde simple',
          'Soumissions fondamentales',
        ],
        'Intermédiaire': [
          'Sweeps depuis la garde',
          'Enchaînements de soumissions',
          'Défense contre les positions dominantes',
          'Étranglements variés',
          'Passage de garde avancé',
        ],
        'Avancé': [
          'Guard recovery techniques',
          'Soumissions non-conventionnelles',
          'Séquences de combat au sol',
          'Défense et contres avancés',
          'Leg locks et heel hooks',
        ],
      },
      // Autres catégories pour le Jiu-Jitsu...
    },
    'Lutte': {
      'Technique': {
        'Débutant': [
          'Positions de base debout',
          'Single leg takedown',
          'Double leg takedown',
          'Contrôle au sol basique',
          'Sprawl technique',
        ],
        'Intermédiaire': [
          'Combinaisons de takedowns',
          'Retours et reversals',
          'Techniques de ride (contrôle dessus)',
          'Défenses contre takedowns variés',
          'Clinch wrestling',
        ],
        'Avancé': [
          'Projections avancées',
          'Chain wrestling complexe',
          'Setups et feintes pour takedowns',
          'Positions dominantes avancées',
          'Techniques de pression et cardio-wrestling',
        ],
      },
      // Autres catégories pour la Lutte...
    },
  };

  // Conseils spécifiques par discipline
  final Map<String, List<String>> disciplineSpecificTips = {
    'MMA': [
      'Travaille la transition entre phases debout et sol',
      'Développe ton cardio spécifique MMA (différentes intensités)',
      'Familiarisez-vous avec les règles unifiées du MMA',
    ],
    'Boxe': [
      'Concentre-toi sur ton jeu de jambes et tes déplacements',
      'Pratique tes esquives et tes contre-attaques',
      'Travaille ton timing et ta distance de frappe',
    ],
    'Muay Thai': [
      'Renforce tes tibias progressivement pour les low kicks',
      'Pratique régulièrement le clinch thaï',
      'Développe ton équilibre sur une jambe pour les coups de pied',
    ],
    'Jiu-Jitsu': [
      'Travaille tes hanches et ta mobilité au sol',
      'Développe ta sensibilité au poids et à la pression',
      'Pratique le positionnement avant la soumission',
    ],
    'Lutte': [
      'Développe ta force explosive pour les takedowns',
      'Travaille ton cardio spécifique lutte',
      'Améliore ta posture et ta position de base',
    ],
  };

  // Méthode pour générer un programme personnalisé
  String generateProgram(String discipline, String goal, String level) {
    List<String> program = [];
    
    // Sélectionner des exercices spécifiques
    var availableExercises = exerciseDatabase[discipline]?[goal]?[level] ?? 
                            exerciseDatabase['MMA']?[goal]?[level] ?? [];
    
    // Prendre 3-5 exercices aléatoires sans répétition
    if (availableExercises.isNotEmpty) {
      availableExercises.shuffle(random);
      int exerciseCount = min(random.nextInt(3) + 3, availableExercises.length);
      program.addAll(availableExercises.take(exerciseCount));
    }
    
    // Ajouter un conseil spécifique à la discipline
    List<String> tips = disciplineSpecificTips[discipline] ?? disciplineSpecificTips['MMA']!;
    tips.shuffle(random);
    program.add('\nCONSEIL COACH: ${tips.first}');
    
    // Ajouter une note sur la récupération
    List<String> recoveryTips = [
      'Prévois au moins 1-2 jours de récupération entre les sessions intenses',
      'Assure-toi de bien t\'hydrater pendant l\'entraînement',
      'N\'oublie pas de t\'étirer après chaque session',
      'La nutrition est aussi importante que l\'entraînement pour progresser',
      'Écoute ton corps et adapte l\'intensité si nécessaire'
    ];
    recoveryTips.shuffle(random);
    program.add('\nRÉCUPÉRATION: ${recoveryTips.first}');
    
    return program.join('\n');
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedGoal = '';
  String selectedLevel = '';
  String program = '';
  final TrainingAI ai = TrainingAI();

  final List<String> disciplines = [
    'MMA',
    'Boxe',
    'Muay Thai',
    'Jiu-Jitsu',
    'Lutte'
  ];

  String selectedDiscipline = 'MMA';

  void generateProgram() {
    if (selectedGoal.isNotEmpty && selectedLevel.isNotEmpty) {
      setState(() {
        program = ''; // Reset program

        // Add loading effect
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: Colors.red[800]),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "L'IA analyse ton profil...",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );

        // Simuler le fonctionnement de l'IA
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Retirer le logo de chargement

          setState(() {
            // Utiliser l'IA pour générer le programme
            program = ai.generateProgram(
              selectedDiscipline,
              selectedGoal,
              selectedLevel
            );
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ULTIMATE FIGHT COACH',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.red[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://via.placeholder.com/1080/111111/333333?text=UFC+BACKGROUND'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900]!.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red[900]!, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.sports_mma, color: Colors.red[700]),
                        SizedBox(width: 8),
                        Text(
                          '🔥 PROGRAMME D\'ENTRAÎNEMENT IA',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'DISCIPLINE',
                        prefixIcon:
                            Icon(Icons.sports_mma, color: Colors.red[700]),
                      ),
                      dropdownColor: Colors.grey[800],
                      value: selectedDiscipline,
                      style: TextStyle(color: Colors.white),
                      items: disciplines
                          .map((discipline) => DropdownMenuItem(
                                value: discipline,
                                child: Text(discipline),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedDiscipline = value!),
                    ),
                    SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'OBJECTIF',
                        prefixIcon:
                            Icon(Icons.track_changes, color: Colors.red[700]),
                      ),
                      dropdownColor: Colors.grey[800],
                      value: selectedGoal.isEmpty ? null : selectedGoal,
                      style: TextStyle(color: Colors.white),
                      items: ['Cardio', 'Force', 'Explosivité', 'Technique']
                          .map((goal) => DropdownMenuItem(
                                value: goal,
                                child: Text(goal),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedGoal = value!),
                    ),
                    SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'NIVEAU',
                        prefixIcon:
                            Icon(Icons.fitness_center, color: Colors.red[700]),
                      ),
                      dropdownColor: Colors.grey[800],
                      value: selectedLevel.isEmpty ? null : selectedLevel,
                      style: TextStyle(color: Colors.white),
                      items: ['Débutant', 'Intermédiaire', 'Avancé']
                          .map((level) => DropdownMenuItem(
                                value: level,
                                child: Text(level),
                              ))
                          .toList(),
                      onChanged: (value) =>
                          setState(() => selectedLevel = value!),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: generateProgram,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.psychology), // Icône IA
                          SizedBox(width: 8),
                          Text('GÉNÉRES TA SÉANCE AVEC L\'IA'),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              program.isNotEmpty
                  ? Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[900]!.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red[800]!, width: 2),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.psychology, color: Colors.blue[300]),
                                  SizedBox(width: 8),
                                  Text(
                                    'PROGRAMME IA PERSONNALISÉ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Card(
                                color: Colors.grey[850],
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  leading: Icon(Icons.track_changes,
                                      color: Colors.red[700]),
                                  title: Text('OBJECTIF',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12)),
                                  subtitle: Text(selectedGoal,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Card(
                                color: Colors.grey[850],
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  leading: Icon(Icons.sports_mma,
                                      color: Colors.red[700]),
                                  title: Text('DISCIPLINE',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12)),
                                  subtitle: Text(selectedDiscipline,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Card(
                                color: Colors.grey[850],
                                margin: EdgeInsets.only(bottom: 16),
                                child: ListTile(
                                  leading: Icon(Icons.fitness_center,
                                      color: Colors.red[700]),
                                  title: Text('NIVEAU',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12)),
                                  subtitle: Text(selectedLevel,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Divider(color: Colors.red[800], thickness: 1),
                              SizedBox(height: 10),
                              Text(
                                'SÉANCES RECOMMANDÉES:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[400],
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey[800]!),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: program.split('\n').map((line) {
                                    if (line.startsWith('CONSEIL COACH:')) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[900]!.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.blue[700]!),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.lightbulb, color: Colors.amber),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  line,
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.blue[100],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else if (line.startsWith('RÉCUPÉRATION:')) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.green[900]!.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(8),
                                            border: Border.all(color: Colors.green[700]!),
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(Icons.healing, color: Colors.green[300]),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  line,
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.green[100],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else if (line.isNotEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('• ',
                                                style: TextStyle(
                                                    color: Colors.red[500],
                                                    fontWeight: FontWeight.bold)),
                                            Expanded(
                                              child: Text(
                                                line.startsWith('- ')
                                                    ? line.substring(2)
                                                    : line,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return SizedBox(height: 8);
                                    }
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.psychology,
                              size: 80,
                              color: Colors.blue[400]!.withOpacity(0.5),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'L\'IA est prête à te créer rapidement ton\nprogramme personnalisé selon tes envies',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Text('Accueil',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.video_library_outlined, color: Colors.white70),
                  Text('Vidéos',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today, color: Colors.white70),
                  Text('Planning',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outline, color: Colors.white70),
                  Text('Profil',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
