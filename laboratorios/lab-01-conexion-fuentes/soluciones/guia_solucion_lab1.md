# Guía de Solución - Laboratorio 1: Conexión a Múltiples Fuentes y Transformación de Datos

Esta guía proporciona los pasos detallados para completar el Laboratorio 1 de preparación para el examen PL-300. Sigue estas instrucciones paso a paso para desarrollar las habilidades necesarias en conexión a múltiples fuentes y transformación de datos.

## Configuración Inicial

1. Asegúrate de tener la última versión de Power BI Desktop instalada
2. Descarga los archivos de laboratorio desde el repositorio
3. Crea una carpeta de trabajo para organizar tus archivos

## Parte 1: Conexión a Fuentes de Datos

### Tarea 1: Conectar a Excel

1. **Iniciar la conexión**:
   - Abre Power BI Desktop
   - Haz clic en "Obtener datos" en la pantalla de inicio
   - Selecciona "Excel" en las fuentes comunes

2. **Configurar la conexión**:
   - Navega y selecciona el archivo `Ventas_2022_2023.xlsx`
   - En el navegador, marca las tablas `VentasMensuales` y `Productos`
   - Haz clic en "Transformar datos" para abrir el Editor de Power Query

3. **Revisar opciones**:
   - Examina los tipos de datos detectados
   - Verifica que la primera fila se use como encabezados
   - Observa la vista previa para confirmar que los datos se cargan correctamente

### Tarea 2: Conectar a SQL Server

1. **Iniciar la conexión**:
   - Desde el Editor de Power Query, haz clic en "Nueva fuente" 
   - Selecciona "Base de datos SQL Server"

2. **Configurar la conexión**:
   - Introduce el nombre del servidor (o utiliza localhost si es local)
   - Introduce "Inventario" como nombre de la base de datos
   - Selecciona "Consulta SQL directa" en Modo de conectividad de datos

3. **Escribir consulta SQL**:
   ```sql
   SELECT 
       I.ProductoID,
       P.NombreProducto,
       I.Ubicacion,
       I.CantidadDisponible,
       I.UltimaActualizacion
   FROM 
       Inventario I
   INNER JOIN 
       ProductoMaestro P ON I.ProductoID = P.ProductoID
   WHERE 
       I.Activo = 1
   ```

4. **Configurar privacidad**:
   - Cuando aparezca el diálogo de privacidad, selecciona "Organizacional" para la conexión
   - Haz clic en "Guardar"

### Tarea 3: Conectar a CSV

1. **Iniciar la conexión**:
   - Desde el Editor de Power Query, haz clic en "Nueva fuente"
   - Selecciona "Texto/CSV"

2. **Configurar la conexión**:
   - Navega y selecciona el archivo `Clientes.csv`
   - En el diálogo de vista previa:
     - Verifica que el delimitador sea correcto (coma)
     - Confirma la detección de encabezados
     - Revisa la codificación (UTF-8)
   - Haz clic en "Cargar"

3. **Configurar tipos de datos**:
   - Haz clic derecho en la columna "ClienteID" y establece como texto
   - Haz clic derecho en la columna "FechaRegistro" y establece como fecha
   - Haz clic derecho en columnas numéricas y establece los tipos correspondientes

### Tarea 4: Conectar a múltiples archivos JSON

1. **Iniciar la conexión**:
   - Desde el Editor de Power Query, haz clic en "Nueva fuente"
   - Selecciona "Carpeta"

2. **Configurar la conexión**:
   - Navega y selecciona la carpeta que contiene los archivos JSON de promociones
   - Haz clic en "Cargar"
   - En la vista previa, haz clic en "Combinar archivos"

3. **Configurar la combinación**:
   - Selecciona "JSON" como formato de archivo de ejemplo
   - Haz clic en "Aceptar"

4. **Expandir datos JSON**:
   - Haz clic en el icono de expansión (doble flecha) en la columna "Contenido"
   - Selecciona las columnas necesarias: PromocionID, Descripcion, FechaInicio, FechaFin, Descuento
   - Desmarca "Usar nombre de columna original como prefijo"
   - Haz clic en "Aceptar"

## Parte 2: Perfilado y Transformación de Datos

### Tarea 5: Perfilado de Datos

1. **Activar herramientas de perfilado**:
   - En el Editor de Power Query, ve a la pestaña "Ver"
   - Activa "Calidad de columna", "Distribución de columna" y "Perfil de columna"

