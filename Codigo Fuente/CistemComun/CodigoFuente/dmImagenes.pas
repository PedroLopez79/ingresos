unit dmImagenes;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TdmImages = class(TDataModule)
    Imagenes: TImageList;
    MenuImages: TImageList;
    ToolBarImages: TImageList;
    EstadoBomba: TImageList;
    Imagenes2: TImageList;
    ToolBarImages2: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImages: TdmImages;

implementation

{$R *.dfm}

end.
