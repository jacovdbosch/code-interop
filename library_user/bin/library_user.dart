import 'dart:io' show Platform, Directory;
import 'dart:ffi' as ffi;
import 'package:path/path.dart' as path;

typedef print_person_func = ffi.Void Function();
typedef PrintPerson = void Function();

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

  final print_person =
      dylib.lookupFunction<print_person_func, PrintPerson>('print_person');

  print_person();
}
