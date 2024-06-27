import 'dart:collection';

// Struktur data untuk merepresentasikan pengguna
class Pengguna {
  final String nama;
  final DateTime waktuMulai;

  Pengguna(this.nama, this.waktuMulai);
}

class PengelolaAntrian {
  Queue<String> antrian = Queue<String>();
  Stack<Pengguna> stack = Stack<Pengguna>();

  // Method untuk menambahkan pengguna ke dalam antrian
  void tambahPengguna(String nama) {
    antrian.addLast(nama);
    print('$nama telah ditambahkan ke dalam antrian.');
  }

  // Method untuk melayani pengguna dari antrian
  void layaniPengguna() {
    if (antrian.isNotEmpty) {
      String dilayani = antrian.removeFirst();
      print('$dilayani sedang dilayani.');
    } else {
      print('Tidak ada pengguna dalam antrian.');
    }
  }

  // Method untuk melayani pengguna dari antrian dan menyimpannya dalam stack
  void layaniPenggunaDanSimpan() {
    if (antrian.isNotEmpty) {
      String dilayani = antrian.removeFirst();
      var waktuMulai = DateTime.now();
      var pengguna = Pengguna(dilayani, waktuMulai);
      stack.push(pengguna);
      print('$dilayani sedang dilayani dan disimpan dalam stack.');
    } else {
      print('Tidak ada pengguna dalam antrian.');
    }
  }

  // Method untuk menampilkan pengguna dalam antrian
  void tampilkanAntrian() {
    if (antrian.isNotEmpty) {
      print('Pengguna dalam antrian: ${antrian.join(', ')}');
    } else {
      print('Tidak ada pengguna dalam antrian.');
    }
  }

  // Method untuk menampilkan pengguna yang sedang dilayani
  void tampilkanPenggunaDilayani() {
    if (stack.isNotEmpty) {
      var pengguna = stack.top();
      print(
          'Pengguna yang sedang dilayani: ${pengguna.nama}, Waktu Mulai: ${pengguna.waktuMulai}');
    } else {
      print('Tidak ada pengguna yang sedang dilayani.');
    }
  }
}

// Implementasi Stack
class Stack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E top() => _list.last;

  bool get isEmpty => _list.isEmpty;

  bool get isNotEmpty => _list.isNotEmpty;
}

void main() {
  PengelolaAntrian pengelola = PengelolaAntrian();

  // Menambahkan beberapa pengguna ke dalam antrian
  pengelola.tambahPengguna('Anggita');
  pengelola.tambahPengguna('Karina');
  pengelola.tambahPengguna('Diki');

  // Menampilkan pengguna dalam antrian
  pengelola.tampilkanAntrian();

  // Melayani pengguna dari antrian
  pengelola.layaniPengguna();

  // Menampilkan pengguna dalam antrian setelah melayani satu pengguna
  pengelola.tampilkanAntrian();

  // Menambah pengguna baru ke dalam antrian
  pengelola.tambahPengguna('Intan');

  // Menampilkan pengguna dalam antrian
  pengelola.tampilkanAntrian();

  // Melayani pengguna dan menyimpannya dalam stack
  pengelola.layaniPenggunaDanSimpan();

  // Menampilkan pengguna yang sedang dilayani
  pengelola.tampilkanPenggunaDilayani();

  // Menampilkan pengguna dalam antrian setelah melayani satu pengguna
  pengelola.tampilkanAntrian();
}
