unit libcheck;

interface

uses lib;

const bound_lib_version = '1.0.0';

{$IF Declared(lib_version)}
  {$IF (lib_version <> bound_lib_version)}
    {$MESSAGE Fatal 'Incompatible lib version'}
  {$IFEND}
{$ELSE}
  {$MESSAGE Fatal 'Lib version undefined'}
{$IFEND}

implementation
end.
