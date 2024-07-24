import 'package:agrichapchap/types/farm_input.dart';

class Project {
  final String name;
  final String description;
  final List<FarmInput> farmInputs;

  Project({
    required this.name,
    required this.description,
    this.farmInputs = const [],
  });
}
