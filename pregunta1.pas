program cajero;
uses
    Crt;
const
    ruta = 'c:\reporte.txt';

type

        Reporte = Record
            id:integer;
            titulo:string;
            categoria:string;
            contenido:string;
            fecha:string;
            status:string;
        end;
VAR

       archivo: file of reporte;
        datos : reporte;
       existe : boolean;
           sw : boolean;

   //************************************************************************************************
//********************      BUSCA EL CLIENTE SI ESTA EN EL ARCHIVO     ***************************
//************************************************************************************************

procedure consultar (var IDregistro : integer);
       var campos : reporte;
  begin

         assign(archivo, ruta);
         {$I-}reset(archivo);{$I+}
              if IOresult  <> 0 then
                 begin
                        campos.titulo :='';
                        campos.categoria := '';
                        campos.contenido := '';
                        campos.fecha := '';
                        campos.status := '';
                        gotoxy(13,7);write('TITULO: ');
                        gotoxy(10,8);write('CATEGORIA: ');
                        gotoxy(10,9);write('CONTENIDO:');
                        gotoxy(14,10);write('FECHA: ');
                        gotoxy(13,11);write('STATUS: ');
                        campos.id := IDregistro;
                        gotoxy(22,7);readln(campos.titulo);
                        gotoxy(22,8);readln(campos.categoria);
                        gotoxy(22,9);readln(campos.contenido);
                        gotoxy(22,10);readln(campos.fecha);
                        gotoxy(22,11);readln(campos.status);

                        rewrite(archivo);
                        seek(archivo,0);
                        write(archivo,campos);
                        close(archivo);
                        gotoxy(19,14);writeln('EL ID FUE GUARDADO EXITOSAMENTE');
                        sw := true;
                 end
              else
                  begin
                        sw := false;
                        existe := false;
                        while not eof(archivo) do
                             begin
                                read(archivo,datos);
                                if datos.id = IDregistro then
                                   begin
                                       existe := true;

                                       break;
                                   end;
                             end;
                             close(archivo);

                  end;

    end;


//************************************************************************************************
//**********************      INGRESA A UN NUEVO EN EL ARCHIVO    ************************
//************************************************************************************************



    procedure guradar;
     var
        respuesta : char;
        campos : reporte;
        IDregistro : integer;
    begin

       repeat
          clrscr;
          IDregistro := 0;
          sw := false;
          existe:= false;
                 writeln ('     ______________________________________________________ ');
                 writeln ('    |                                                      |');
                 writeln ('    |                  GUARDAD REGISTRO                    |');
                 writeln ('    |                --------------------                  |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |                                                      |');
                 writeln ('    |______________________________________________________|');

          gotoxy(17,6);write('ID: ');
          gotoxy(21,6);readln(campos.id);
          IDregistro := campos.id;

          consultar (IDregistro);

          if (existe = false) and (sw = false) then
             begin

                 campos.titulo :='';
                 campos.categoria := '';
                 campos.contenido := '';
                 campos.fecha := '';
                 campos.status := '';
                 gotoxy(13,7);write('TITULO: ');
                 gotoxy(10,8);write('CATEGORIA: ');
                 gotoxy(10,9);write('CONTENIDO:');
                 gotoxy(14,10);write('FECHA: ');
                 gotoxy(13,11);write('STATUS: ');
                 campos.id := IDregistro;
                 gotoxy(22,7);readln(campos.titulo);
                 gotoxy(22,8);readln(campos.categoria);
                 gotoxy(22,9);readln(campos.contenido);
                 gotoxy(22,10);readln(campos.fecha);
                 gotoxy(22,11);readln(campos.status);

                 assign(archivo,ruta);
                 {$I-} reset(archivo); {$I+}
                 if ioresult = 0 then
                    begin
                        Seek(archivo,fileSize(archivo));
                        write(archivo,campos);
                        close(archivo);
                        gotoxy(19,14);writeln('EL ID FUE GUARDADO EXITOSAMENTE');
                    end;
             end
          else
               if existe = true then
             begin
                existe:= false;
                gotoxy(19,14);writeln('YA EL ID ESTA REGISTRADO');

             end;

          gotoxy(14,20);write('¨DESEA AGREAGAR OTRO ID ( S ¢ N )?');
          respuesta := upcase (readkey);
       until respuesta = 'N';
    end;


//************************************************************************
//**************************    MENU PRINCIPAL    ************************
//************************************************************************


 procedure menu;
    var
       opcion : char;
    begin

        repeat
        clrscr;
            writeln ('     _____________________________________________________ ');
            writeln ('    |                                                     |');
            writeln ('    |             M E N U   P R I N C I P A L             |');
            writeln ('    |     ------------------------------------------      |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |             1 - GUARDAD CATEGORIA                   |');
            writeln ('    |                                                     |');
            writeln ('    |             2 - SALIR DEL SISTEMA                   |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |                                                     |');
            writeln ('    |               INGRESE SU OPCION:                    |');
            writeln ('    |_____________________________________________________|');

            repeat
              GOTOXY(40,17); opcion := readkey
            until opcion in ['1'..'2'];

        clrscr;
        case opcion of
             '1' : guradar;
        end
        until opcion = '2';

    end;



BEGIN

menu;

END.
