HelpScribble project file.
10
...
0
1
Depreciacion de Activos



TRUE


1
BrowseButtons()
0
FALSE

FALSE
4
10
Scribble10
Introduccion




Writing



FALSE
6
{\rtf1\ansi\ansicpg1252\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 Arial;}{\f3\fswiss\fcharset1 Arial;}}
{\colortbl\red0\green0\blue0;\red0\green0\blue255;}
\deflang1033\pard\plain\f3\fs32\cf1\b <Depreciacion Activos>\plain\f3\fs20 
\par 
\par Este modulo c\'e1lcula la depreciacion de activo ...
\par }
20
Scribble20
Menu Principal




Writing



FALSE
32
{\rtf1\ansi\ansicpg1252\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 Arial;}{\f3\fswiss\fcharset1 Arial;}{\f4\fswiss\fprq2 System;}}
{\colortbl\red0\green0\blue0;\red0\green0\blue255;}
\deflang1033\pard\plain\f3\fs20 
\par \plain\f3\fs20\ul Actualiza   Consulta    Reportes Ayuda Salir
\par \plain\f3\fs20 
\par \pard\li200\fi-200\tx200{\*\pn\pnlvlblt\pnf1\pnindent200{\pntxtb\'b7}}\plain\f3\fs20\b {\pntext\f1\'b7\tab}Actualiza
\par \pard\tx200\plain\f3\fs20     - Tipo Activo
\par     - Cuentas Activos
\par     - Maestro Activos
\par     - Depreciacion Mensual
\par     - Transaccion Depreciacion
\par     - Posteo Depreciacion Mensual
\par     - Contabilizar Depreciacion
\par     - Salir
\par \pard\plain\f3\fs20 
\par \plain\f3\fs20\b TIPO ACTIVO. \plain\f3\fs20 En esta opcion es posible definir un tipo de activo
\par \plain\f3\fs20\b 
\par CUENTAS ACTIVOS.  \plain\f3\fs20 Permite asignar el grupo de cuentas a que pertenece cada activo.
\par 
\par \plain\f3\fs20\b MAESTRO ACTIVO. \plain\f3\fs20  Activos de la empresa.
\par 
\par \plain\f3\fs20\b DEPRECIACION MENSUAL. \plain\f3\fs20  C\'e1lculo mensual de la depreciacion por activo.
\par 
\par \plain\f3\fs20\b TRANSACCION DEPRECIACION.  \plain\f3\fs20 Permite Insertar, Modificar, Consultar valor depreciacion por activo.
\par 
\par \plain\f3\fs20\b POSTEO DEPRECIACION. \plain\f3\fs20 Actualiza archivo maestro de activos con valor depreciacion mensual.
\par 
\par \plain\f3\fs20\b CONTABILIZAR DEPRECIACION. \plain\f3\fs20 Genera documento de Depreciacion en transacciones contables.
\par 
\par \plain\f3\fs20\b SALIR. \plain\f3\fs20 Teminar ejecucion de programa "Depreciacion de Activos".\plain\f3\fs20\b 
\par      \plain\f3\fs20 
\par }
30
Scribble30
Tipo Activo




Writing



FALSE
12
{\rtf1\ansi\ansicpg1252\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 Arial;}{\f3\fswiss\fcharset1 Arial;}{\f4\fswiss\fprq2 System;}}
{\colortbl\red0\green0\blue0;\red0\green0\blue255;}
\deflang1033\pard\plain\f3\fs32\cf1\b Tipo Activo
\par \plain\f3\fs20\cf0 Para insertar un nuevo activo :
\par 1- Haga click en el boton INSERTAR
\par 2- Indique el numero que identificara el tipo de activo
\par 3- Describa el activo, nombre del tipo de activo
\par 4- Click en el boton Salvar para guardar los datos\plain\f3\fs32\cf1\b 
\par \plain\f3\fs20 
\par 
\par 
\par }
40
Scribble40
Cuenta Activos




Writing



FALSE
18
{\rtf1\ansi\ansicpg1252\deff0\deftab720{\fonttbl{\f0\fswiss MS Sans Serif;}{\f1\froman\fcharset2 Symbol;}{\f2\fswiss\fcharset1 Arial;}{\f3\fswiss\fcharset1 Arial;}{\f4\fswiss\fprq2 System;}}
{\colortbl\red0\green0\blue0;\red0\green0\blue255;}
\deflang1033\pard\plain\f3\fs32\cf1\b Cuenta Activos\plain\f3\fs20 
\par Cada activo esta asociado con un grupo que a su vez identifica una cuenta del Catalogo.
\par 
\par Ejemplo:
\par 
\par TIPO   CODIGO   GRUPO   CONCEPTO
\par   1\tab 24\tab         1\tab          74-> Depreciacion Categoria III   \tab 
\par \tab \tab          |\tab \tab \tab 
\par \tab \tab          |
\par \tab \tab          ^
\par \tab \tab codgrupo       \tab cuenta   origen tiposervicio subtipo
\par                                 1       \tab 5110101       1          511           0
\par El activo 1-24 tiene como grupo de cuenta el codigo 1 que identifica la cuenta 5110101...
\par 
\par \tab \tab \tab 
\par }
0
0
0
5
1 Introduccion
1 Depreciacion
2 Menu Principal=Scribble20
2 Tipo Activo=Scribble30
2 Distribucion Cuenta=Scribble40
6
*InternetLink
16711680
Courier New
0
10
1
....
0
0
0
0
0
0
*ParagraphTitle
-2147483640
Arial
0
11
1
B...
0
0
0
0
0
0
*PopupLink
-2147483640
Arial
0
8
1
....
0
0
0
0
0
0
*PopupTopicTitle
16711680
Arial
0
10
1
B...
0
0
0
0
0
0
*TopicText
-2147483640
Arial
0
10
1
....
0
0
0
0
0
0
*TopicTitle
16711680
Arial
0
16
1
B...
0
0
0
0
0
0
