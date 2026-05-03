# Resumen del Proyecto Delphi 7: Módulo de RRHH

El proyecto ha sido generado con éxito en tu entorno local. Se han creado todos los archivos `.pas`, `.dfm` y `.dpr` necesarios para compilar la aplicación, respetando la sintaxis de Delphi 7 y el uso de componentes IBX para Firebird 2.5.

## Ubicación de los Archivos
Todos los archivos se encuentran en: `C:\Users\nosiv\.gemini\antigravity\scratch\RRHH_Project`

## Componentes Generados

### 1. Módulo de Datos (`UDataModule`)
Configurado con `TIBDatabase` apuntando a Firebird 2.5 y un `TIBTransaction` principal.

### 2. Formulario 4: Wizard de Acciones de Personal (`UAccionPersonalWizard`)
Este es el componente central solicitado, donde se maneja la transacción. 

> [!NOTE]
> **Lógica Transaccional Implementada:**
> El botón "Procesar" abre explícitamente una transacción. En un bloque `try..except`, ejecuta primero un `INSERT` en la tabla `RRHH_ACCIONES_PERSONAL` usando el generador `GEN_RRHH_ACCIONES_ID`, y luego un `UPDATE` en la tabla `EMPLEADO`. Finalmente, si ambos comandos son exitosos, realiza un `Commit`; en caso de error, un `Rollback`.

### 3. Formularios Adicionales
- **Ficha Candidato (`UFichaCandidato`):** Permite ver los prospectos. Incluye la configuración del `TIBUpdateSQL` para poder insertar y editar usando un `TDBGrid` y un botón que abre el `TOpenDialog` para asociar la ruta del CV.
- **Control de Entrevistas (`UControlEntrevistas`):** Muestra el listado de entrevistas pendientes (`JOIN` con Candidatos). Tiene el botón para ejecutar `ShellExecute` que abre el PDF de la ruta asociada.
- **Visor de Historial (`UVisorHistorial`):** Consultas de sólo lectura (`JOIN` de Acciones con Tipos de Acción ordenado por fecha descendente).
- **Gestión de Permisos (`UGestionPermisos`):** Orientado específicamente a la actualización de la licencia de conducir (`LICENCIA` y `FECHA_VENCE_LICENCIA`), como lo solicitaste.

## Siguientes Pasos
Para probar el proyecto:
1. Abre Delphi 7.
2. Ve a `File -> Open Project...` y selecciona `RRHH_App.dpr` en la carpeta generada.
3. Asegúrate de ajustar la propiedad `DatabaseName` del `TIBDatabase` en el `UDataModule.dfm` para que apunte exactamente a tu archivo `.FDB` físico.
4. Compila y ejecuta el proyecto.
