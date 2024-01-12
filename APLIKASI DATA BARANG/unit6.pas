unit Unit6;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids,
  Menus, ExtCtrls, ZConnection, ZDataset, LR_Class;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    frReport1: TfrReport;
    Image1: TImage;
    Label2: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form6: TForm6;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.Label2Click(Sender: TObject);
begin

end;

procedure TForm6.FormCreate(Sender: TObject);
begin

end;

procedure TForm6.Button1Click(Sender: TObject);

begin

end;

end.

