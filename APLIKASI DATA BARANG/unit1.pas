unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  CorrectUsername: string = 'admin'; // Ganti dengan nama pengguna yang benar
  CorrectPassword: string = '12345'; // Ganti dengan kata sandi yang benar

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = CorrectUsername) and (Edit2.Text = CorrectPassword) then
    begin
      Label4.Caption := 'Login Berhasil';

      // Buka form menu aplikasi (Form2)
      Form2.Show;
      Form1.Hide;
    end
    else
      Label4.Caption := 'Login Gagal';
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label4.Caption := '';
  Edit2.PasswordChar := '*'; // Menyembunyikan karakter-karakter kata sandi
end;

end.

