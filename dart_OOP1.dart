import 'dart:io';

abstract class HealthCareProfessional {
  void diagnose();
}

class Doctor implements HealthCareProfessional {
  String name;
  String specialization;

  Doctor(this.name, this.specialization);

  @override
  void diagnose() {
    print("$name, a $specialization, is diagnosing the patient.");
  }
}

class Nurse implements HealthCareProfessional {
  String name;
  String department;

  Nurse(this.name, this.department);

  @override
  void diagnose() {
    print(
        "$name, a nurse in the $department department, is assisting the patient.");
  }
}

class Patient {
  String name;
  int age;

  Patient(this.name, this.age);
}

void main() {
  Doctor doctor = Doctor("Dr. Smith", "Cardiologist");

  Nurse nurse = Nurse("Alice", "Cardiology");

  List<HealthCareProfessional> professionals = [doctor, nurse];
  for (var professional in professionals) {
    professional.diagnose();
  }

  Patient patient = readPatientDataFromFile("patient_data.txt");
  print("Patient Name: ${patient.name}, Age: ${patient.age}");

  for (int i = 0; i < 3; i++) {
    print("Loop iteration $i");
  }
}

Patient readPatientDataFromFile(String filePath) {
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();
  if (lines.length >= 2) {
    String name = lines[0];
    int age = int.tryParse(lines[1]) ?? 0;
    return Patient(name, age);
  } else {
    return Patient("Unknown", 0);
  }
}
