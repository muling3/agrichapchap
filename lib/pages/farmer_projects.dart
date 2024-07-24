// import 'package:agrichapchap/pages/project_details.dart';
// import 'package:agrichapchap/types/project.dart';
// import 'package:flutter/material.dart';
// import 'package:agrichapchap/constants/Appcolors.dart';
// import 'package:agrichapchap/constants/ButtonStyles.dart';
// import 'package:agrichapchap/constants/FormFieldDecoration.dart';

// class FarmerProjects extends StatefulWidget {
//   const FarmerProjects({super.key});

//   @override
//   State<FarmerProjects> createState() => _FarmerProjectsState();
// }

// class _FarmerProjectsState extends State<FarmerProjects> {
//   final List<Project> _projects = [];

//   void _showProjectForm() {
//     final formKey = GlobalKey<FormState>();
//     final projectNameController = TextEditingController();
//     final projectDescController = TextEditingController();

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             left: 16.0,
//             right: 16.0,
//             top: 16.0,
//           ),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: projectNameController,
//                   decoration: formFieldDecoration('Name'),
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the project name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: projectDescController,
//                   decoration: formFieldDecoration('Description'),
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the project description';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   style: ButtonStyles.loginButtonStyle,
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       setState(() {
//                         _projects.add(Project(
//                           name: projectNameController.text,
//                           description: projectDescController.text,
//                         ));
//                       });
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Center(
//                           child: Text('Add Project'),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 8.0),
//                         child: Icon(Icons.add_circle_outline_rounded, size: 24),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _navigateToProjectDetails(String name, String description) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProjectDetails(
//           name: name,
//           description: description,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: _projects.isEmpty
//               ? Center(
//                   child: Text(
//                     'No projects added',
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _projects.length,
//                   itemBuilder: (context, index) {
//                     final project = _projects[index];
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 8.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         contentPadding: const EdgeInsets.all(16.0),
//                         title: Text(
//                           project.name,
//                           style: const TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         subtitle: Text(
//                           project.description,
//                           style: const TextStyle(
//                             fontSize: 14.0,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         tileColor: Colors.grey[200],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         onTap: () => _navigateToProjectDetails(
//                           project.name,
//                           project.description,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//         ),
//         Positioned(
//           bottom: 16.0,
//           right: 16.0,
//           child: FloatingActionButton(
//             backgroundColor: AppColors.darkGreen,
//             shape: const CircleBorder(
//               eccentricity: 0,
//             ),
//             onPressed: _showProjectForm,
//             child: const Icon(
//               Icons.add,
//               color: AppColors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:agrichapchap/pages/project_details.dart';
import 'package:agrichapchap/types/project.dart';
import 'package:flutter/material.dart';
import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:agrichapchap/constants/ButtonStyles.dart';
import 'package:agrichapchap/constants/FormFieldDecoration.dart';

class FarmerProjects extends StatefulWidget {
  const FarmerProjects({super.key});

  @override
  State<FarmerProjects> createState() => _FarmerProjectsState();
}

class _FarmerProjectsState extends State<FarmerProjects> {
  final List<Project> _projects = [];

  void _showProjectForm() {
    final formKey = GlobalKey<FormState>();
    final projectNameController = TextEditingController();
    final projectDescController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: projectNameController,
                  decoration: formFieldDecoration('Name'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: projectDescController,
                  decoration: formFieldDecoration('Description'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ButtonStyles.loginButtonStyle,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        _projects.add(Project(
                          name: projectNameController.text,
                          description: projectDescController.text,
                          farmInputs: [],
                        ));
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Add Project'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.add_circle_outline_rounded, size: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navigateToProjectDetails(Project project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetails(
          project: project,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _projects.isEmpty
              ? Center(
                  child: Text(
                    'No projects added',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : ListView.builder(
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    final project = _projects[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16.0),
                        title: Text(
                          project.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          project.description,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        onTap: () => _navigateToProjectDetails(project),
                      ),
                    );
                  },
                ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            backgroundColor: AppColors.darkGreen,
            shape: const CircleBorder(
              eccentricity: 0,
            ),
            onPressed: _showProjectForm,
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
