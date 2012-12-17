unit libcheck;

interface

uses lib;

{$IF Declared(lib_version)}
  {$IF (lib_version <> '1.0.0')}
    Incompatible lib version.
  {$IFEND}
{$ELSE}
  Lib version undefined.
{$IFEND}

implementation
end.
