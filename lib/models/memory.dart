class Memory {
  static const operations = <String>[ "%", "/", "x", "-", "+", "=" ];

  final List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = "0";
  bool _wipeValue = false;
  String? _lastCommand;

  String get value => this._value;

  void applyCommand(String command) {
    if (this._isReplacingOperation(command)) {
      this._operation = command;
      return;
    }

    if (command == "AC")
      this._allClear();
    else if (Memory.operations.contains(command))
      this._setOperation(command);
    else
      this._addDigit(command);

    this._lastCommand = command;
  }

  bool _isReplacingOperation(String command) {
    return Memory.operations.contains(_lastCommand) && Memory.operations.contains(command) && this._lastCommand != "=" && command != "=";
  }

  void _setOperation(String newOperation) {
    bool isEqualSign = newOperation == "=";

    if (this._bufferIndex == 0) {
      if (isEqualSign) return;
      this._operation = newOperation;
      this._bufferIndex = 1;
      this._wipeValue = true;
    } else {
      this._buffer[0] = this._calculate();
      this._buffer[1] = 0;
      this._value = this._buffer[0].toString();
      this._value = this._value.endsWith(".0") ? this._value.split(".")[0] : this._value;

      this._operation = isEqualSign ? null : newOperation;
      this._bufferIndex = isEqualSign ? 0 : 1;
    }

    this._wipeValue = true; // !isEqualSign;
  }

  void _addDigit(String digit) {
    final bool isComma = digit == ",";
    final bool wipeValue = this._value == "0" && !isComma || this._wipeValue;

    if (isComma && this._value.contains(",") && !wipeValue) return;

    final String emptyValue = isComma ? "0" : "";
    final String currentValue = wipeValue ? emptyValue : this.value;
    this._value = currentValue + digit;
    this._wipeValue = false;

    this._buffer[this._bufferIndex] = double.tryParse(this._value) ?? 0;
  }

  void _allClear() {
    this._value = "0";
    this._buffer.setAll(0, <double>[0.0, 0.0]);
    this._operation = null;
    this._bufferIndex = 0;
    this._wipeValue = false;
  }

  double _calculate() {
    switch (this._operation) {
      case "%": return this._buffer[0] % this._buffer[1];
      case "/": return this._buffer[0] / this._buffer[1];
      case "x": return this._buffer[0] * this._buffer[1];
      case "-": return this._buffer[0] - this._buffer[1];
      case "+": return this._buffer[0] + this._buffer[1];
      default: return this._buffer[0];
    }
  }
}