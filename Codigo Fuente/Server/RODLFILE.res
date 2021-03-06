        ��  ��                  ��  0   ��
 R O D L F I L E                     <?xml version="1.0" encoding="utf-8"?>
<Library Name="LibraryIngresos" UID="{694D764B-832D-480C-893A-6E8B6B0FD1FC}" DontCodeGen="1" Version="3.0">
<Services>
<Service Name="DataAbstractService" UID="{709489E3-3AFE-4449-84C3-305C2862B348}" Abstract="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{4C2EC238-4FB4-434E-8CFF-ED25EEFF1525}">
<Documentation><![CDATA[   Service WinFormsDAServerService. This service has been automatically generated using the RODL template you can find in the Templates directory.]]></Documentation>
<Operations>
<Operation Name="GetSchema" UID="{684994AA-6829-4497-A054-0ACB6647E24F}">
<Parameters>
<Parameter Name="Result" DataType="Utf8String" Flag="Result">
</Parameter>
<Parameter Name="aFilter" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetData" UID="{7C394D25-2B02-4CC9-838B-7099B06F857C}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="aTableNameArray" DataType="StringArray" Flag="In" >
</Parameter>
<Parameter Name="aTableRequestInfoArray" DataType="TableRequestInfoArray" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="UpdateData" UID="{8FBDE1AF-A3DA-487A-9E08-FB7F446F8DC6}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="aDelta" DataType="Binary" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ExecuteCommand" UID="{BEBB190E-A511-4808-9424-5594CB5B5F58}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="aCommandName" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aParameterArray" DataType="DataParameterArray" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ExecuteCommandEx" UID="{B2C8E6DA-F233-4365-9F56-1590C0583604}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="aCommandName" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aInputParameters" DataType="DataParameterArray" Flag="In" >
</Parameter>
<Parameter Name="aOutputParameters" DataType="DataParameterArray" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetTableSchema" UID="{CFD45BA0-FD52-40C5-951A-08FF71CF5059}">
<Parameters>
<Parameter Name="Result" DataType="Utf8String" Flag="Result">
</Parameter>
<Parameter Name="aTableNameArray" DataType="StringArray" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetCommandSchema" UID="{15345F7D-9962-485C-B383-BCB0397DD50A}">
<Parameters>
<Parameter Name="Result" DataType="Utf8String" Flag="Result">
</Parameter>
<Parameter Name="aCommandNameArray" DataType="StringArray" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="SQLGetData" UID="{F3A01874-E954-48F5-9DB3-315F248A0E08}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="aSQLText" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aIncludeSchema" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="aMaxRecords" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="SQLGetDataEx" UID="{025A6E0D-8583-44C7-8F5F-6ADE175E446F}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="aSQLText" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aIncludeSchema" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="aMaxRecords" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="aDynamicWhereXML" DataType="Widestring" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="SQLExecuteCommand" UID="{C2525BDB-0CBA-4258-8016-37EB75C24BD7}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="aSQLText" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="SQLExecuteCommandEx" UID="{284F296C-A86B-410E-8A91-72D6E0DA86B9}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="aSQLText" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aDynamicWhereXML" DataType="Widestring" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetDatasetScripts" UID="{1025B82B-49FD-4D62-ACE1-908BAA8D330C}">
<Parameters>
<Parameter Name="Result" DataType="Utf8String" Flag="Result">
</Parameter>
<Parameter Name="DatasetNames" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RegisterForDataChangeNotification" UID="{3BFC17C7-6676-4B43-A90D-ABEC10072B48}">
<Parameters>
<Parameter Name="aTableName" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="UnregisterForDataChangeNotification" UID="{F3D1B5FB-42FA-46B4-8528-16CF915D4B4D}">
<Parameters>
<Parameter Name="aTableName" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
<Service Name="SimpleLoginService" UID="{4DD93F46-E044-47B9-A0F6-B45CD60A233A}" Ancestor="BaseLoginService" Abstract="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{B186853B-168B-4E33-B798-467444BFC8C6}">
<Operations>
<Operation Name="Login" UID="{87E7258D-59B1-4E76-8619-BF46780562F0}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="aUserID" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aPassword" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aUserInfo" DataType="UserInfo" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
<Service Name="BaseLoginService" UID="{745EED14-581E-47FC-B2BB-D4FAA6005B4F}" Abstract="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{C349DB54-9DFB-454E-AD23-6F2166A624A6}">
<Operations>
<Operation Name="LoginEx" UID="{2D036C75-65DC-42B0-B5AB-EC414F54B106}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="aLoginString" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Logout" UID="{866D0287-09D7-4368-AA5A-D4718CF698AF}">
<Parameters>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
<Service Name="MultiDbLoginService" UID="{78596023-A368-4490-8BE4-224987698117}" Ancestor="BaseLoginService" Abstract="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{2C6D5764-01CE-447A-8264-27210B2C7371}">
<Operations>
<Operation Name="Login" UID="{64F02AE6-1EFD-40FD-979E-D0CC21320CCB}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="aUserID" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aPassword" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aConnectionName" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="aUserInfo" DataType="UserInfo" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
<Service Name="MultiDbLoginServiceV5" UID="{059B0FA5-5980-4811-8C8E-790402D62C62}" Ancestor="MultiDbLoginService" Abstract="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{5A78AB01-2097-4473-A4D5-78980FFD90E4}">
<Operations>
<Operation Name="GetConnectionNames" UID="{BF3AE66F-A496-4B4D-AEDC-A484F8E2B20E}">
<Parameters>
<Parameter Name="Result" DataType="StringArray" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetDefaultConnectionName" UID="{BA63F191-03A5-48FB-99D7-F48B150CB1C6}">
<Parameters>
<Parameter Name="Result" DataType="Utf8String" Flag="Result">
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
<Service Name="ServiceIngresos" UID="{6A04A600-CA69-4FF9-9A98-B2FDA4B1D3C8}" Ancestor="DataAbstractService">
<Interfaces>
<Interface Name="Default" UID="{DB8D9395-4150-4DC0-85B8-CEDDC697105D}">
<Operations>
<Operation Name="AbreDataSetReportes" UID="{9AFAA76E-49DA-4A5B-B97E-F82208959F1A}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SQL" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Parametros" DataType="TParametrosBI" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="AbreTurno" UID="{CFD6CFDA-6827-4D94-9222-00B3B66CD03B}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="IDTURNO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDESTACION" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="FECHA" DataType="DateTime" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ObtenTurnosdeFecha" UID="{8EDC414D-4E02-4EED-B2BE-EDE216F14123}">
<Parameters>
<Parameter Name="Result" DataType="ATTurnoxFecha" Flag="Result">
</Parameter>
<Parameter Name="Fecha" DataType="DateTime" Flag="In" >
</Parameter>
<Parameter Name="Estacion" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="BuscarReporte" UID="{98950A8B-3CFF-4A32-9C00-9A42DD4491A7}">
<Parameters>
<Parameter Name="Result" DataType="TReporteBI" Flag="Result">
</Parameter>
<Parameter Name="Nombre" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DragPagoMateria" UID="{8BF34831-5626-428E-ABC8-10AAED785E53}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="PAGOMATERIA" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDGRUPOTARGET" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDGRUPOSOURCE" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ActualizaSubTipoPago" UID="{C6BF211D-8406-4264-A147-DFAC9550654C}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDTIPOPAGO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDSUBTIPOPAGO" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DatosFacturaElectronica" UID="{39577A1F-AF08-4992-8CF9-9817DB300769}">
<Parameters>
<Parameter Name="Result" DataType="TFacturaElectronicaBI" Flag="Result">
</Parameter>
<Parameter Name="FacturaID" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="NumeroEstacion" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DatosFactura" UID="{EC3F78A5-0908-4239-B785-D50DA409B3C0}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="Folio" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="Serie" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Fecha" UID="{B8E6A356-A790-47B0-B794-EA142307FB23}">
<Parameters>
<Parameter Name="Result" DataType="DateTime" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="Folio" UID="{BEE3719F-A773-4611-BFF1-12A9BEA6B9B8}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="Campo" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Serie" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GuardaDatosFactura" UID="{A03C560F-D0D5-446A-8DD2-71C599813280}">
<Parameters>
<Parameter Name="DatosFactura" DataType="TDatosFactura" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Login" UID="{E3CA3422-1DDA-4E81-BECA-65A492154835}">
<Parameters>
<Parameter Name="Result" DataType="TLoginInfoBI" Flag="Result">
</Parameter>
<Parameter Name="Usuario" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Clave" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="IniciaCiclo" UID="{75D43C7E-F7B1-46B5-AD0C-D162EE76C19F}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDCICLO" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ModificarFolioActual" UID="{06459A4C-645C-40E1-8DF4-274C58982AF3}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="Campo" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Serie" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="FolioNew" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="InsertaFacturaElectronica" UID="{AC1BD167-6C45-406E-8377-45415EF06A79}">
<Parameters>
<Parameter Name="FacturaElectronicaID" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="CadenaOriginal" DataType="Widestring" Flag="In" >
</Parameter>
<Parameter Name="SelloDigital" DataType="Widestring" Flag="In" >
</Parameter>
<Parameter Name="FacturaID" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="Vigencia" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="Enviado" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="NoCertificado" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="NoAprobacion" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="FechaAprobacion" DataType="DateTime" Flag="In" >
</Parameter>
<Parameter Name="XMLCFD" DataType="Widestring" Flag="In" >
</Parameter>
<Parameter Name="XMLCFDI" DataType="Widestring" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="FolioActual2" UID="{A23C3AA2-B406-4C78-A85B-D6280A1054BC}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="Serie" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="folio" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GuardaAccesos" UID="{A07C6F34-5DC7-40F6-87F6-FD96647B9930}">
<Parameters>
<Parameter Name="UsuarioID" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="Lista" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="EliminaMaestroDisponibilidad" UID="{4F79A34B-3F7D-4E6B-8AB4-2CD838973272}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDMAESTRODISPONIBILIDAD" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="EliminaMateriaMaestro" UID="{BA6F20D7-1C89-45C9-9883-D2FC3AC5663D}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDMAESTRO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDMATERIA" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="EliminaPago" UID="{979A127C-A353-4E60-AF4D-AA297C0B97C8}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="idSubtipoPago" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="status" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="idCiclos" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idGrupo" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="EliminaPagoCaja" UID="{116544AA-A44C-4F38-BC49-7542C5D8DC75}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="idSubtipoPago" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="status" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="idCiclos" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idGrupo" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="InsertaCaja" UID="{7EBEA38D-B4A0-401E-A551-034C871DBFDD}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="Observaciones" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="TipoPago" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="idEmpleado" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="LiquidaPago" UID="{6EF55EF4-F373-4EF2-9ABF-0E8D8B9CCB89}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="INTERES" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="IDEMPLEADO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDPAGO" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DividePago" UID="{9413A79E-943D-4D5A-8522-0C75A87E1666}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="idPago" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idEmpleado" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="Importes" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="Interes" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="InsertaPagoCaja" UID="{AB1D2C33-898B-4DD3-8763-2B3980240C13}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDPAGO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDCAJA" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="AplicaCalificacion" UID="{1FAC5381-073F-4793-A8A1-A6B2C4E7DDC1}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="Calificacion" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="Faltas" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idmaterias" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idhistorialalumno" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="idhistorialgrupo" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="fecha" DataType="DateTime" Flag="In" >
</Parameter>
<Parameter Name="idtipocalificacion" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="califAux2" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="califAux1" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="HistorialAlumnoDEL" UID="{5A247978-DCB0-43EE-8596-3956954F45CA}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDHISTORIALALUMNO" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="BecaDescuento" UID="{B838AD93-6AE2-43D4-91C5-D24FDACA8D62}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDHISTORIALALUMNO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="BECA" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="DESCUENTO" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="InsertaHistorialAlumno" UID="{61ECD6F0-A297-4FDC-AAE5-FBED628CF2ED}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDHISTORIALALUMNO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDHISTORIALGRUPO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDALUMNO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="DOCUMENTOSFALTANTES" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="BECA" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="DESCUENTO" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CambioGrupo" UID="{D932637B-BE40-4ADC-83C7-861C14304485}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="IDHISTORIALALUMNO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDHISTORIALGRUPO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="DOCUMENTOSFALTANTES" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="BECA" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="DESCUENTO" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="TipoCalificacion" UID="{ECD50991-EB65-49F3-9D50-C4C144EE9E81}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="DatosAlumno" UID="{454600EF-8E67-4D5E-AB2F-92C3320C023C}">
<Parameters>
<Parameter Name="Result" DataType="TDatos" Flag="Result">
</Parameter>
<Parameter Name="AlumnoID" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DatosMaestro" UID="{F7FF564D-321D-415F-AE33-D1C954D5CCFD}">
<Parameters>
<Parameter Name="Result" DataType="TDatos" Flag="Result">
</Parameter>
<Parameter Name="MaestroID" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="PagoBanco" UID="{E7B8EE8D-09EA-4077-B962-28427EB0A5BE}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="FECHAPAGO" DataType="DateTime" Flag="In" >
</Parameter>
<Parameter Name="IDEMPLEADO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="IDPAGO" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MONTO" DataType="Double" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="PrecioProducto" UID="{C3F37F4B-2D96-4EAA-A783-2641ADE94652}">
<Parameters>
<Parameter Name="Result" DataType="Double" Flag="Result">
</Parameter>
<Parameter Name="ProductoID" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="FolioActual" UID="{8CCD6B3A-88C6-4B2A-AA84-E514352CC71F}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="Campo" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Serie" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ValidaFolioFactura" UID="{BB0F725A-F45E-49DE-BED3-25DE1E72DDD7}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="Campo" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="Folio" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GuardarDatosFactura" UID="{EB8F71F6-E70D-479A-968F-ED84CDF9C63F}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="DatosFactura" DataType="TDatosFactura" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ActualizaTipoCampio" UID="{1B173D21-60BB-4B88-831D-C942E6FCEFF4}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="NUMEROESTACION" DataType="Int64" Flag="In" >
</Parameter>
<Parameter Name="FECHA" DataType="DateTime" Flag="In" >
</Parameter>
<Parameter Name="VALOR" DataType="Double" Flag="In" >
</Parameter>
<Parameter Name="IDMONEDA" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ObtenTipoValores" UID="{18823857-91DE-4A28-838A-EEAFD01D2B6B}">
<Parameters>
<Parameter Name="Result" DataType="ATTipoValores" Flag="Result">
</Parameter>
<Parameter Name="NUMEROESTACION" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="FECHA" DataType="DateTime" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CostoProducto" UID="{0142E95F-5A15-4846-BE8B-6BC5A42A8D7F}">
<Parameters>
<Parameter Name="Result" DataType="Double" Flag="Result">
</Parameter>
<Parameter Name="IDPRODUCTO" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Exporta" UID="{9C5986DB-29D1-4ED6-8F35-43AA1C15C0A1}">
<Parameters>
<Parameter Name="Result" DataType="TExporta" Flag="Result">
</Parameter>
<Parameter Name="ExportarID" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CierraLiquidacion" UID="{D88893FB-F31D-4CF6-8D41-487BF3FA19C4}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="LiquidacionID" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="comboestacion" UID="{7D1DEA1A-6F36-4CC1-9E8F-F5FE304EFB54}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="estacionid" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="comboscompras" UID="{6641D10D-F858-4866-9714-5433278C099D}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="estacionid" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="IANcomprasGuarda" UID="{92BCC253-E58B-4177-9AC5-EE4C464EAA88}">
<Parameters>
<Parameter Name="Result" DataType="AnsiString" Flag="Result">
</Parameter>
<Parameter Name="MovimientoAlmacenMaestro" DataType="AnsiString" Flag="In" >
</Parameter>
<Parameter Name="MovimientoAlmacenDetalle" DataType="AnsiString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
</Services>
<EventSinks>
<EventSink Name="DataChangeNotification" UID="{10309CDF-EA24-4F8B-9678-8D1EF426955F}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Interfaces>
<Interface Name="Default" UID="{1309480C-AEF8-48E0-A27F-E6090F441B46}">
<Operations>
<Operation Name="OnDataTableChanged" UID="{61437AB0-DD71-44D3-967A-25199CE8C1CD}">
<Parameters>
<Parameter Name="aTableName" DataType="Utf8String" Flag="In">
</Parameter>
<Parameter Name="aDelta" DataType="Binary" Flag="In">
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</EventSink>
</EventSinks>
<Structs>
<Struct Name="DataParameter" UID="{960C67F1-F39A-43EF-9D45-E091ACE04A86}" AutoCreateParams="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="Name" DataType="Utf8String">
</Element>
<Element Name="Value" DataType="Variant">
</Element>
</Elements>
</Struct>
<Struct Name="TableRequestInfo" UID="{AD4D327E-650E-42AF-8D57-1166124FB515}" AutoCreateParams="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="UserFilter" DataType="Utf8String">
</Element>
<Element Name="IncludeSchema" DataType="Boolean">
</Element>
<Element Name="MaxRecords" DataType="Integer">
<CustomAttributes>
<Default Value="-1" />
</CustomAttributes>
</Element>
<Element Name="Parameters" DataType="DataParameterArray">
</Element>
</Elements>
</Struct>
<Struct Name="UserInfo" UID="{C07A7008-F183-4015-9503-5C8FAE347E1C}" AutoCreateParams="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="SessionID" DataType="Utf8String">
</Element>
<Element Name="UserID" DataType="Utf8String">
</Element>
<Element Name="Privileges" DataType="StringArray">
</Element>
<Element Name="Attributes" DataType="VariantArray">
</Element>
<Element Name="UserData" DataType="Binary">
</Element>
</Elements>
</Struct>
<Struct Name="TableRequestInfoV5" UID="{F212B25A-167B-409C-BE99-23348E82AA5E}" AutoCreateParams="1" Ancestor="TableRequestInfo" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="WhereClause" DataType="Xml">
</Element>
<Element Name="DynamicSelectFieldNames" DataType="StringArray">
</Element>
<Element Name="Sorting" DataType="ColumnSorting">
</Element>
</Elements>
</Struct>
<Struct Name="ColumnSorting" UID="{81A8FAD7-B72D-4962-AD43-CD8E827DBC12}" AutoCreateParams="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="FieldName" DataType="Utf8String">
</Element>
<Element Name="SortDirection" DataType="ColumnSortDirection">
</Element>
</Elements>
</Struct>
<Struct Name="TableRequestInfoV6" UID="{9BC1458B-11F9-44EB-81D9-06198336F72D}" AutoCreateParams="1" Ancestor="TableRequestInfo" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="Sql" DataType="Widestring">
</Element>
</Elements>
</Struct>
<Struct Name="TLoginInfoBI" UID="{C135D80A-ED4E-4B18-A9B5-E6CD795B4232}" AutoCreateParams="1">
<Elements>
<Element Name="Valida" DataType="Boolean">
</Element>
<Element Name="EmpleadoID" DataType="Integer">
</Element>
<Element Name="NombreEmpleado" DataType="AnsiString">
</Element>
<Element Name="Accesos" DataType="ArrayOpcionBI">
</Element>
<Element Name="NumeroEstacion" DataType="Integer">
</Element>
</Elements>
</Struct>
<Struct Name="TOpcionBI" UID="{E828CE1C-A724-4B13-A7AB-251DD2DDABA6}" AutoCreateParams="1">
<Elements>
<Element Name="OpcionID" DataType="Integer">
</Element>
<Element Name="Nombre" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TDatosFactura" UID="{7B628C2D-03B5-4586-8980-A7C4D8682A0B}" AutoCreateParams="1">
<Elements>
<Element Name="Factura" DataType="TFactura">
</Element>
<Element Name="Detalles" DataType="ATDetalleFactura">
</Element>
<Element Name="Emisor" DataType="TEmisor">
</Element>
<Element Name="EmisorExpedidoEn" DataType="TEmisorExpedidoEn">
</Element>
<Element Name="Receptor" DataType="TReceptor">
</Element>
</Elements>
</Struct>
<Struct Name="TFactura" UID="{97445B5F-20F1-484F-A53D-9574DAE27798}" AutoCreateParams="1">
<Elements>
<Element Name="ClienteID" DataType="Integer">
</Element>
<Element Name="Ejercicio" DataType="Integer">
</Element>
<Element Name="FacturaID" DataType="Integer">
</Element>
<Element Name="Fecha" DataType="DateTime">
</Element>
<Element Name="FechaImpresion" DataType="DateTime">
</Element>
<Element Name="FechaVencimiento" DataType="DateTime">
</Element>
<Element Name="Folio" DataType="Integer">
</Element>
<Element Name="Impuesto" DataType="Double">
</Element>
<Element Name="MovimientoID" DataType="Integer">
</Element>
<Element Name="Saldo" DataType="Double">
</Element>
<Element Name="Serie" DataType="AnsiString">
</Element>
<Element Name="Subtotal" DataType="Double">
</Element>
<Element Name="Tickets" DataType="AnsiString">
</Element>
<Element Name="Total" DataType="Double">
</Element>
<Element Name="UsuarioID" DataType="Integer">
</Element>
<Element Name="Periodo" DataType="Integer">
</Element>
<Element Name="ImpuestoPorcentaje" DataType="Double">
</Element>
<Element Name="FormaPagoID" DataType="Integer">
</Element>
<Element Name="NumeroEstacion" DataType="Integer">
</Element>
<Element Name="IDCondicionPago" DataType="Integer">
</Element>
<Element Name="MetodoPago" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TDetalleFactura" UID="{17F64C98-AFDD-4625-A000-6344F5A4ADAC}" AutoCreateParams="1">
<Elements>
<Element Name="DetalleFacturaID" DataType="Integer">
</Element>
<Element Name="FacturaID" DataType="Integer">
</Element>
<Element Name="Cantidad" DataType="Double">
</Element>
<Element Name="Precio" DataType="Double">
</Element>
<Element Name="Importe" DataType="Double">
</Element>
<Element Name="ProductoID" DataType="Integer">
</Element>
<Element Name="Unidad" DataType="AnsiString">
</Element>
<Element Name="Descripcion" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TParametrosBI" UID="{5D8AE8C4-BDBF-4836-9619-DD3BFEA298FE}" AutoCreateParams="1">
<Elements>
<Element Name="FechaIni" DataType="DateTime">
</Element>
<Element Name="FechaFin" DataType="DateTime">
</Element>
<Element Name="Usuario" DataType="Integer">
</Element>
<Element Name="Valor1" DataType="Integer">
</Element>
<Element Name="Status" DataType="AnsiString">
</Element>
<Element Name="Serie" DataType="AnsiString">
</Element>
<Element Name="Factura" DataType="Integer">
</Element>
<Element Name="IDTurno" DataType="Integer">
</Element>
<Element Name="FacturasCompras" DataType="Integer">
</Element>
<Element Name="TurnoInicio" DataType="Integer">
</Element>
<Element Name="TurnoFin" DataType="Integer">
</Element>
<Element Name="NumeroEstacion" DataType="Integer">
</Element>
<Element Name="HorarioIni" DataType="Integer">
</Element>
<Element Name="HorarioFin" DataType="Integer">
</Element>
<Element Name="NumeroEstacionIni" DataType="Integer">
</Element>
<Element Name="NumeroEstacionFin" DataType="Integer">
</Element>
<Element Name="ClienteIni" DataType="Integer">
</Element>
<Element Name="ClienteFin" DataType="Integer">
</Element>
<Element Name="Estacion" DataType="Integer">
</Element>
<Element Name="SecuenciaIni" DataType="Integer">
</Element>
<Element Name="SecuenciaFin" DataType="Integer">
</Element>
<Element Name="FolioFactura" DataType="Integer">
</Element>
<Element Name="Ejercicio" DataType="Integer">
</Element>
<Element Name="PeriodoFin" DataType="Integer">
</Element>
<Element Name="Periodo" DataType="Integer">
</Element>
<Element Name="Dia" DataType="Integer">
</Element>
<Element Name="EjercicioFin" DataType="Integer">
</Element>
<Element Name="DiaFin" DataType="Integer">
</Element>
<Element Name="Secuencia" DataType="AnsiString">
</Element>
<Element Name="Agrupacion" DataType="Integer">
</Element>
<Element Name="Almacen" DataType="Integer">
</Element>
<Element Name="SecuenciaIniLiquidacion" DataType="Integer">
</Element>
<Element Name="SecuenciaFinLiquidacion" DataType="Integer">
</Element>
<Element Name="MontoFacturado" DataType="Integer">
</Element>
<Element Name="Turno" DataType="Integer">
</Element>
<Element Name="EmpleadoIni" DataType="Integer">
</Element>
<Element Name="EmpleadoFin" DataType="Integer">
</Element>
<Element Name="EstacionIni" DataType="Integer">
</Element>
<Element Name="EstacionFin" DataType="Integer">
</Element>
</Elements>
</Struct>
<Struct Name="TReporteBI" UID="{840FE4EB-19A1-4A81-B571-222CBB15F87A}" AutoCreateParams="1">
<Elements>
<Element Name="SQL1" DataType="AnsiString">
</Element>
<Element Name="SQL2" DataType="AnsiString">
</Element>
<Element Name="Template" DataType="AnsiString">
</Element>
<Element Name="CampoJoin" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TFacturaElectronicaBI" UID="{DE871D13-47BB-450E-BAA0-B48738C3E28F}" AutoCreateParams="1">
<Elements>
<Element Name="Serie" DataType="AnsiString">
</Element>
<Element Name="Folio" DataType="AnsiString">
</Element>
<Element Name="Fecha" DataType="AnsiString">
</Element>
<Element Name="noAprobacion" DataType="AnsiString">
</Element>
<Element Name="anoAprobacion" DataType="AnsiString">
</Element>
<Element Name="tipoComprobante" DataType="AnsiString">
</Element>
<Element Name="formadePago" DataType="AnsiString">
</Element>
<Element Name="SubTotal" DataType="AnsiString">
</Element>
<Element Name="Total" DataType="AnsiString">
</Element>
<Element Name="RFCEmisor" DataType="AnsiString">
</Element>
<Element Name="NomEmpEmisor" DataType="AnsiString">
</Element>
<Element Name="DireccionEm" DataType="AnsiString">
</Element>
<Element Name="NoExteriorEM" DataType="AnsiString">
</Element>
<Element Name="ColoniaEmisor" DataType="AnsiString">
</Element>
<Element Name="MunicipioEmisor" DataType="AnsiString">
</Element>
<Element Name="EstadoEmisor" DataType="AnsiString">
</Element>
<Element Name="PaisEmisor" DataType="AnsiString">
</Element>
<Element Name="CodigoPostalEmisor" DataType="AnsiString">
</Element>
<Element Name="RFCReceptor" DataType="AnsiString">
</Element>
<Element Name="NombreReceptor" DataType="AnsiString">
</Element>
<Element Name="DomicilioReceptor" DataType="AnsiString">
</Element>
<Element Name="NoExteriorReceptor" DataType="AnsiString">
</Element>
<Element Name="ColoniaReceptor" DataType="AnsiString">
</Element>
<Element Name="LocalidadReceptor" DataType="AnsiString">
</Element>
<Element Name="MunicipioReceptor" DataType="AnsiString">
</Element>
<Element Name="EstadoReceptor" DataType="AnsiString">
</Element>
<Element Name="PaisReceptor" DataType="AnsiString">
</Element>
<Element Name="CodigoPostalReceptor" DataType="AnsiString">
</Element>
<Element Name="FacturaElectronicaDetalleImportes" DataType="ATFacturaElectronicaDetalleImportes">
</Element>
<Element Name="FacturaElectronicaDetalleImpuestos" DataType="ATFacturaElectronicaDetalleImpuestos">
</Element>
<Element Name="TotalImpuesto" DataType="AnsiString">
</Element>
<Element Name="CalleExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="NoExterioExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="ColoniaExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="CodigoPostalExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="LocalidadExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="MunicipioExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="EstadoExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="PaisExpedidoEn" DataType="AnsiString">
</Element>
<Element Name="Sucursal" DataType="Boolean">
</Element>
<Element Name="email" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TFacturaElectronicaDetalleImporteBI" UID="{FBD267C3-B6F1-4C16-A019-A6221A87B2E2}" AutoCreateParams="1">
<Elements>
<Element Name="CantidadReceptor" DataType="AnsiString">
</Element>
<Element Name="UnidadReceptor" DataType="AnsiString">
</Element>
<Element Name="DescripcionReceptor" DataType="AnsiString">
</Element>
<Element Name="ValorUnitarioReceptor" DataType="AnsiString">
</Element>
<Element Name="ImporteReceptor" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TFacturaElectronicaDetalleImpuestosBI" UID="{CD5F54A2-5CC5-4003-A111-3D09478893BF}" AutoCreateParams="1">
<Elements>
<Element Name="ImpuestoReceptor" DataType="AnsiString">
</Element>
<Element Name="TasaReceptor" DataType="AnsiString">
</Element>
<Element Name="ImporteImpReceptor" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TDataFacturaElectronicaBI" UID="{D05F0D74-6FA3-4DB7-881C-84624ECF54FA}" AutoCreateParams="1">
<Elements>
<Element Name="FacturaElectronicaBI" DataType="TFacturaElectronicaBI">
</Element>
<Element Name="CadenaOriginal" DataType="Widestring">
</Element>
<Element Name="SelloDigital" DataType="AnsiString">
</Element>
<Element Name="NumCertificado" DataType="AnsiString">
</Element>
<Element Name="Certificado" DataType="Widestring">
</Element>
</Elements>
</Struct>
<Struct Name="TDatos" UID="{4DE2E682-9AD3-458A-A66E-36D0E9E443BE}" AutoCreateParams="1">
<Elements>
<Element Name="Nombre" DataType="AnsiString">
</Element>
<Element Name="CODIGO" DataType="AnsiString">
</Element>
<Element Name="DIRECCION" DataType="AnsiString">
</Element>
<Element Name="IMSS" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TTipoValores" UID="{200C88A2-69BB-45EF-82B8-DEB5D8A517B4}" AutoCreateParams="1">
<Elements>
<Element Name="IDMONEDA" DataType="Integer">
</Element>
<Element Name="VALOR" DataType="Double">
</Element>
</Elements>
</Struct>
<Struct Name="TCampo" UID="{F2A7D801-7E67-4528-A5F0-60DBD78EC050}" AutoCreateParams="1">
<Elements>
<Element Name="Nombre" DataType="AnsiString">
</Element>
<Element Name="Size" DataType="Integer">
</Element>
<Element Name="Formato" DataType="AnsiString">
</Element>
<Element Name="Tipo" DataType="Integer">
</Element>
</Elements>
</Struct>
<Struct Name="TExporta" UID="{33317F60-185B-4A17-B8E7-A41B38F1F72D}" AutoCreateParams="1">
<Elements>
<Element Name="Nombre" DataType="AnsiString">
</Element>
<Element Name="Campos" DataType="ACampos">
</Element>
<Element Name="Pasos" DataType="APasos">
</Element>
<Element Name="Template" DataType="AnsiString">
</Element>
<Element Name="ScriptExporta" DataType="AnsiString">
</Element>
<Element Name="ScriptDatos" DataType="AnsiString">
</Element>
<Element Name="Parametros" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TParametrosExporta" UID="{16B672E9-8823-43D4-97E4-144B2DC8FD87}" AutoCreateParams="1">
<Elements>
<Element Name="Poliza" DataType="Integer">
</Element>
<Element Name="EstacionIni" DataType="Integer">
</Element>
<Element Name="EstacionFin" DataType="Integer">
</Element>
<Element Name="TurnoIni" DataType="Integer">
</Element>
<Element Name="TurnoFin" DataType="Integer">
</Element>
<Element Name="FechaIni" DataType="DateTime">
</Element>
<Element Name="FechaFin" DataType="DateTime">
</Element>
</Elements>
</Struct>
<Struct Name="TPasos" UID="{038D01B4-48AB-4B4B-BB01-E4386ACB6EBA}" AutoCreateParams="1">
<Elements>
<Element Name="Server" DataType="TServer">
</Element>
<Element Name="SQL" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TServer" UID="{6415BEF3-8EF8-41E7-9365-B3C1393E4F33}" AutoCreateParams="1">
<Elements>
<Element Name="ServidorID" DataType="Integer">
</Element>
<Element Name="Host" DataType="AnsiString">
</Element>
<Element Name="Estaciones" DataType="AEstaciones">
</Element>
</Elements>
</Struct>
<Struct Name="TEstacion" UID="{3A3925D4-A188-4511-BECB-930F0B8D2063}" AutoCreateParams="1">
<Elements>
<Element Name="EstacionID" DataType="Integer">
</Element>
<Element Name="Host" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TTurnoxFecha" UID="{031E3F01-10B4-43A0-80BF-2A3AAB29DD55}" AutoCreateParams="1">
<Elements>
<Element Name="IDTURNO" DataType="Integer">
</Element>
<Element Name="FECHA" DataType="DateTime">
</Element>
<Element Name="IDHORARIO" DataType="Integer">
</Element>
</Elements>
</Struct>
<Struct Name="TEmisor" UID="{B9D842C1-9F24-43EB-B65C-EFC448525E37}" AutoCreateParams="1">
<Elements>
<Element Name="RFC" DataType="AnsiString">
</Element>
<Element Name="NOMBRE" DataType="AnsiString">
</Element>
<Element Name="CALLE" DataType="AnsiString">
</Element>
<Element Name="NOEXTERIOR" DataType="AnsiString">
</Element>
<Element Name="NOINTERIOR" DataType="AnsiString">
</Element>
<Element Name="CODIGOPOSTAL" DataType="AnsiString">
</Element>
<Element Name="COLONIA" DataType="AnsiString">
</Element>
<Element Name="MUNICIPIO" DataType="AnsiString">
</Element>
<Element Name="ESTADO" DataType="AnsiString">
</Element>
<Element Name="PAIS" DataType="AnsiString">
</Element>
<Element Name="LOCALIDAD" DataType="AnsiString">
</Element>
<Element Name="REGIMENFISCAL" DataType="AnsiString">
</Element>
<Element Name="METODOPAGO" DataType="AnsiString">
</Element>
<Element Name="ARCHIVOCERTIFICADO" DataType="AnsiString">
</Element>
<Element Name="ARCHIVOLLAVEPRIVADA" DataType="AnsiString">
</Element>
<Element Name="CLAVELLAVEPRIVADA" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TEmisorExpedidoEn" UID="{4AF1FB5C-DB0E-47C4-B02C-C5A29E2686AF}" AutoCreateParams="1">
<Elements>
<Element Name="CALLE" DataType="AnsiString">
</Element>
<Element Name="NOEXTERIOR" DataType="AnsiString">
</Element>
<Element Name="NOINTERIOR" DataType="AnsiString">
</Element>
<Element Name="CODIGOPOSTAL" DataType="AnsiString">
</Element>
<Element Name="COLONIA" DataType="AnsiString">
</Element>
<Element Name="MUNICIPIO" DataType="AnsiString">
</Element>
<Element Name="ESTADO" DataType="AnsiString">
</Element>
<Element Name="PAIS" DataType="AnsiString">
</Element>
<Element Name="LOCALIDAD" DataType="AnsiString">
</Element>
<Element Name="REFERENCIA" DataType="AnsiString">
</Element>
<Element Name="LUGARDEEXPEDICION" DataType="AnsiString">
</Element>
<Element Name="NUMERODECUENTA" DataType="AnsiString">
</Element>
</Elements>
</Struct>
<Struct Name="TReceptor" UID="{0BC5D2F3-A500-4DCE-B677-0DA054701A8A}" AutoCreateParams="1">
<Elements>
<Element Name="RFC" DataType="AnsiString">
</Element>
<Element Name="NOMBRE" DataType="AnsiString">
</Element>
<Element Name="CALLE" DataType="AnsiString">
</Element>
<Element Name="NOEXTERIOR" DataType="AnsiString">
</Element>
<Element Name="NOINTERIOR" DataType="AnsiString">
</Element>
<Element Name="CODIGOPOSTAL" DataType="AnsiString">
</Element>
<Element Name="COLONIA" DataType="AnsiString">
</Element>
<Element Name="MUNICIPIO" DataType="AnsiString">
</Element>
<Element Name="ESTADO" DataType="AnsiString">
</Element>
<Element Name="PAIS" DataType="AnsiString">
</Element>
<Element Name="LOCALIDAD" DataType="AnsiString">
</Element>
</Elements>
</Struct>
</Structs>
<Enums>
<Enum Name="ColumnSortDirection" UID="{EAEAD7D2-3A0E-48D6-BE19-A74265D14503}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<EnumValues>
<EnumValue Name="Ascending">
</EnumValue>
<EnumValue Name="Descending">
</EnumValue>
</EnumValues>
</Enum>
<Enum Name="ScriptExceptionType" UID="{60698D9B-61E3-4BDA-AA4C-58235FE6F4F5}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<EnumValues>
<EnumValue Name="ParserError">
</EnumValue>
<EnumValue Name="RuntimeError">
</EnumValue>
<EnumValue Name="Fail">
</EnumValue>
<EnumValue Name="UnexpectedException">
</EnumValue>
<EnumValue Name="Abort">
</EnumValue>
</EnumValues>
</Enum>
</Enums>
<Arrays>
<Array Name="DataParameterArray" UID="{3E639D01-FB07-458F-B9C4-C6550F504901}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="DataParameter" />
</Array>
<Array Name="TableRequestInfoArray" UID="{036958C2-1AC8-49B6-8A94-417198CB799F}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="TableRequestInfo" />
</Array>
<Array Name="StringArray" UID="{7E86C9FC-99E7-45F2-8A49-E59A7A017265}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="Utf8String" />
</Array>
<Array Name="VariantArray" UID="{5E7C5D64-FC5D-4B54-AC91-11B27ACA5FF4}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="Variant" />
</Array>
<Array Name="ColumnSortingArray" UID="{53481559-8F14-44C6-83E4-5E9A579AB0EC}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="ColumnSorting" />
</Array>
<Array Name="UserInfoArray" UID="{90816BC2-EC6D-4C03-8C36-B9C50A8F2B8E}" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<ElementType DataType="UserInfo" />
</Array>
<Array Name="ArrayOpcionBI" UID="{2A412024-E317-45B3-99A3-947F71F2F055}">
<ElementType DataType="TOpcionBI" />
</Array>
<Array Name="ATDetalleFactura" UID="{E721BCA9-9319-4643-95E8-073110A04489}">
<ElementType DataType="TDetalleFactura" />
</Array>
<Array Name="ATFacturaElectronicaDetalleImportes" UID="{8FB15C0A-1B8F-4197-A085-C754E410DFB0}">
<ElementType DataType="TFacturaElectronicaDetalleImporteBI" />
</Array>
<Array Name="ATFacturaElectronicaDetalleImpuestos" UID="{9A654DC7-3F33-4FB1-BDCB-2F2E7AF2CE8D}">
<ElementType DataType="TFacturaElectronicaDetalleImpuestosBI" />
</Array>
<Array Name="ATTipoValores" UID="{7F303A38-834D-4619-AAE5-8F4DE968CD53}">
<ElementType DataType="TTipoValores" />
</Array>
<Array Name="ACampos" UID="{99003D56-DC02-4D54-85C8-2A2FE72E7D27}">
<ElementType DataType="TCampo" />
</Array>
<Array Name="AEstaciones" UID="{A27127B9-0867-4374-BE36-3FCABF20BED6}">
<ElementType DataType="TEstacion" />
</Array>
<Array Name="APasos" UID="{BA3B226A-C2C4-44EA-AF2B-6552023973F0}">
<ElementType DataType="TPasos" />
</Array>
<Array Name="ATTurnoxFecha" UID="{D8C3627D-DDD6-4C24-94D1-90E15EEA78BB}">
<ElementType DataType="TTurnoxFecha" />
</Array>
</Arrays>
<Uses>
<Use Name="DataAbstract" UID="{42E74701-061F-4124-93C1-ABD6CD345491}" Rodl="$(Data Abstract for Delphi)\Source\DataAbstract4.RODL" AbsoluteRodl="C:\Program Files (x86)\RemObjects Software\Data Abstract for Delphi\Source\DataAbstract4.RODL" UsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}" DontCodeGen="1">
<Includes UID="{ECE5910F-040B-4BDF-9502-EDF7F95642CF}" Delphi="DataAbstract4" DotNet="RemObjects.DataAbstract.Server" ObjC="DataAbstract/DataAbstract4_Intf" Java="com.remobjects.dataabstract" Nougat="DataAbstract"/>
</Use>
</Uses>
<Exceptions>
<Exception Name="ScriptException" UID="{8BF890A1-81CF-4371-93FD-39E44CBD052F}" AutoCreateParams="1" FromUsedRodlUID="{DC8B7BE2-14AF-402D-B1F8-E1008B6FA4F6}">
<Elements>
<Element Name="Line" DataType="Integer">
</Element>
<Element Name="Column" DataType="Integer">
</Element>
<Element Name="Event" DataType="Utf8String">
</Element>
<Element Name="InnerStackTrace" DataType="Utf8String">
</Element>
<Element Name="Type" DataType="ScriptExceptionType">
</Element>
</Elements>
</Exception>
</Exceptions>
</Library>
