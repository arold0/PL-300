# Guía de Solución - Laboratorio 2: Creación de Modelo de Datos con Relaciones Complejas

Esta guía proporciona los pasos detallados para completar el Laboratorio 2 de preparación para el examen PL-300. Sigue estas instrucciones paso a paso para desarrollar las habilidades necesarias en modelado de datos con relaciones complejas.

## Configuración Inicial

1. Asegúrate de tener la última versión de Power BI Desktop instalada
2. Descarga los archivos del Laboratorio 2 desde el repositorio
3. Crea un nuevo archivo de Power BI (.pbix)

## Parte 1: Diseño del Modelo de Datos Avanzado

### Tarea 1: Refinamiento del Esquema Estrella

1. **Planificar el modelo conceptual**:
   - Identifica las tablas de hechos (Ventas, Inventario, Promociones)
   - Identifica las dimensiones (Productos, Clientes, Geografía, Tiempo, Empleados, Canales)
   - Dibuja el diagrama del esquema estrella en papel o herramienta de diagramación

2. **Cargar las fuentes de datos**:
   - Conecta a `VentasDetalladas_2022_2023.xlsx` y selecciona la hoja "VentasDetalladas"
   - Conecta a `InventarioActualizado.xlsx` y selecciona la hoja "InventarioActual"
   - Conecta a los archivos CSV: Geografias.csv, Empleados.csv, CanalVentas.csv, CategoriaProductos.csv
   - Conecta a los archivos JSON de promociones

3. **Aplicar nomenclatura consistente**:
   - Renombra las tablas añadiendo prefijos:
     - Fact_ para tablas de hechos (Fact_Ventas, Fact_Inventario, Fact_Promociones)
     - Dim_ para dimensiones (Dim_Producto, Dim_Cliente, Dim_Geografia, etc.)
   - Aplica PascalCase a todos los nombres de columnas
   - Añade descripciones a las tablas y columnas importantes

### Tarea 2: Creación de Dimensiones de Degeneración

1. **Crear dimensión de Región**:
   - En el Editor de Power Query, selecciona la columna "RegionVenta" de la tabla "VentasDetalladas"
   - Ve a "Inicio" > "Quitar duplicados" para obtener valores únicos
   - Añade una columna "RegionID" y guarda como "Dim_Region"

2. **Crear dimensión de Categoría de Productos**:
   - Utiliza el archivo CategoriaProductos.csv como base
   - Asegúrate de mantener la columna CategoriaPadreID para relaciones jerárquicas
   - Renombra como "Dim_CategoriaProducto"

3. **Implementar dimensión SCD Tipo 2 para Empleados**:
   - Configura la tabla Empleados como Dim_Empleado
   - Añade campos para FechaInicioValidez y FechaFinValidez
   - Añade campo para EstadoActual (Activo/Histórico)
   - Implementa lógica para rastrear cambios históricos:
     ```
     if [Activo] = 1 then "Activo" else "Histórico"
     ```

4. **Configurar propiedades**:
   - Establece tipos de datos adecuados para todas las columnas
   - Configura el formato de fechas, moneda y porcentajes
   - Establece propiedades de ordenación donde sea necesario

### Tarea 3: Configuración de Tablas de Hechos Múltiples

1. **Crear tabla de hechos de Ventas**:
   - Utiliza la tabla "VentasDetalladas" como base
   - Asegúrate de tener todas las claves foráneas necesarias
   - Crea medidas calculadas como:
     - Ventas Netas = Cantidad * PrecioUnitario * (1 - Descuento)
     - Margen = Ventas Netas - (Cantidad * Costo)

2. **Crear tabla de hechos de Inventario**:
   - Utiliza la tabla "InventarioActual" como base
   - Añade campos calculados para análisis:
     - DiasEnInventario = DATEDIFF(FechaUltimoConteo, TODAY(), DAY)
     - ValorCategoriaInventario = IF([EstadoStock] = "Óptimo", 3, IF([EstadoStock] = "Bajo", 2, 1))
   - Asegúrate de mantener las claves foráneas para productos y ubicaciones

3. **Crear tabla de hechos de Promociones**:
   - Combina los datos de los archivos JSON de promociones
   - Crea una tabla puente para la relación muchos a muchos entre promociones y productos
   - Asegúrate de tener campos para:
     - PromocionID
     - FechaInicio y FechaFin (para relacionar con la dimensión de tiempo)
     - Descuento
   - Crea una tabla puente "Bridge_PromocionProducto" con:
     - PromocionID
     - ProductoID

