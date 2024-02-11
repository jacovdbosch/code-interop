// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io' show Platform, Directory;
import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

typedef print_person_func = ffi.Void Function(Person person);
typedef PrintPerson = void Function(Person person);

typedef create_person_func = Person Function(ffi.Pointer<Utf8> name);
typedef CreatePerson = Person Function(ffi.Pointer<Utf8> name);

final class Person extends ffi.Struct {
  external ffi.Pointer<Utf8> name;
}

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

  var dylib = ffi.DynamicLibrary.open(libraryPath);

  final create_person =
      dylib.lookupFunction<create_person_func, CreatePerson>('create_person');
  final print_person =
      dylib.lookupFunction<print_person_func, PrintPerson>('print_person');

  final person = create_person('Jaco'.toNativeUtf8());
  print_person(person);
}
