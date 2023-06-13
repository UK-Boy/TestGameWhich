import 'dart:io';

class GameSave {
  static final File _fileSave = File('save.txt');
  static final File _fileError = File('../../error_list.txt');

  /// записує у файл ключи[inputList.keys] = прокачка і тд ||
  /// значення inputList[element] = уровні
  static void _recordSave(Map inputList) {
    try {
      String tempLine = '';
      for (var element in inputList.keys) {
        tempLine += '$element;${inputList[element]}\n';
      }
      _fileSave.writeAsStringSync(tempLine, mode: FileMode.write);
    } catch (ex) {
      _fileError.writeAsStringSync('помилка запису Save\n$ex',
          mode: FileMode.append);
    }
  }

  /// читає з файлу ключи[key] = прокачка і тд || значення[value] = рівень і тд
  /// вертає [Map] в [get]
  static Map _readeSave() {
    try {
      Map<String, int> outputMap = {};
      var lineFile = _fileSave.readAsLinesSync();

      for (var element in lineFile) {
        var massWords = element.split(' ');
        if (massWords.length > 2) continue;
        String key = massWords[0];
        int value = int.parse(massWords[1]);
        outputMap.addAll({key: value});
      }
      return outputMap;
    } catch (ex) {
      _fileError.writeAsStringSync('помилка читання Save\n$ex',
          mode: FileMode.append);
      return {null: null};
    }
  }

  /// створення нового зберігання з приватного [_recordSave] через [set]
  static void set(Map inputListSave) => _recordSave(inputListSave);

  /// отримання останього зберігання з приватного [_readeSave] через [get]
  static Map get() => _readeSave();
}