4. **Asegurar dimensiones conformadas**:
   - Verifica que todas las tablas de hechos compartan las mismas dimensiones:
     - Dim_Fecha (compartida entre ventas, inventario y promociones)
     - Dim_Producto (compartida entre ventas, inventario y promociones)
     - Dim_Geografia (compartida entre ventas e inventario)
   - Asegúrate de que los IDs sean consistentes entre todas las tablas

## Parte 2: Implementación de Relaciones Complejas

### Tarea 4: Relaciones Muchos a Muchos

1. **Identificar relaciones muchos a muchos**:
   - Promociones a Productos (una promoción puede aplicar a varios productos y un producto puede tener varias promociones)
   - Productos a Categorías (un producto puede pertenecer a múltiples categorías y una categoría puede tener varios productos)

2. **Crear tabla puente para Promociones-Productos**:
   - Crea una tabla "Bridge_PromocionProducto" con:
     ```
     let
         Fuente = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("...", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [PromocionID = _t, ProductoID = _t]),
         #"Tipo cambiado" = Table.TransformColumnTypes(Fuente,{{"PromocionID", type text}, {"ProductoID", type text}})
     in
         #"Tipo cambiado"
     ```
   - Asegúrate de incluir todos los pares de PromocionID-ProductoID válidos

3. **Implementar filtros bidireccionales**:
   - Crea relación entre Fact_Promociones y Bridge_PromocionProducto con filtro bidireccional
   - Crea relación entre Dim_Producto y Bridge_PromocionProducto con filtro unidireccional
   - Documenta la configuración:
     ```
     Fact_Promociones[PromocionID] → Bridge_PromocionProducto[PromocionID] (bidireccional)
     Dim_Producto[ProductoID] → Bridge_PromocionProducto[ProductoID] (unidireccional)
     ```

4. **Documentar impacto en rendimiento**:
   - Crea una tabla de documentación con observaciones sobre:
     - Aumento de tamaño del modelo por tablas puente
     - Impacto del filtrado bidireccional en rendimiento
     - Complejidad adicional en el modelo

### Tarea 5: Jerarquías Avanzadas

1. **Implementar jerarquía geográfica**:
   - Selecciona la tabla Dim_Geografia
   - Ve a Vista de datos
   - Crea una jerarquía llamada "Jerarquía Geográfica"
   - Añade los niveles en este orden:
     - País
     - Región
     - Ciudad
     - Código Postal
   - Configura la propiedad "Ordenar por columna" para cada nivel

2. **Crear jerarquía de productos**:
   - Selecciona la tabla Dim_CategoriaProducto
   - Crea una jerarquía llamada "Categorización Producto"
   - Añade los niveles:
     - Nombre Categoría (Nivel = 1)
     - Nombre Categoría (Nivel = 2)
     - Nombre Categoría (Nivel = 3)
   - Configura las propiedades de ordenación

3. **Implementar jerarquía temporal**:
   - Selecciona la tabla Dim_Fecha
   - Crea una jerarquía llamada "Calendario"
   - Añade los niveles:
     - Año
     - Trimestre
     - Mes
     - Semana
     - Día
   - Configura la ordenación de mes por número de mes en lugar de alfabéticamente

4. **Configurar propiedades de visualización**:
   - Ajusta el formato de los niveles de jerarquía
   - Configura nombres de visualización amigables
   - Establece tooltips explicativos

### Tarea 6: Relaciones Inactivas y Alternativas

1. **Identificar casos para relaciones inactivas**:
   - Entre Fact_Ventas[FechaEnvio] y Dim_Fecha[Fecha] (además de la relación activa con Fact_Ventas[Fecha])
   - Entre Fact_Promociones[FechaFin] y Dim_Fecha[Fecha] (además de la relación activa con Fact_Promociones[FechaInicio])

2. **Implementar relaciones alternativas**:
   - Crea relación inactiva entre Fact_Ventas[FechaEnvio] y Dim_Fecha[Fecha]
   - Marca esta relación como inactiva
   - Verifica la configuración en el modelo

