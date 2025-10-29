import 'dart:io';
import 'dart:math';

void main() {
  final randomizer = Randomizer();
  randomizer.run();
}

class Randomizer {
  final Random _random = Random();

  void run() {
    while (true) {
      _showMainMenu();
      final choice = _getInput('Pilih mode (1/2/3): ');

      switch (choice) {
        case '1':
          _teamDivider();
          break;
        case '2':
          _spinWheel();
          break;
        case '3':
          print('\nOke, gudbay brok!');
          return;
        default:
          print('Pilihan tidak valid!\n');
      }
    }
  }

  void _showMainMenu() {
    print('\n' + '=' * 40);
    print('RANDOMIZER APP'.padLeft(25));
    print('=' * 40);
    print('1. Team Divider - Bagi ke grup');
    print('2. Spin Wheel - Pilih satu per satu');
    print('3. Keluar');
    print('=' * 40);
  }

  void _teamDivider() {
    print('\n--- TEAM DIVIDER ---');
    
    final names = _getNames();
    if (names.isEmpty) return;

    final groupCount = _getGroupCount(names.length);
    if (groupCount == 0) return;

    final shuffled = List<String>.from(names)..shuffle(_random);
    final teams = _divideIntoTeams(shuffled, groupCount);

    print('\nHASIL PEMBAGIAN TIM:');
    print('=' * 40);
    for (var i = 0; i < teams.length; i++) {
      print('Tim ${i + 1}: ${teams[i].join(", ")}');
    }
    print('=' * 40);
    
    _pressEnterToContinue();
  }

  void _spinWheel() {
    print('\n--- SPIN WHEEL ---');
    
    final names = _getNames();
    if (names.isEmpty) return;

    var remaining = List<String>.from(names);
    var round = 1;

    while (remaining.isNotEmpty) {
      print('\nPutaran $round');
      print('Sisa peserta: ${remaining.length}');
      print('=' * 40);

      _animateSpin();
      
      final winner = remaining[_random.nextInt(remaining.length)];
      print('\nPEMENANG: $winner');
      print('=' * 40);

      remaining.remove(winner);

      if (remaining.isEmpty) {
        print('\nSemua peserta sudah terpilih!');
        break;
      }

      print('\nSisa peserta: ${remaining.join(", ")}');
      print('\n1. Spin lagi');
      print('2. Selesai');
      
      final choice = _getInput('Pilih (1/2): ');
      
      if (choice == '2') {
        print('\nSelesai!');
        break;
      } else if (choice != '1') {
        print('Pilihan tidak valid, kembali ke menu...');
        break;
      }

      round++;
    }

    _pressEnterToContinue();
  }

  List<String> _getNames() {
    print('\nMasukkan nama peserta (ketik "done" untuk selesai):');
    final names = <String>[];
    var index = 1;

    while (true) {
      final input = _getInput('${index}. ').trim();
      
      if (input.toLowerCase() == 'done') {
        break;
      }
      
      if (input.isEmpty) {
        print('Nama tidak boleh kosong!');
        continue;
      }

      names.add(input);
      index++;
    }

    if (names.isEmpty) {
      print('Kamu ga masukin pilihan brok');
      return [];
    }

    print('\nTotal ${names.length} peserta: ${names.join(", ")}');
    return names;
  }

  int _getGroupCount(int totalNames) {
    while (true) {
      final input = _getInput('\nMau dibagi jadi berapa grup? ');
      final count = int.tryParse(input);

      if (count == null || count <= 0) {
        print('Masukkan angka yang valid!');
        continue;
      }

      if (count > totalNames) {
        print('Jumlah grup tidak boleh lebih dari jumlah peserta ($totalNames)!');
        continue;
      }

      return count;
    }
  }

  List<List<String>> _divideIntoTeams(List<String> names, int groupCount) {
    final teams = List.generate(groupCount, (_) => <String>[]);
    
    for (var i = 0; i < names.length; i++) {
      teams[i % groupCount].add(names[i]);
    }

    return teams;
  }

  void _animateSpin() {
    final frames = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'];
    stdout.write('\nSpinning ');
    
    for (var i = 0; i < 20; i++) {
      stdout.write('\rSpinning ${frames[i % frames.length]} ');
      sleep(Duration(milliseconds: 100));
    }
    
    stdout.write('\r' + ' ' * 30 + '\r'); // Clear line
  }

  String _getInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync() ?? '';
  }

  void _pressEnterToContinue() {
    print('\nTekan Enter untuk kembali ke menu...');
    stdin.readLineSync();
  }
}