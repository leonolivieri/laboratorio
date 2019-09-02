unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DBXJSONReflect,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    EdNome: TEdit;
    EdRg: TEdit;
    EdCpf: TEdit;
    EdTelefone: TEdit;
    EdEmail: TEdit;
    LbNome: TLabel;
    LbRg: TLabel;
    LbCpf: TLabel;
    LbTelefone: TLabel;
    LbEmail: TLabel;
    GroupBox3: TGroupBox;
    LbEndereco: TLabel;
    LbNumero: TLabel;
    LbBairro: TLabel;
    LbCidade: TLabel;
    LbEstado: TLabel;
    EdEndereco: TEdit;
    EdNumero: TEdit;
    EdBairro: TEdit;
    EdCidade: TEdit;
    EdEstado: TEdit;
    LbCep: TLabel;
    EdCep: TEdit;
    BtCep: TButton;
    EdPais: TEdit;
    LbPais: TLabel;
    EdComplemento: TEdit;
    Label1: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    IdSMTP1: TIdSMTP;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Consumirwebservice;
    procedure BtCepClick(Sender: TObject);
    procedure preencherlogradouro;
    procedure EdNumeroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure teste;
  end;

type
  TLogradouro = class(Tobject)
    private
      Fcep         : string;
      Fbairro      : string;
      Fnumero      : string;
      Fcidade      : string;
      Fendereco    : string;
      Festado      : string;
      Fcomplemento : string;
      Fibge        : string;
      procedure Setcep     (const Value: string);
      procedure Setbairro  (const Value: string);
      procedure Setcidade  (const Value: string);
      procedure Setendereco(const Value: string);
      procedure Setestado  (const Value: string);
      procedure Setnumero  (const Value: string);
      procedure Setcomplemento(const Value: string);
      procedure Setibge(const Value: string);
    public
      property cep         : string read Fcep      write Setcep;
      property endereco    : string read Fendereco write Setendereco;
      property complemento : string read Fcomplemento write Setcomplemento;
      property numero      : string read Fnumero   write Setnumero;
      property bairro      : string read Fbairro   write Setbairro;
      property cidade      : string read Fcidade   write Setcidade;
      property estado      : string read Festado   write Setestado;
      property ibge        : string  read Fibge write Setibge;
  end;

var
  Form4: TForm4;
  Logradouro: Tlogradouro;


implementation
uses
  system.json;

{$R *.dfm}

{ TLogradouro }

procedure TLogradouro.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TLogradouro.Setcep(const Value: string);
begin
  Fcep := Value;
end;

procedure TLogradouro.Setcidade(const Value: string);
begin
  Fcidade := Value;
end;

procedure TLogradouro.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TLogradouro.Setendereco(const Value: string);
begin
  Fendereco := Value;
end;

procedure TLogradouro.Setestado(const Value: string);
begin
  Festado := Value;
end;

procedure TLogradouro.Setibge(const Value: string);
begin
  Fibge := Value;
end;

procedure TLogradouro.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;



{ TForm4 }

procedure TForm4.FormCreate(Sender: TObject);
begin
  Logradouro := TLogradouro.Create;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Logradouro);
  Logradouro := nil;
end;

procedure TForm4.preencherlogradouro;
begin
  with logradouro do
    begin
      EdEndereco.Text:= endereco;
      EdComplemento.Text:= complemento;
      EdBairro.Text:= bairro;
      EdCidade.Text:= cidade;
      EdEstado.Text:= estado;
    end;
end;

procedure TForm4.BtCepClick(Sender: TObject);
begin
  Consumirwebservice;
  preencherlogradouro;
end;

procedure TForm4.Consumirwebservice;
var
 ObjJason: TJSONObject;
begin
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
  RESTRequest1.Resource := EdCep.Text+'/json/';
  RESTRequest1.Execute;
  ObjJason := RESTResponse1.JSONValue as TJSONObject;  with Logradouro do
    begin
      cep         := ObjJason.GetValue('cep').Value;
      endereco    := ObjJason.GetValue('logradouro').Value;
      complemento := ObjJason.GetValue('complemento').Value;
      bairro      := ObjJason.GetValue('bairro').Value;
      cidade      := ObjJason.GetValue('localidade').Value;
      estado      := ObjJason.GetValue('uf').Value;
      ibge        := ObjJason.GetValue('ibge').Value;
    end;
  EdNumero.SetFocus;
end;

procedure TForm4.EdNumeroExit(Sender: TObject);
begin
  logradouro.numero := Self.Text;
end;

procedure TForm4.teste;
begin
  logradouro := Tlogradouro.Create();
  logradouro.cep := '07230160';
end;

initialization


end.


end.
