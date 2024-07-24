// import 'package:agrichapchap/constants/Appcolors.dart';
// import 'package:agrichapchap/constants/FormFieldDecoration.dart';
// import 'package:agrichapchap/types/farm_input.dart';
// import 'package:flutter/material.dart';
// import 'package:agrichapchap/constants/ButtonStyles.dart';

// class ProjectDetails extends StatefulWidget {
//   final String name;
//   final String description;

//   const ProjectDetails({
//     required this.name,
//     required this.description,
//     super.key,
//   });

//   @override
//   State<ProjectDetails> createState() => _ProjectDetailsState();
// }

// class _ProjectDetailsState extends State<ProjectDetails> {
//   final List<FarmInput> _farmInputs = [];

//   void _showAddFarmInputForm(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     final farmInputNameController = TextEditingController();
//     final farmInputQuantityController = TextEditingController();

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: farmInputNameController,
//                   decoration: formFieldDecoration('Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the farm input name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: farmInputQuantityController,
//                   decoration: formFieldDecoration('Cost'),
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the cost price';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   style: ButtonStyles.loginButtonStyle,
//                   onPressed: () {
//                     debugPrint(" saving farm input ");
//                     if (formKey.currentState!.validate()) {
//                       setState(() {
//                         _farmInputs.add(FarmInput(
//                           name: farmInputNameController.text,
//                           cost: 'KSh ${farmInputQuantityController.text}',
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
//                           child: Text('Add Farm Input'),
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

//   void _handleDelete(int index) {
//     setState(() {
//       _farmInputs.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Description:',
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             Text(
//               widget.description,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 16.0),
//             Text(
//               "FARM INPUTS",
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             const SizedBox(height: 16.0),
//             _farmInputs.isEmpty
//                 ? Text(
//                     "No farm inputs added",
//                     style: Theme.of(context).textTheme.bodyMedium,
//                   )
//                 : SingleChildScrollView(
//                     child: Table(
//                       border: TableBorder.all(
//                         color: Colors.grey,
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                       ),
//                       columnWidths: const {
//                         0: FlexColumnWidth(2),
//                         1: FlexColumnWidth(1),
//                         2: FlexColumnWidth(1),
//                       },
//                       children: [
//                         TableRow(
//                           decoration: BoxDecoration(
//                             color: Colors.blueGrey.shade100,
//                           ),
//                           children: const [
//                             Padding(
//                               padding: EdgeInsets.all(4.0),
//                               child: Text(
//                                 'Name',
//                                 style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(4.0),
//                               child: Text(
//                                 'Cost',
//                                 style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(4.0),
//                               child: Text(
//                                 'Action',
//                                 style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         for (int i = 0; i < _farmInputs.length; i++)
//                           TableRow(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(_farmInputs[i].name),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(_farmInputs[i].cost),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: IconButton(
//                                   icon: const Icon(Icons.delete,
//                                       color: Colors.red),
//                                   onPressed: () => _handleDelete(i),
//                                 ),
//                               ),
//                             ],
//                           ),
//                       ],
//                     ),
//                   ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.darkGreen,
//         shape: const CircleBorder(
//           eccentricity: 0,
//         ),
//         onPressed: () => _showAddFarmInputForm(context),
//         child: const Icon(
//           Icons.add,
//           color: AppColors.white,
//         ),
//       ),
//     );
//   }
// }

import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:agrichapchap/constants/ButtonStyles.dart';
import 'package:agrichapchap/constants/FormFieldDecoration.dart';
import 'package:agrichapchap/types/farm_input.dart';
import 'package:agrichapchap/types/project.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final Project project;

  const ProjectDetails({
    required this.project,
    super.key,
  });

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  void _showAddFarmInputForm() {
    final formKey = GlobalKey<FormState>();
    final farmInputNameController = TextEditingController();
    final farmInputQuantityController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
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
                    controller: farmInputNameController,
                    decoration: formFieldDecoration('Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the farm input name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: farmInputQuantityController,
                    decoration: formFieldDecoration('Cost'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the cost price';
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
                          widget.project.farmInputs.add(FarmInput(
                            name: farmInputNameController.text,
                            cost: farmInputQuantityController.text,
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
                            child: Text('Add Farm Input'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child:
                              Icon(Icons.add_circle_outline_rounded, size: 24),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleDelete(int index) {
    setState(() {
      widget.project.farmInputs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              widget.project.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),
            Text(
              "FARM INPUTS",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            widget.project.farmInputs.isEmpty
                ? Center(
                    child: Text(
                      'No farm inputs added',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )
                : SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(1),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                          ),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Cost',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Action',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...widget.project.farmInputs.asMap().entries.map(
                              (entry) => TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(entry.value.name),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(entry.value.cost),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _handleDelete(entry.key),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreen,
        onPressed: _showAddFarmInputForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
