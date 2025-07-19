import 'dart:io';

void main() {
  int n = 11;

  for (var i = 0; i < 6; i++) {
    for (int q = 0; q < n ~/ 2 - i; q++) {
      stdout.write(' ');
    }
   // print('\n');

    for (int j = n - i * 2; j >= 1; j--) {
      stdout.write('* ');
    }
  }
}
