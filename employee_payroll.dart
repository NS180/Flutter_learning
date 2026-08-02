// Task: Employee Payroll Management System

import 'dart:io';

class Employee {
  String empId;
  String name;
  String department;

  Employee(this.empId, this.name, this.department);

  void displayEmployeeInfo() {
    print("Employee ID : $empId");
    print("Name        : $name");
    print("Department  : $department");
  }
}

class Payroll extends Employee {
  double basicSalary;
  double hra;
  double da;
  double bonus;

  Payroll(
    String empId,
    String name,
    String department,
    this.basicSalary,
    this.hra,
    this.da,
    this.bonus,
  ) : super(empId, name, department);

  // Step 4: Salary Calculation Functions
  double calculateGrossSalary() {
    return basicSalary + hra + da + bonus;
  }

  double calculateTax(double grossSalary) {
    if (grossSalary > 80000) {
      return grossSalary * 0.20; // 20% Tax
    } else if (grossSalary > 50000) {
      return grossSalary * 0.10; // 10% Tax
    } else {
      return 0.0; // No Tax
    }
  }

  double calculateNetSalary(double grossSalary, double tax) {
    return grossSalary - tax;
  }

  void displaySalarySlip() {
    double grossSalary = calculateGrossSalary();
    double tax = calculateTax(grossSalary);
    double netSalary = calculateNetSalary(grossSalary, tax);

    print("\n==========================================");
    print("         EMPLOYEE SALARY SLIP             ");
    print("==========================================");
    displayEmployeeInfo();
    print("");
    print("Basic Salary : ₹${basicSalary.toStringAsFixed(0)}");
    print("HRA          : ₹${hra.toStringAsFixed(0)}");
    print("DA           : ₹${da.toStringAsFixed(0)}");
    print("Bonus        : ₹${bonus.toStringAsFixed(0)}");
    print("");
    print("Gross Salary : ₹${grossSalary.toStringAsFixed(0)}");
    print("Tax          : ₹${tax.toStringAsFixed(0)}");
    print("Net Salary   : ₹${netSalary.toStringAsFixed(0)}");
    print("==========================================");
  }
}

// Additional Child Class demonstrating multi-level / extended inheritance
class ManagerPayroll extends Payroll {
  double performanceIncentive;

  ManagerPayroll(
    String empId,
    String name,
    String department,
    double basicSalary,
    double hra,
    double da,
    double bonus,
    this.performanceIncentive,
  ) : super(empId, name, department, basicSalary, hra, da, bonus);


  @override
  double calculateGrossSalary() {
    return super.calculateGrossSalary() + performanceIncentive;
  }
}

void main() {
  print("=== ENTER EMPLOYEE DETAILS ===");

  // Step 3: Taking User Input & Type Conversion
  stdout.write("Enter Employee ID: ");
  String empId = stdin.readLineSync() ?? "";

  stdout.write("Enter Name: ");
  String name = stdin.readLineSync() ?? "";

  stdout.write("Enter Department: ");
  String department = stdin.readLineSync() ?? "";

  stdout.write("Enter Basic Salary: ");
  double basicSalary = double.parse(stdin.readLineSync() ?? "0");

  stdout.write("Enter HRA: ");
  double hra = double.parse(stdin.readLineSync() ?? "0");

  stdout.write("Enter DA: ");
  double da = double.parse(stdin.readLineSync() ?? "0");

  stdout.write("Enter Bonus: ");
  double bonus = double.parse(stdin.readLineSync() ?? "0");
  Payroll empPayroll = Payroll(empId, name, department, basicSalary, hra, da, bonus);
  empPayroll.displaySalarySlip();
}