2. **Analizar VentasMensuales**:
   - Examina la distribución de valores en columnas importantes
   - Identifica valores atípicos en "MontoVenta"
   - Busca patrones en fechas de ventas
   - Documenta problemas encontrados (valores nulos, inconsistencias, etc.)

3. **Analizar Inventario**:
   - Revisa la distribución de "CantidadDisponible"
   - Identifica valores extremos o sospechosos
   - Verifica coherencia en formatos de fecha

4. **Analizar Clientes**:
   - Revisa la calidad de datos de contacto
   - Identifica posibles duplicados basados en nombres/emails
   - Verifica la integridad de campos clave

### Tarea 6: Limpieza de Datos

1. **Eliminar duplicados en Clientes**:
   - Selecciona la consulta de Clientes
   - Ve a la pestaña "Inicio"
   - Haz clic en "Quitar filas" > "Quitar duplicados"
   - Selecciona "ClienteID" como columna para verificar duplicados

2. **Manejar valores nulos en VentasMensuales**:
   - Haz clic derecho en la columna "Vendedor"
   - Selecciona "Reemplazar valores"
   - Reemplaza null con "No asignado"

3. **Estandarizar formato de texto**:
   - Selecciona las columnas de nombres en Clientes
   - En la pestaña "Transformar", haz clic en "Formato" > "Mayúsculas y minúsculas" > "MAYÚSCULAS la primera letra de cada palabra"

4. **Crear columna calculada de nombre completo**:
   - En la consulta Clientes, ve a "Agregar columna" > "Columna personalizada"
   - Nombre: "NombreCompleto"
   - Fórmula personalizada: `[Nombre] & " " & [Apellido]`

### Tarea 7: Transformaciones Avanzadas

1. **Crear función personalizada para estandarizar productos**:
   - En el Editor de Power Query, haz clic en "Nueva fuente" > "Consulta en blanco"
   - Introduce la siguiente fórmula:
     ```
     (NombreProducto as text) => 
     let
         Resultado = Text.Proper(Text.Trim(NombreProducto)),
         SinEspaciosExtra = Text.Replace(Resultado, "  ", " "),
         NombreEstandarizado = if Text.EndsWith(SinEspaciosExtra, " ") then Text.RemoveRange(SinEspaciosExtra, Text.Length(SinEspaciosExtra)-1, 1) else SinEspaciosExtra
     in
         NombreEstandarizado
     ```
   - Nombra la función "EstandarizarNombreProducto"

2. **Aplicar la función a productos**:
   - Selecciona la consulta Productos
   - Ve a "Agregar columna" > "Columna personalizada"
   - Nombre: "NombreEstandarizado"
   - Fórmula: `EstandarizarNombreProducto([NombreProducto])`
   - Reemplaza la columna original o mantén ambas según sea necesario

3. **Crear columnas condicionales**:
   - En la consulta VentasMensuales, ve a "Agregar columna" > "Columna condicional"
   - Nueva columna: "CategoriaVenta"
   - Condiciones:
     - Si [MontoVenta] > 10000, entonces "Premium"
     - Si [MontoVenta] > 5000, entonces "Alto"
     - Si [MontoVenta] > 1000, entonces "Medio"
     - De lo contrario, "Básico"

4. **Implementar agrupación**:
   - Crea una nueva consulta para ventas agregadas:
     - Haz clic derecho en VentasMensuales > "Referencia"
     - Ve a "Inicio" > "Agrupar por"
     - Agrupa por "Mes" y "Año"
     - Agrega las operaciones:
       - SumaVentas (Suma de [MontoVenta])
       - ConteoTransacciones (Recuento de [VentaID])
       - PromedioVenta (Promedio de [MontoVenta])

## Parte 3: Modelo de Datos Inicial

### Tarea 8: Crear una Tabla de Calendario

1. **Crear tabla de fechas**:
   - Ve a "Nueva fuente" > "Consulta en blanco"
   - Ingresa la siguiente fórmula:
     ```
     let
         FechaInicio = #date(2022, 1, 1),
         FechaFin = #date(2023, 12, 31),
         DiasTotal = Duration.Days(FechaFin - FechaInicio) + 1,
         ListaFechas = List.Dates(FechaInicio, DiasTotal, #duration(1, 0, 0, 0)),
         #"Convertido a tabla" = Table.FromList(ListaFechas, Splitter.SplitByNothing(), {"Fecha"}, null, ExtraValues.Error),
         #"Cambiar tipo" = Table.TransformColumnTypes(#"Convertido a tabla",{{"Fecha", type date}})
     in
         #"Cambiar tipo"
     ```
   - Nombra la consulta "Calendario"

