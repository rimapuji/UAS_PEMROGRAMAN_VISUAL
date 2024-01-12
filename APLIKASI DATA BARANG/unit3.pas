unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, odbcconn, DB, Forms, Controls, Graphics, Dialogs,
  StdCtrls, DBGrids, DBCtrls, ZConnection, ZDataset, Grids, Menus, ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ZConnection1: TZConnection;
    ZConnection2: TZConnection;
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure SQLConnector1AfterConnect(Sender: TObject);
    procedure tombolmati();
    procedure kolommati();
    procedure kolombersih();
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.tombolmati();
begin
  Button1.Enabled := False;
  Button1.Visible := False;
  Button2.Enabled := False;
  Button2.Visible := False;
  Button3.Enabled := False;
  Button3.Visible := False;
  Button4.Enabled := False;
  Button4.Visible := False;
  Button5.Enabled := False;
  Button5.Visible := False;
end;

procedure TForm3.kolommati();
begin

end;

procedure TForm3.kolombersih();
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  kolombersih();
  Edit1.Enabled := True;
  Edit1.SetFocus;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := True;
  Button4.Visible := True;
  Button5.Visible := False;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Button1.Enabled:=false;
Button3.Enabled:=false;
Button4.Visible:=false;
Button5.Enabled:=true;
Button5.Visible:=true;
Button6.Enabled:=true;
Button6.Visible:=true;
Button7.Visible:=false;
//Mengisi kolom input dengan nilai dari database
Edit1.Text := ZQuery1.FieldByName('id_barang').AsString;
Edit2.Text := ZQuery1.FieldByName('kategori').AsString;
Edit3.Text := ZQuery1.FieldByName('nama').AsString;
Edit4.Text := ZQuery1.FieldByName('gambar').AsString;
Edit5.Text := ZQuery1.FieldByName('harga_beli').AsString;
Edit6.Text := ZQuery1.FieldByName('harga_jual').AsString;
Edit7.Text := ZQuery1.FieldByName('stok').AsString;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  // Kode untuk Button3Click
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  ZQuery2.SQL.Clear;
  ZQuery2.SQL.Add('INSERT INTO data_barang(id_barang, kategori, nama, gambar, harga_beli, harga_jual, stok) VALUES (' +
    QuotedStr(Edit1.Text) + ',' +
    QuotedStr(Edit2.Text) + ',' +
    QuotedStr(Edit3.Text) + ',' +
    QuotedStr(Edit4.Text) + ',' +
    QuotedStr(Edit5.Text) + ',' +
    QuotedStr(Edit6.Text) + ',' +
    QuotedStr(Edit7.Text) + ')');
  ZQuery2.ExecSQL;
  ZQuery1.Refresh;
  kolombersih();
end;

procedure TForm3.Button5Click(Sender: TObject);
var
  id_barang: string;
begin
  // Mendapatkan nilai id_barang dari ZQuery1
  id_barang := ZQuery1.FieldByName('id_barang').AsString;

  // Membersihkan pernyataan SQL dan menambahkan pernyataan UPDATE
  ZQuery2.SQL.Clear;
  ZQuery2.SQL.Add('UPDATE data_barang SET ' +
                  'kategori=' + QuotedStr(Edit2.Text) +
                  ', nama=' + QuotedStr(Edit3.Text) +
                  ', gambar=' + QuotedStr(Edit4.Text) +
                  ', harga_beli=' + QuotedStr(Edit5.Text) +
                  ', harga_jual=' + QuotedStr(Edit6.Text) +
                  ', stok=' + QuotedStr(Edit7.Text) +
                  ' WHERE id_barang=' + QuotedStr(id_barang));

  // Menjalankan pernyataan SQL UPDATE
  ZQuery2.ExecSQL;

  // Menampilkan pesan berhasil diubah
  ShowMessage('Data berhasil diubah');

  // Menonaktifkan dan membersihkan kolom dan tombol
  kolommati();
  kolombersih();
  tombolmati();

  // Mengaktifkan tombol-tombol lainnya
  Button1.Visible := True;
  Button1.Enabled := True;
  Button2.Visible := True;
  Button2.Enabled := True;
  Button3.Visible := True;
  Button3.Enabled := True;
  Button7.Visible := True;
  Button7.Enabled := True;

  // Merefresh ZQuery1 untuk mengupdate tampilan data
  ZQuery1.Refresh;
end;

procedure TForm3.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

end;

procedure TForm3.Edit1Change(Sender: TObject);
begin

end;

procedure TForm3.FormCreate(Sender: TObject);
begin

end;

procedure TForm3.Label2Click(Sender: TObject);
begin
  // Kode untuk Label2Click
end;

procedure TForm3.SQLConnector1AfterConnect(Sender: TObject);
begin
  // Kode untuk SQLConnector1AfterConnect
end;

end.

