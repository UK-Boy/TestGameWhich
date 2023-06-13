import 'dart:io';

class FileMan {
  static String _name = "";
  static File _file = File(_name);

  static Map<String, int> _ReadMap(String inputName) {
    _name = inputName;
    Map<String, int> output = {};
    String tempString = "";
    return output;
  }

  static void _WriteMap(String inputName, Map inputMap) {
    _name = inputName;
    String output = "";
    for (String x in inputMap.keys) {
      output += '$x;${inputMap[x]}\n';
    }
    _file.writeAsString(output);
  }

  static ReM(String inputName) => _ReadMap(inputName);
  static WriM(String inputName, Map inputMap) => _WriteMap(inputName, inputMap);
}
