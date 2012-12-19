unit libcheck;

interface

uses lib;

{$IF Declared(lib_version)}
  {$IF (lib_version <> '1.0.0')}
    {$MESSAGE Fatal 'Incompatible lib version'}
  {$IFEND}
{$ELSE}
  {$MESSAGE Fatal 'Lib version undefined'}
{$IFEND}

implementation
end.