3. **Crear medidas con USERELATIONSHIP**:
   - Crea una medida para analizar ventas por fecha de envío:
     ```DAX
     Ventas por Fecha Envío = 
     CALCULATE(
         SUM(Fact_Ventas[Ventas Netas]),
         USERELATIONSHIP(Fact_Ventas[FechaEnvio], Dim_Fecha[Fecha])
     )
     ```
   - Crea una medida para análisis de promociones usando fecha fin:
     ```DAX
     Promociones Finalizadas = 
     CALCULATE(
         COUNTROWS(Fact_Promociones),
         USERELATIONSHIP(Fact_Promociones[FechaFin], Dim_Fecha[Fecha])
     )
     ```

4. **Validar la funcionalidad**:
   - Crea una tabla pivote que muestre:
     - Ventas por fecha
     - Ventas por fecha de envío
   - Compara los resultados para verificar que las relaciones funcionan correctamente

## Parte 3: Implementación de Medidas y Cálculos

### Tarea 7: Medidas Básicas

1. **Crear medidas para totales de ventas**:
   - En la tabla Fact_Ventas, crea las siguientes medidas:
     ```DAX
     Total Ventas = SUM(Fact_Ventas[Ventas Netas])
     
     Total Unidades Vendidas = SUM(Fact_Ventas[Cantidad])
     
     Precio Promedio = 
     DIVIDE(
         SUM(Fact_Ventas[Ventas Netas]),
         SUM(Fact_Ventas[Cantidad]),
         0
     )
     ```

2. **Implementar medidas para inventario**:
   - En la tabla Fact_Inventario, crea las siguientes medidas:
     ```DAX
     Total Inventario = SUM(Fact_Inventario[CantidadDisponible])
     
     Valor Total Inventario = SUM(Fact_Inventario[ValorInventario])
     
     Productos en Estado Crítico = 
     CALCULATE(
         COUNTROWS(Fact_Inventario),
         Fact_Inventario[EstadoStock] = "Crítico"
     )
     ```

3. **Crear medidas de porcentajes y ratios**:
   - Crea las siguientes medidas:
     ```DAX
     % Margen = 
     DIVIDE(
         [Total Margen],
         [Total Ventas],
         0
     )
     
     Ratio Venta-Inventario = 
     DIVIDE(
         [Total Ventas],
         [Valor Total Inventario],
         0
     )
     
     % Productos Críticos = 
     DIVIDE(
         [Productos en Estado Crítico],
         COUNTROWS(Fact_Inventario),
         0
     )
     ```

4. **Documentar medidas y agruparlas**:
   - Agrega descripciones a cada medida
   - Organiza las medidas en carpetas de visualización:
     - Ventas
     - Inventario
     - Rendimiento
     - Análisis Temporal (para las medidas de la siguiente tarea)

### Tarea 8: Cálculos de Inteligencia Temporal

1. **Implementar comparaciones año tras año**:
   - Crea las siguientes medidas:
     ```DAX
     Ventas Año Anterior = 
     CALCULATE(
         [Total Ventas],
         SAMEPERIODLASTYEAR(Dim_Fecha[Fecha])
     )
     
     % Crecimiento Ventas YoY = 
     VAR VentasActuales = [Total Ventas]
     VAR VentasAñoAnterior = [Ventas Año Anterior]
     RETURN
     DIVIDE(
         VentasActuales - VentasAñoAnterior,
         VentasAñoAnterior,
         0
     )
     ```

