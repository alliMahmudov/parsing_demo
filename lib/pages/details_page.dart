import 'package:flutter/material.dart';
import 'package:parsing_demo/service/http_service.dart';

import '../model/emp_one.dart';
import '../model/user_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const String id = "detail_page";

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String getName = '';
  String getSalary = '';
  String getAge = '';
  int createId = 3666;
  String createName = '';
  String createSalary = '';
  String createAge = '';

  late int updateId;
  String updateName = '';
  String updateSalary = '';
  String updateAge = '';

  String deleteMessage = '';
  late EmpOne empOne;
  late User userDelete;
  late User user;
  late User userUpdate;

  // Get One
  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              empOne = Network.parseEmpOne(response!),
              setState(() {
                getName = empOne.data.name;
                getSalary = empOne.data.salary.toString();
                getAge = empOne.data.age.toString();
              }),
            });
  }

  // Create
  void _userCreate(User user) {
    Network.POST(Network.API_EMP_CREATE, Network.paramsCreate(user))
        .then((response) => {
              setState(() {
                createName = user.name;
                createSalary = user.salary.toString();
                createAge = user.age.toString();
              }),
            });
  }

  // Update
  void _userUpdate(User userUpdate) {
    Network.PUT(Network.API_EMP_UPDATE + userUpdate.id.toString(),
            Network.paramsUpdate(userUpdate))
        .then((response) => {
              setState(() {
                updateName = userUpdate.name;
                updateSalary = userUpdate.salary.toString();
                updateAge = userUpdate.age.toString();
                updateId = userUpdate.id;
              })
            });
  }

  // Delete
  void _userDelete(int id) {
    Network.DEL(Network.API_EMP_DELETE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              userDelete = Network.parseUserDelete(response!) as User,
              setState(() {
                deleteMessage = userDelete.id.toString();
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = User(id: 3666, name: "test", salary: "123", age: "23");
    userUpdate =
        User(id: 5717, name: "UpdatedTest", salary: "170.000\$", age: "19");

    _userCreate(user);
    _userUpdate(userUpdate);
    _userDelete(5717);
    _apiEmpOne(5717);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create method'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(40),
          children: [
            // Create parsing method
            Column(
              children: [
                // const Text("Create method", style: TextStyle(color: Colors.black, fontSize: 20),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'name' = $createName",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'salary' = $createSalary",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'age' = $createAge",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'id' = $createId",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(
              height: 70,
            ),
            // Update parsing method
            Column(
              children: [
                const Text(
                  "Updated version",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'name' = $updateName",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'salary' = $updateSalary",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'age' = $updateAge",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "'id' = $updateId",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),

            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Delete method",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  deleteMessage,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  "'name' = $deleteMessage",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  "'salary' = $deleteMessage",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  "'age' = $deleteMessage",
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
