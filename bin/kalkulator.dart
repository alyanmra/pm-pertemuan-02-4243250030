import 'dart:io';

void main() {
  stdout.write('Bilangan pertama         : ');
  final double? a = double.tryParse(stdin.readLineSync() ?? '');
  stdout.write('Operator (+ - * / ~/ %) : ');
  final String op = (stdin.readLineSync() ?? '').trim();
  stdout.write('Bilangan kedua           : ');
  final double? b = double.tryParse(stdin.readLineSync() ?? '');

  // Setelah pengecekan ini, a dan b otomatis dianggap double (bukan double?).
  if (a == null || b == null) {
    print('Input bukan angka yang valid.');
    return;
  }

  final num? hasil = switch (op) {
    '+' => a + b,
    '-' => a - b,
    '*' => a * b,
    '/' => b == 0 ? null : a / b,
    '~/' => b == 0 ? null : a ~/ b,
    '%' => b == 0 ? null : a % b,
    _ => null,
  };

  print(
    hasil == null
        ? 'Operator tidak dikenal atau pembagian dengan nol.'
        : '$a $op $b = $hasil',
  );
}
