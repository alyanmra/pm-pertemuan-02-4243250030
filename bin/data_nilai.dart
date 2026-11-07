void main() {
  final List<({String nama, int nilai})> kelas = [
    (nama: 'Andi', nilai: 85),
    (nama: 'Butet', nilai: 72),
    (nama: 'Citra', nilai: 58),
    (nama: 'Dimas', nilai: 91),
    (nama: 'Elisa', nilai: 66),
    (nama: 'Luna', nilai: 93),
    (nama: 'Sean', nilai: 75),
  ];

  // Skala contoh; sesuaikan dengan pedoman akademik yang berlaku.
  String huruf(int n) => n >= 85
      ? 'A'
      : n >= 70
      ? 'B'
      : n >= 60
      ? 'C'
      : n >= 50
      ? 'D'
      : 'E';

  print('${'Nama'.padRight(10)}${'Nilai'.padLeft(6)} Huruf');
  print('-' * 24);
  for (final m in kelas) {
    final baris = m.nama.padRight(10) + m.nilai.toString().padLeft(6);
    print('$baris ${huruf(m.nilai)}');
  }

  final int total = kelas.fold<int>(0, (sum, m) => sum + m.nilai);
  final double rataRata = total / kelas.length;
  final List<String> lulus = kelas
      .where((m) => m.nilai >= 60)
      .map((m) => m.nama)
      .toList();
  final terbaik = kelas.reduce((a, b) => a.nilai >= b.nilai ? a : b);
  final (:nama, :nilai) = terbaik; // destrukturisasi record

  print('-' * 24);
  print('Rata-rata kelas : ${rataRata.toStringAsFixed(1)}');
  print('Lulus (>= 60)   : ${lulus.join(', ')}');
  print('Nilai tertinggi : $nama ($nilai)');

  // Tantangan: urutkan dari nilai tertinggi
  final urut = kelas.toList()..sort((a, b) => b.nilai.compareTo(a.nilai));
  print('\nUrutan nilai tertinggi:');
  for (final m in urut) {
    print('${m.nama}: ${m.nilai}');
  }
}
