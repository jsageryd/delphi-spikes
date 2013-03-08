unit uSelectorList;

interface

uses
  Generics.Collections
  ;

type
  TEvaluator<T> = reference to function(Value: T): boolean;

  TSelectorEnumerator<T> = class(TEnumerator<T>)
  private
    FList: TList<T>;
    FEvaluator: TEvaluator<T>;
    FIndex: Integer;
    function GetCurrent: T;
  protected
    function DoGetCurrent: T; override;
    function DoMoveNext: Boolean; override;
  public
    constructor Create(AList: TList<T>; AEvaluator: TEvaluator<T>);
    property Current: T read GetCurrent;
    function MoveNext: Boolean;
  end;

  TSelectorEnumerable<T> = class
  private
    FOwner: TList<T>;
    FEvaluator: TEvaluator<T>;
  public
    constructor Create(AOwner: TList<T>; AEvaluator: TEvaluator<T>);
    function GetEnumerator: TSelectorEnumerator<T>;
  end;

  TSelectorList<T> = class(TList<T>)
  public
    function Where(AEvaluator: TEvaluator<T>): TSelectorEnumerable<T>;
  end;

implementation

{ TSelectorList<T> }

function TSelectorList<T>.Where(
  AEvaluator: TEvaluator<T>): TSelectorEnumerable<T>;
begin
  Result := TSelectorEnumerable<T>.Create(Self, AEvaluator);
end;

{ TSelectorEnumerator<T> }

constructor TSelectorEnumerator<T>.Create(AList: TList<T>;
  AEvaluator: TEvaluator<T>);
begin
  inherited Create;
  FList := AList;
  FEvaluator := AEvaluator;
  FIndex := -1;
end;

function TSelectorEnumerator<T>.DoGetCurrent: T;
begin
  Result := GetCurrent;
end;

function TSelectorEnumerator<T>.DoMoveNext: Boolean;
begin
  Result := MoveNext;
end;

function TSelectorEnumerator<T>.GetCurrent: T;
begin
  Result := FList[FIndex];
end;

function TSelectorEnumerator<T>.MoveNext: Boolean;
begin
  Inc(FIndex);
  while (FIndex < FList.Count) and not FEvaluator(FList[FIndex]) do begin
    Inc(FIndex);
  end;
  Result := FIndex < FList.Count;
end;

{ TSelectorEnumerable<T> }

constructor TSelectorEnumerable<T>.Create(AOwner: TList<T>;
  AEvaluator: TEvaluator<T>);
begin
  FOwner := AOwner;
  FEvaluator := AEvaluator;
end;

function TSelectorEnumerable<T>.GetEnumerator: TSelectorEnumerator<T>;
begin
  Result := TSelectorEnumerator<T>.Create(FOwner, FEvaluator);
end;

end.