2. **Añadir columnas de calendario**:
   - Año: `Date.Year([Fecha])`
   - Trimestre: `Date.QuarterOfYear([Fecha])`
   - Mes: `Date.Month([Fecha])`
   - NombreMes: `Date.MonthName([Fecha])`
   - Semana: `Date.WeekOfYear([Fecha])`
   - DiaSemana: `Date.DayOfWeek([Fecha])`
   - NombreDia: `Date.DayOfWeekName([Fecha])`

3. **Añadir columnas de negocio**:
   - DiaHabil:
     ```
     if Date.DayOfWeek([Fecha], Day.Monday) >= 5 then false else true
     ```
   - FinDeSemana: `not [DiaHabil]`
   - Temporada:
     ```
     if Date.Month([Fecha]) in {11, 12, 1} then "Invierno" else
     if Date.Month([Fecha]) in {2, 3, 4} then "Primavera" else
     if Date.Month([Fecha]) in {5, 6, 7} then "Verano" else "Otoño"
     ```

### Tarea 9: Establecer Relaciones

1. **Cargar consultas al modelo**:
   - Haz clic en "Cerrar y aplicar" para cargar todas las consultas transformadas

2. **Configurar relaciones**:
   - Ve a la vista "Modelo" en Power BI Desktop
   - Crea las siguientes relaciones:
     - VentasMensuales[Fecha] a Calendario[Fecha] (muchos a uno)
     - VentasMensuales[ProductoID] a Productos[ProductoID] (muchos a uno)
     - Inventario[ProductoID] a Productos[ProductoID] (muchos a uno)
     - VentasMensuales[ClienteID] a Clientes[ClienteID] (muchos a uno)

3. **Verificar configuraciones**:
   - Asegúrate de que la dirección del filtro esté correctamente configurada
   - Confirma la cardinalidad de cada relación
   - Asegúrate de que no haya relaciones circulares

### Tarea 10: Optimizar el Modelo

1. **Renombrar tablas y campos**:
   - Asegúrate de que todos los nombres sean claros e intuitivos
   - Usa "CamelCase" o formato consistente

2. **Ocultar campos innecesarios**:
   - En la vista "Datos", oculta campos que no sean útiles para los informes
   - Oculta campos duplicados o técnicos

3. **Crear jerarquías**:
   - En la tabla Calendario, crea una jerarquía "Tiempo":
     - Año > Trimestre > Mes > Fecha
   - En Productos, crea una jerarquía "Categorización":
     - Categoría > Subcategoría > Producto

4. **Establecer formatos**:
   - Configura los formatos correctos para:
     - Moneda (campos de venta)
     - Porcentajes (campos de descuento)
     - Fechas (campos de fecha)
     - Números enteros (cantidades)

## Parte 4: Documentación y Evaluación

### Tarea 11: Documentar el Proceso

1. **Crear tabla de metadatos**:
   - Crea una nueva tabla en Power BI con las siguientes columnas:
     - FuenteDatos
     - TipoConexión
     - FechaÚltimaActualización
     - Notas

2. **Agregar descripciones**:
   - En la vista "Modelo", selecciona cada tabla y campo
   - En el panel "Propiedades", agrega descripciones detalladas

3. **Documentar transformaciones**:
   - Crea un documento o tabla que liste todas las transformaciones aplicadas
   - Para cada transformación, documenta:
     - Consulta afectada
     - Tipo de transformación
     - Razón para aplicarla
     - Impacto en los datos

### Tarea 12: Evaluación Final

1. **Evaluar rendimiento**:
   - Ve a Archivo > Opciones y configuración > Opciones
   - Selecciona "Diagnóstico DAX"
   - Ejecuta algunas consultas básicas y analiza el rendimiento

2. **Revisar oportunidades de optimización**:
   - Identifica tablas grandes que podrían beneficiarse de la agregación
   - Verifica si hay columnas que podrían eliminarse
   - Evalúa si las relaciones están optimizadas

3. **Documentar optimizaciones futuras**:
   - Crea una lista priorizada de optimizaciones potenciales:
     - Posibles agregaciones
     - Campos a eliminar
     - Transformaciones a optimizar
     - Estrategia de actualización de datos