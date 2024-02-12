// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io' show Platform, Directory;
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;
import 'generated_bindings.dart';

void main(List<String> arguments) {
  var libraryPath = path.join(Directory.current.path,
      '../shared_library/target/release', 'libshared_library.so');

  if (Platform.isMacOS) {
    libraryPath = path.join(Directory.current.path,
        '../shared_library/target/release', 'libshared_library.dylib');
  } else if (Platform.isWindows) {
    libraryPath = path.join(Directory.current.path,
        '../shared_library/target/release', 'shared_library.dll');
  }

  final rust = NativeLibrary(ffi.DynamicLibrary.open(libraryPath));

  final person = rust.create_person('Jaco van den Bosch'.toNativeUtf8().cast());
  rust.print_person(person);
}
