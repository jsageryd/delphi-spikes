Dependency check
================================

This is a spike project to test the idea of checking version
dependencies between a Delphi project and an external unit at
compile-time.

For this example, the external unit is called 'lib' and represents some
form of library.

- The application is able to display the version of the external library
  currently used.

- If the version cannot be determined the application will not compile.

- If the version declared in the library does not match the library
  version declared in the application, the application will not compile.
