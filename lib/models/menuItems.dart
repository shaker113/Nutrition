import 'package:fina/data/imagepath.dart';

class MenuItem {
  final String imagURL;
  final String title;

  const MenuItem({
    required this.imagURL,
    required this.title,
  });
}

class MenuItems {
  static const List<MenuItem> menuItemList = [
    name,
    calories,
    suger,
    protein,
    fibers,
    carbs,
    fat
  ];
  static const calories = MenuItem(
    imagURL: caloriesIcon,
    title: "Calories",
  );
  static const name = MenuItem(
    imagURL: nameIcon,
    title: "Name",
  );
  static const protein = MenuItem(
    imagURL: proteinIcon,
    title: "Protein",
  );
  static const fibers = MenuItem(
    imagURL: fibersIcon,
    title: "Fibers",
  );
  static const carbs = MenuItem(
    imagURL: carbsIcon,
    title: "Carbs",
  );
  static const fat = MenuItem(
    imagURL: fatsIcon,
    title: "Fat",
  );
  static const suger = MenuItem(
    imagURL: sugarIcon,
    title: "Suger",
  );
}

class MainGoalItems {
  static const List<MenuItem> MainGoalItemsList = [
    keepFit,
    buildMuscle,
    loseWeight,
  ];
  static const keepFit = MenuItem(
    imagURL: "assets/images/fit.png",
    title: 'Keep Fit',
  );

  static const buildMuscle = MenuItem(
    imagURL: "assets/images/muscl.png",
    title: 'Build Muscle',
  );
  static const loseWeight = MenuItem(
    imagURL: "assets/images/2.png",
    title: 'Lose Weight',
  );
}