2. **Crear cálculos de acumulados**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas MTD = 
     CALCULATE(
         [Total Ventas],
         DATESMTD(Dim_Fecha[Fecha])
     )
     
     Ventas QTD = 
     CALCULATE(
         [Total Ventas],
         DATESQTD(Dim_Fecha[Fecha])
     )
     
     Ventas YTD = 
     CALCULATE(
         [Total Ventas],
         DATESYTD(Dim_Fecha[Fecha])
     )
     ```

3. **Desarrollar análisis de períodos paralelos**:
   - Crea las siguientes medidas:
     ```DAX
     Ventas Mismo Mes Año Anterior = 
     CALCULATE(
         [Total Ventas],
         PARALLELPERIOD(Dim_Fecha[Fecha], -12, MONTH)
     )
     
     Ventas Mes Anterior = 
     CALCULATE(
         [Total Ventas],
         PREVIOUSMONTH(Dim_Fecha[Fecha])
     )
     
     % Variación Mensual = 
     DIVIDE(
         [Total Ventas] - [Ventas Mes Anterior],
         [Ventas Mes Anterior],
         0
     )
     ```

4. **Implementar funciones de varianza**:
   - Añade las siguientes medidas:
     ```DAX
     Variación YoY Absoluta = [Total Ventas] - [Ventas Año Anterior]
     
     Variación YTD vs Año Anterior = 
     VAR YTDActual = [Ventas YTD]
     VAR YTDAnterior = 
     CALCULATE(
         [Ventas YTD],
         SAMEPERIODLASTYEAR(Dim_Fecha[Fecha])
     )
     RETURN
     YTDActual - YTDAnterior
     ```

### Tarea 9: Tablas Calculadas y Funciones DAX Avanzadas

1. **Crear tabla calculada para análisis de cohortes**:
   - Crea una tabla calculada para análisis de clientes por fecha de primera compra:
     ```DAX
     Cohortes = 
     SUMMARIZE(
         FILTER(
             Fact_Ventas,
             NOT(ISBLANK(Fact_Ventas[ClienteID]))
         ),
         Fact_Ventas[ClienteID],
         "Fecha Primera Compra", CALCULATE(
             MIN(Fact_Ventas[Fecha]),
             ALLEXCEPT(Fact_Ventas, Fact_Ventas[ClienteID])
         ),
         "Año Primera Compra", YEAR(CALCULATE(
             MIN(Fact_Ventas[Fecha]),
             ALLEXCEPT(Fact_Ventas, Fact_Ventas[ClienteID])
         )),
         "Mes Primera Compra", MONTH(CALCULATE(
             MIN(Fact_Ventas[Fecha]),
             ALLEXCEPT(Fact_Ventas, Fact_Ventas[ClienteID])
         ))
     )
     ```

2. **Implementar CALCULATE con múltiples filtros**:
   - Crea una medida para análisis específico:
     ```DAX
     Ventas Premium por Canal Online = 
     CALCULATE(
         [Total Ventas],
         Fact_Ventas[Categoria] = "Premium",
         Dim_CanalVenta[NombreCanal] = "Online"
     )
     
     Ventas Región Sur con Descuento = 
     CALCULATE(
         [Total Ventas],
         Dim_Region[NombreRegion] = "Sur",
         Fact_Ventas[Descuento] > 0
     )
     ```

3. **Utilizar funciones avanzadas de filtro**:
   - Implementa las siguientes medidas:
     ```DAX
     % Contribución Producto =
     DIVIDE(
         [Total Ventas],
         CALCULATE(
             [Total Ventas],
             ALL(Dim_Producto)
         )
     )
     
     Ventas Excluyendo Promociones = 
     CALCULATE(
         [Total Ventas],
         FILTER(
             ALL(Fact_Promociones),
             ISBLANK(Fact_Promociones[PromocionID])
         )
     )
     
     Top 5 Productos Contribución = 
     IF(
         RANKX(
             ALL(Dim_Producto),
             CALCULATE([Total Ventas])
         ) <= 5,
         [Total Ventas],
         BLANK()
     )
     ```

4. **Aplicar funciones de inteligencia temporal**:
   - Implementa medidas complejas de tiempo:
     ```DAX
     Ventas Año Móvil = 
     CALCULATE(
         [Total Ventas],
         DATESINPERIOD(
             Dim_Fecha[Fecha],
             MAX(Dim_Fecha[Fecha]),
             -12,
             MONTH
         )
     )
     
     Ventas Hace 6 Meses = 
     CALCULATE(
         [Total Ventas],
         DATEADD(Dim_Fecha[Fecha], -6, MONTH)
     )
     ```

## Parte 4: Seguridad y Optimización

### Tarea 10: Implementación de RLS (Seguridad a Nivel de Fila)

1. **Diseñar modelo de seguridad**:
   - Define un modelo donde:
     - Gerentes pueden ver todas las regiones
     - Vendedores pueden ver solo sus regiones asignadas
     - Analistas pueden ver solo datos agregados
   - Documenta los requisitos de seguridad en detalle

2. **Crear roles de seguridad**:
   - En Power BI Desktop, ve a "Modelado" > "Seguridad" > "Administrar roles"
   - Crea los siguientes roles:
     - Rol "Gerentes"
     - Rol "Vendedores"
     - Rol "Analistas"

3. **Implementar filtros DAX para RLS**:
   - Para el rol "Vendedores", aplica el siguiente filtro a la tabla Dim_Geografia:
     ```DAX
     [RegionID] = LOOKUPVALUE(
         Dim_Empleado[RegionAsignada],
         Dim_Empleado[Email],
         USERPRINCIPALNAME()
     )
     ```
   - Para el rol "Analistas", aplica filtros que limiten el acceso a datos detallados:
     ```DAX
     // No se mostrarán datos detallados para Analistas
     FALSE()
     ```
     Y crea una tabla agregada separada con permiso de visualización

4. **Probar efectividad de los roles**:
   - Ve a "Modelado" > "Seguridad" > "Ver como roles"
   - Prueba cada rol y verifica que:
     - Gerentes ven todos los datos
     - Vendedores ven solo sus regiones
     - Analistas ven solo datos agregados
   - Documenta los resultados de las pruebas

### Tarea 11: Optimización de Rendimiento

1. **Analizar tamaño del modelo**:
   - Ve a "Archivo" > "Información" > "Compresión del modelo"
   - Analiza el tamaño de cada tabla
   - Identifica las tablas o columnas que ocupan más espacio
   - Documenta las observaciones

2. **Implementar columnas calculadas vs. medidas**:
   - Revisa todas las columnas calculadas actuales
   - Determina cuáles deberían ser medidas en lugar de columnas calculadas
   - Por ejemplo, convierte columnas calculadas raramente utilizadas en el filtrado a medidas:
     ```DAX
     // Cambiar esto de columna calculada a medida
     % Margen Producto = 
     DIVIDE(
         [PrecioUnitario] - [Costo],
         [PrecioUnitario],
         0
     )
     ```

3. **Optimizar fórmulas DAX**:
   - Revisa las medidas existentes y optimízalas:
     - Elimina variables innecesarias
     - Reduce el número de funciones CALCULATE anidadas
     - Utiliza variables para evitar recálculos
     - Ejemplo de optimización:
       ```DAX
       // Antes
       Ventas Premium = 
       CALCULATE(
           CALCULATE(
               SUM(Fact_Ventas[Ventas Netas]),
               Fact_Ventas[Categoria] = "Premium"
           )
       )
       
       // Después
       Ventas Premium = 
       CALCULATE(
           SUM(Fact_Ventas[Ventas Netas]),
           Fact_Ventas[Categoria] = "Premium"
       )
       ```

4. **Monitorear rendimiento**:
   - Ve a "Archivo" > "Opciones" > "Diagnóstico DAX"
   - Activa "VerterTraza" para registrar consultas
   - Realiza algunas consultas complejas
   - Analiza los resultados para identificar cuellos de botella
   - Mejora las áreas problemáticas:
     - Simplifica relaciones complejas
     - Optimiza medidas lentas
     - Considera la eliminación de relaciones bidireccionales innecesarias

## Resumen de Mejores Prácticas

1. **Diseño del Modelo**:
   - Utiliza un esquema estrella bien definido
   - Mantén dimensiones conformadas entre tablas de hechos
   - Nombra tablas y columnas de forma clara y consistente

2. **Relaciones**:
   - Limita el uso de relaciones bidireccionales solo a donde sea necesario
   - Utiliza tablas puente para relaciones muchos a muchos
   - Documenta relaciones inactivas y su propósito

3. **Medidas**:
   - Organiza medidas en grupos lógicos
   - Documenta cada medida con una descripción clara
   - Utiliza variables para mejorar la legibilidad y rendimiento

4. **Optimización**:
   - Monitorea regularmente el tamaño del modelo
   - Prefiere medidas sobre columnas calculadas para cálculos complejos
   - Implementa la seguridad a nivel de fila de forma eficiente

## Reflexión Final

Al completar este laboratorio, has desarrollado un modelo de datos avanzado con:
- Relaciones complejas, incluyendo muchos a muchos
- Jerarquías para análisis multinivel
- Medidas DAX avanzadas con inteligencia temporal
- Seguridad a nivel de fila para diferentes roles

Estas habilidades son fundamentales para la certificación PL-300 y te preparan para implementar soluciones de análisis empresarial complejas en entornos reales.