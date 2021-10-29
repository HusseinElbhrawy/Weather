void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  print(task2());
  // task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  var duration = Duration(seconds: 3);
  var result;
  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String result) {
  String result = 'task 3 data';
  print('Task 3 complete with $result');
}
