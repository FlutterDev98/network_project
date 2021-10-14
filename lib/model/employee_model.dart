class Employee {
  int? id;
  int? age;
  String? name;
  String? salary;

  Employee({this.id, this.name, this.salary, this.age});

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'salary': salary,
        'age': age,
      };
}
