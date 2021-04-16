program Agregar;
uses
 Crt, dos;
 const
  ruta = 'c:\fibinacci.txt';
 var
   Fichero : Text;
  i,a,b,c,num:longint;
  begin
     clrscr;
     writeln('INGRESE EL NUMERO DE LA SERIE');
     writeln('');
     readln(num);
     a:=1;
     b:=1;

     Assign (Fichero,ruta);
     Rewrite (Fichero); {* crea nuevo Fichero *}
     WriteLn (Fichero,a);
     WriteLn (Fichero,b);
     writeln ('Serie Fibonacci');
     writeln (a);
     writeln (b);
     for i:=1 to num-1 do
       begin;
         c:=(a+b);
         WriteLn (Fichero,c);
         writeln (c);
         a:=b;
         b:=c;
       end;


     Close (Fichero);

     writeln ('Archivo fibonacci creado exitosamente en :', ruta);
     readkey;

end.
