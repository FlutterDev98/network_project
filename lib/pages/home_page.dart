// ignore_for_file: prefer_const_declarations, prefer_const_constructors, unnecessary_null_comparison, prefer_if_null_operators, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:network_project/model/employee_model.dart';
import 'package:network_project/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = 'Home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //ALL EMPLOYEES LIST
    // _apiPostList();

    //SINGLE EMPLOYEE
    // var employee1 = Employee(id: 1);
    // _apiSingleEmployee(employee1);

    //EMPLOYEE POST CREATE
    // var employee2 =
    //     Employee(name: 'Flutter Developer', age: 23, salary: "Negotiable");
    // _apiEmployeeCreate(employee2);

    //EMPLOYEE POST UPDATE
    var employee3 = Employee(id: 1);
    // _apiEmployeeUpdate(employee3);

    //EMPLOYEE DELETE
    _apiEmployeeDelete(employee3);
  }

  //ALL EMPLOYEES LIST
  void _apiPostList() {
    Network.GET(Network.API_EMPLOYEE_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  //SINGLE EMPLOYEE
  void _apiSingleEmployee(Employee employee) {
    Network.GET(Network.API_SINGLE_EMPLOYEE + employee.id.toString(),
            Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  //EMPLOYEE POST CREATE
  void _apiEmployeeCreate(Employee employee) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(employee))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  //EMPLOYEE POST UPDATE
  void _apiEmployeeUpdate(Employee employee) {
    Network.PUT(Network.API_UPDATE + employee.id.toString(),
            Network.paramsUpdate(employee))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  //EMPLOYEE POST DELETE
  void _apiEmployeeDelete(Employee employee) {
    Network.DEL(
            Network.API_DELETE + employee.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(data != null ? data : "No Data"),
          ),
        ),
      ),
    );
  }
}
