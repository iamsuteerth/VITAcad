enum Grades {
  S,
  A,
  B,
  C,
  D,
  E,
  F,
  N,
}

const Map<Grades, Grade> grades = {
  Grades.S: Grade(grade: 'S', val: 10),
  Grades.A: Grade(grade: 'A', val: 9),
  Grades.B: Grade(grade: 'B', val: 8),
  Grades.C: Grade(grade: 'C', val: 7),
  Grades.D: Grade(grade: 'D', val: 6),
  Grades.E: Grade(grade: 'E', val: 5),
  Grades.F: Grade(grade: 'F', val: 0),
  Grades.N: Grade(grade: 'N', val: 0),
};

class Grade {
  final String grade;
  final int val;
  const Grade({required this.grade, required this.val});
}
