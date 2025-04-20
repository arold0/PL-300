# Guía de Solución - Laboratorio 3: Implementación de Medidas DAX Avanzadas

Esta guía proporciona los pasos detallados para completar el Laboratorio 3 de preparación para el examen PL-300. Sigue estas instrucciones paso a paso para desarrollar las habilidades necesarias en la implementación de medidas DAX avanzadas.

## Configuración Inicial

1. Abre Power BI Desktop
2. Carga el modelo de datos del Laboratorio 2 o crea uno nuevo cargando los archivos de datos proporcionados:
   - `Ventas_2022_2023_Completo.xlsx`
   - `Presupuesto_2022_2023.xlsx`
   - `Metricas_Objetivos.xlsx`
3. Verifica las relaciones entre tablas y ajústalas si es necesario

## Parte 1: Medidas DAX Fundamentales

### Tarea 1: Medidas básicas y KPIs

1. **Crear medidas de ventas y costos**:
   - Crea una tabla para medidas y nombra una sección "Ventas y Costos"
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Brutas = SUM(Ventas[PrecioUnitario] * Ventas[Cantidad])
     
     Ventas Netas = 
     SUM(Ventas[PrecioUnitario] * Ventas[Cantidad] * (1 - Ventas[Descuento]))
     
     Total Costos = SUM(Ventas[Costo] * Ventas[Cantidad])
     
     Beneficio = [Ventas Netas] - [Total Costos]
     
     % Margen = 
     DIVIDE(
         [Beneficio],
         [Ventas Netas],
         0
     )
     ```

2. **Crear medidas de ticket y rendimiento**:
   - Crea una sección "Indicadores de Rendimiento"
   - Implementa las siguientes medidas:
     ```DAX
     Número de Transacciones = DISTINCTCOUNT(Ventas[VentaID])
     
     Ticket Medio = 
     DIVIDE(
         [Ventas Netas],
         [Número de Transacciones],
         0
     )
     
     Unidades por Transacción = 
     DIVIDE(
         SUM(Ventas[Cantidad]),
         [Número de Transacciones],
         0
     )
     ```

3. **Documentar las medidas**:
   - Añade descripciones a cada medida haciendo clic derecho > Propiedades
   - Ejemplo para Ventas Netas:
     "Importe total de ventas después de aplicar descuentos. No incluye impuestos ni gastos de envío."

4. **Organizar medidas en grupos lógicos**:
   - Usa la vista de "Visualización de carpetas" para agrupar medidas
   - Crea carpetas para: "Ventas", "Rentabilidad", "Operaciones", "KPIs"

### Tarea 2: Funciones de agregación avanzadas

1. **Implementar medidas con funciones X**:
   - Añade una sección "Métricas Avanzadas"
   - Crea las siguientes medidas:
     ```DAX
     Margen por Línea = 
     SUMX(
         Ventas,
         Ventas[Cantidad] * (Ventas[PrecioUnitario] * (1 - Ventas[Descuento]) - Ventas[Costo])
     )
     
     Rentabilidad Media = 
     AVERAGEX(
         Ventas,
         DIVIDE(
             (Ventas[PrecioUnitario] * (1 - Ventas[Descuento]) - Ventas[Costo]),
             Ventas[PrecioUnitario],
             0
         )
     )
     
     Venta Máxima = MAXX(Ventas, Ventas[Cantidad] * Ventas[PrecioUnitario])
     
     Venta Mínima = MINX(Ventas, IF(Ventas[Cantidad] * Ventas[PrecioUnitario] > 0, Ventas[Cantidad] * Ventas[PrecioUnitario]))
     ```

2. **Crear medidas con agregación condicionada**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas con Descuento = 
     CALCULATE(
         [Ventas Netas],
         Ventas[Descuento] > 0
     )
     
     Ventas sin Descuento = 
     CALCULATE(
         [Ventas Netas],
         Ventas[Descuento] = 0
     )
     
     % Ventas con Descuento = 
     DIVIDE(
         [Ventas con Descuento],
         [Ventas Netas],
         0
     )
     ```

3. **Implementar medidas de conteo distinto**:
   - Crea las siguientes medidas:
     ```DAX
     Clientes Distintos = DISTINCTCOUNT(Ventas[ClienteID])
     
     Productos Distintos = DISTINCTCOUNT(Ventas[ProductoID])
     
     Categorías Vendidas = 
     CALCULATE(
         DISTINCTCOUNT(Productos[CategoriaID]),
         KEEPFILTERS(Ventas)
     )
     ```

4. **Usar funciones X con expresiones complejas**:
   - Implementa las siguientes medidas avanzadas:
     ```DAX
     Índice de Rentabilidad = 
     SUMX(
         Ventas,
         DIVIDE(
             (Ventas[PrecioUnitario] * (1 - Ventas[Descuento]) - Ventas[Costo]) * Ventas[Cantidad],
             Ventas[Costo] * Ventas[Cantidad],
             0
         )
     )
     
     Clientes con Múltiples Compras = 
     CALCULATE(
         COUNTX(
             VALUES(Ventas[ClienteID]),
             CALCULATE(
                 DISTINCTCOUNT(Ventas[VentaID])
             )
         ),
         CALCULATE(
             DISTINCTCOUNT(Ventas[VentaID])
         ) > 1
     )
     ```

### Tarea 3: Segmentación y filtrado con DAX

1. **Crear medidas para análisis de productos Top N**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Top 5 Productos = 
     CALCULATE(
         [Ventas Netas],
         TOPN(
             5,
             VALUES(Productos[ProductoID]),
             [Ventas Netas]
         )
     )
     
     % Ventas Top 5 Productos = 
     DIVIDE(
         [Ventas Top 5 Productos],
         [Ventas Netas],
         0
     )
     ```

2. **Implementar segmentación por rangos**:
   - Crea las siguientes medidas:
     ```DAX
     Ventas Productos Premium = 
     CALCULATE(
         [Ventas Netas],
         Productos[PrecioUnitario] > 500
     )
     
     Ventas Productos Económicos = 
     CALCULATE(
         [Ventas Netas],
         Productos[PrecioUnitario] <= 100
     )
     
     Ventas Productos Intermedios = 
     CALCULATE(
         [Ventas Netas],
         Productos[PrecioUnitario] > 100,
         Productos[PrecioUnitario] <= 500
     )
     ```

3. **Calcular porcentajes sobre el total utilizando ALL y ALLEXCEPT**:
   - Implementa las siguientes medidas:
     ```DAX
     % del Total de Ventas = 
     DIVIDE(
         [Ventas Netas],
         CALCULATE(
             [Ventas Netas],
             ALL(Ventas)
         )
     )
     
     % Ventas por Categoría = 
     DIVIDE(
         [Ventas Netas],
         CALCULATE(
             [Ventas Netas],
             ALLEXCEPT(
                 Productos,
                 Productos[CategoriaID]
             )
         )
     )
     
     % Ventas por Región = 
     DIVIDE(
         [Ventas Netas],
         CALCULATE(
             [Ventas Netas],
             ALL(Geografia),
             KEEPFILTERS(VALUES(Geografia[RegionVentas]))
         )
     )
     ```

## Parte 2: Inteligencia Temporal Avanzada

### Tarea 4: Medidas acumuladas

1. **Implementar cálculos YTD (Year-To-Date)**:
   - Crea una sección "Inteligencia Temporal"
   - Implementa las siguientes medidas:
     ```DAX
     Ventas YTD = 
     CALCULATE(
         [Ventas Netas],
         DATESYTD(Calendario[Fecha])
     )
     
     Costos YTD = 
     CALCULATE(
         [Total Costos],
         DATESYTD(Calendario[Fecha])
     )
     
     Beneficio YTD = [Ventas YTD] - [Costos YTD]
     ```

2. **Crear medidas QTD (Quarter-To-Date)**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas QTD = 
     CALCULATE(
         [Ventas Netas],
         DATESQTD(Calendario[Fecha])
     )
     
     Costos QTD = 
     CALCULATE(
         [Total Costos],
         DATESQTD(Calendario[Fecha])
     )
     
     Beneficio QTD = [Ventas QTD] - [Costos QTD]
     ```

3. **Desarrollar cálculos MTD (Month-To-Date)**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas MTD = 
     CALCULATE(
         [Ventas Netas],
         DATESMTD(Calendario[Fecha])
     )
     
     Costos MTD = 
     CALCULATE(
         [Total Costos],
         DATESMTD(Calendario[Fecha])
     )
     
     Beneficio MTD = [Ventas MTD] - [Costos MTD]
     ```

4. **Combinar acumulados con otras medidas**:
   - Implementa las siguientes medidas:
     ```DAX
     % del Total Anual Acumulado = 
     DIVIDE(
         [Ventas YTD],
         CALCULATE(
             [Ventas Netas],
             ALL(Calendario[Fecha]),
             VALUES(Calendario[Año])
         )
     )
     
     % Progreso Trimestre = 
     DIVIDE(
         [Ventas QTD],
         CALCULATE(
             [Ventas Netas],
             ALL(Calendario[Fecha]),
             VALUES(Calendario[Año]),
             VALUES(Calendario[Trimestre])
         )
     )
     
     Días Transcurridos Mes = 
     CALCULATE(
         COUNTROWS(Calendario),
         DATESMTD(Calendario[Fecha])
     )
     
     Proyección Mes Actual = 
     DIVIDE(
         [Ventas MTD],
         [Días Transcurridos Mes]
     ) * 
     CALCULATE(
         MAX(Calendario[DiasMes]),
         LASTDATE(Calendario[Fecha])
     )
     ```

### Tarea 5: Análisis comparativo temporal

1. **Implementar comparativas YoY (año sobre año)**:
   - Crea las siguientes medidas:
     ```DAX
     Ventas Año Anterior = 
     CALCULATE(
         [Ventas Netas],
         SAMEPERIODLASTYEAR(Calendario[Fecha])
     )
     
     Variación Ventas YoY = [Ventas Netas] - [Ventas Año Anterior]
     
     % Variación Ventas YoY = 
     DIVIDE(
         [Variación Ventas YoY],
         [Ventas Año Anterior],
         0
     )
     ```

2. **Crear medidas MoM (mes sobre mes)**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Mes Anterior = 
     CALCULATE(
         [Ventas Netas],
         DATEADD(Calendario[Fecha], -1, MONTH)
     )
     
     Variación Ventas MoM = [Ventas Netas] - [Ventas Mes Anterior]
     
     % Variación Ventas MoM = 
     DIVIDE(
         [Variación Ventas MoM],
         [Ventas Mes Anterior],
         0
     )
     ```

3. **Desarrollar análisis de variación absoluta y porcentual entre períodos**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Trimestre Anterior = 
     CALCULATE(
         [Ventas Netas],
         DATEADD(Calendario[Fecha], -1, QUARTER)
     )
     
     Variación Ventas QoQ = [Ventas Netas] - [Ventas Trimestre Anterior]
     
     % Variación Ventas QoQ = 
     DIVIDE(
         [Variación Ventas QoQ],
         [Ventas Trimestre Anterior],
         0
     )
     
     Índice de Cambio = 
     VAR VarYoY = [% Variación Ventas YoY]
     VAR VarMoM = [% Variación Ventas MoM]
     RETURN
     IF(
         VarYoY > 0 && VarMoM > 0,
         "Crecimiento sostenido",
         IF(
             VarYoY > 0 && VarMoM <= 0,
             "Desaceleración",
             IF(
                 VarYoY <= 0 && VarMoM > 0,
                 "Recuperación",
                 "Contracción"
             )
         )
     )
     ```

4. **Implementar análisis comparativo acumulado**:
   - Crea las siguientes medidas:
     ```DAX
     Ventas YTD Año Anterior = 
     CALCULATE(
         [Ventas Netas],
         DATEADD(
             DATESYTD(Calendario[Fecha]),
             -1,
             YEAR
         )
     )
     
     Variación YTD vs Año Anterior = [Ventas YTD] - [Ventas YTD Año Anterior]
     
     % Variación YTD = 
     DIVIDE(
         [Variación YTD vs Año Anterior],
         [Ventas YTD Año Anterior],
         0
     )
     ```

### Tarea 6: Períodos paralelos y móviles

1. **Crear medidas para períodos paralelos**:
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Mismo Período Año Anterior = 
     CALCULATE(
         [Ventas Netas],
         PARALLELPERIOD(Calendario[Fecha], -12, MONTH)
     )
     
     Ventas Mismo Trimestre Año Anterior = 
     CALCULATE(
         [Ventas Netas],
         PARALLELPERIOD(Calendario[Fecha], -4, QUARTER)
     )
     
     Comparativa Periodo Actual vs Anterior = 
     VAR Actual = [Ventas Netas]
     VAR Anterior = [Ventas Mismo Período Año Anterior]
     RETURN
     IF(
         ISBLANK(Anterior),
         BLANK(),
         FORMAT(DIVIDE(Actual, Anterior) - 1, "0.0%;-0.0%;0.0%")
     )
     ```

2. **Implementar análisis de promedio móvil**:
   - Crea las siguientes medidas:
     ```DAX
     Promedio Últimos 3 Meses = 
     AVERAGEX(
         DATESINPERIOD(
             Calendario[Fecha],
             MAX(Calendario[Fecha]),
             -3,
             MONTH
         ),
         CALCULATE([Ventas Netas])
     )
     
     Promedio Últimos 6 Meses = 
     AVERAGEX(
         DATESINPERIOD(
             Calendario[Fecha],
             MAX(Calendario[Fecha]),
             -6,
             MONTH
         ),
         CALCULATE([Ventas Netas])
     )
     
     Promedio Últimos 12 Meses = 
     AVERAGEX(
         DATESINPERIOD(
             Calendario[Fecha],
             MAX(Calendario[Fecha]),
             -12,
             MONTH
         ),
         CALCULATE([Ventas Netas])
     )
     ```

3. **Desarrollo de indicadores de tendencia**:
   - Implementa las siguientes medidas:
     ```DAX
     Indicador de Tendencia = 
     VAR Actual = [Ventas Netas]
     VAR PromedioReciente = [Promedio Últimos 3 Meses]
     VAR PromedioAnterior = 
     AVERAGEX(
         DATESINPERIOD(
             Calendario[Fecha],
             DATEADD(MAX(Calendario[Fecha]), -3, MONTH),
             -3,
             MONTH
         ),
         CALCULATE([Ventas Netas])
     )
     RETURN
     IF(
         ISBLANK(PromedioAnterior) || PromedioAnterior = 0,
         BLANK(),
         IF(
             PromedioReciente > PromedioAnterior * 1.1,
             "Fuerte tendencia positiva",
             IF(
                 PromedioReciente > PromedioAnterior * 1.02,
                 "Tendencia positiva",
                 IF(
                     PromedioReciente < PromedioAnterior * 0.9,
                     "Fuerte tendencia negativa",
                     IF(
                         PromedioReciente < PromedioAnterior * 0.98,
                         "Tendencia negativa",
                         "Estable"
                     )
                 )
             )
         )
     )
     ```

4. **Calcular tasas de crecimiento compuesto**:
   - Implementa las siguientes medidas:
     ```DAX
     CAGR = 
     VAR PrimerAño = MIN(Calendario[Año])
     VAR UltimoAño = MAX(Calendario[Año])
     VAR VentasPrimerAño = 
     CALCULATE(
         [Ventas Netas],
         Calendario[Año] = PrimerAño
     )
     VAR VentasUltimoAño = 
     CALCULATE(
         [Ventas Netas],
         Calendario[Año] = UltimoAño
     )
     VAR PeriodoAnios = UltimoAño - PrimerAño
     RETURN
     IF(
         PeriodoAnios > 0 && VentasPrimerAño > 0,
         POWER(VentasUltimoAño / VentasPrimerAño, 1 / PeriodoAnios) - 1,
         BLANK()
     )
     ```

## Parte 3: Análisis Multi-dimensional

### Tarea 7: Jerarquías y agrupaciones

1. **Desarrollar medidas que respeten la jerarquía de selección**:
   - Crea una sección "Análisis Jerárquico"
   - Implementa las siguientes medidas:
     ```DAX
     Ventas Nivel Actual = 
     VAR EsCategoria = HASONEVALUE(Productos[CategoriaID])
     VAR EsSubcategoria = HASONEVALUE(Productos[SubcategoriaID])
     VAR EsProducto = HASONEVALUE(Productos[ProductoID])
     RETURN
     SWITCH(
         TRUE(),
         EsProducto, CALCULATE([Ventas Netas], VALUES(Productos[ProductoID])),
         EsSubcategoria, CALCULATE([Ventas Netas], VALUES(Productos[SubcategoriaID])),
         EsCategoria, CALCULATE([Ventas Netas], VALUES(Productos[CategoriaID])),
         [Ventas Netas]
     )
     ```

2. **Implementar análisis de contribución por nivel jerárquico**:
   - Crea las siguientes medidas:
     ```DAX
     % Contribución en Categoría = 
     VAR VentasSeleccionadas = [Ventas Netas]
     VAR VentasCategoria = 
     CALCULATE(
         [Ventas Netas],
         ALLEXCEPT(Productos, Productos[CategoriaID])
     )
     RETURN
     DIVIDE(
         VentasSeleccionadas,
         VentasCategoria,
         0
     )
     
     % Contribución en Subcategoría = 
     VAR VentasSeleccionadas = [Ventas Netas]
     VAR VentasSubcategoria = 
     CALCULATE(
         [Ventas Netas],
         ALLEXCEPT(Productos, Productos[CategoriaID], Productos[SubcategoriaID])
     )
     RETURN
     DIVIDE(
         VentasSeleccionadas,
         VentasSubcategoria,
         0
     )
     
     Ranking en Categoría = 
     RANKX(
         ALLSELECTED(Productos[ProductoID]),
         [Ventas Netas],
         ,
         DESC,
         DENSE
     )
     ```

3. **Crear medidas específicas para categorías vs subcategorías**:
   - Implementa las siguientes medidas:
     ```DAX
     Margen Promedio Categoría = 
     AVERAGEX(
         VALUES(Productos[CategoriaID]),
         CALCULATE(
             DIVIDE(
                 [Beneficio],
                 [Ventas Netas],
                 0
             )
         )
     )
     
     Categorías por Rendimiento = 
     VAR UmbralAlto = 0.3  // 30% margen
     VAR UmbralMedio = 0.15  // 15% margen
     VAR MargenActual = DIVIDE([Beneficio], [Ventas Netas], 0)
     RETURN
     IF(
         HASONEVALUE(Productos[CategoriaID]),
         IF(
             MargenActual >= UmbralAlto,
             "Alta rentabilidad",
             IF(
                 MargenActual >= UmbralMedio,
                 "Rentabilidad media",
                 "Baja rentabilidad"
             )
         ),
         "Múltiples categorías"
     )
     ```

4. **Implementar navegación dinámica entre niveles de jerarquía**:
   - Crea las siguientes medidas:
     ```DAX
     Nivel de Jerarquía = 
     VAR EsTotal = ISFILTERED(Productos[CategoriaID]) = FALSE
     VAR EsCategoria = HASONEVALUE(Productos[CategoriaID])
     VAR EsSubcategoria = HASONEVALUE(Productos[SubcategoriaID])
     VAR EsProducto = HASONEVALUE(Productos[ProductoID])
     RETURN
     SWITCH(
         TRUE(),
         EsTotal, "Total",
         EsCategoria && NOT(EsSubcategoria), "Categoría",
         EsSubcategoria && NOT(EsProducto), "Subcategoría",
         EsProducto, "Producto",
         "Múltiples selecciones"
     )
     
     Comparativa con Nivel Superior = 
     VAR VentasActuales = [Ventas Netas]
     VAR VentasNivelSuperior = 
     SWITCH(
         [Nivel de Jerarquía],
         "Producto", CALCULATE([Ventas Netas], ALLEXCEPT(Productos, Productos[SubcategoriaID])),
         "Subcategoría", CALCULATE([Ventas Netas], ALLEXCEPT(Productos, Productos[CategoriaID])),
         "Categoría", CALCULATE([Ventas Netas], ALL(Productos)),
         BLANK()
     )
     RETURN
     IF(
         NOT(ISBLANK(VentasNivelSuperior)),
         DIVIDE(
             VentasActuales,
             VentasNivelSuperior,
             0
         ),
         BLANK()
     )
     ```

### Tarea 8: Análisis de rentabilidad

1. **Implementar cálculos de margen por producto, categoría y cliente**:
   - Crea una sección "Análisis de Rentabilidad"
   - Implementa las siguientes medidas:
     ```DAX
     Margen por Producto = 
     DIVIDE(
         CALCULATE(
             [Beneficio],
             ALLSELECTED(Ventas)
         ),
         CALCULATE(
             [Ventas Netas],
             ALLSELECTED(Ventas)
         ),
         0
     )
     
     Margen por Categoría = 
     CALCULATE(
         DIVIDE(
             [Beneficio],
             [Ventas Netas],
             0
         ),
         ALLSELECTED(Productos[ProductoID]),
         ALLSELECTED(Ventas)
     )
     
     Margen por Cliente = 
     CALCULATE(
         DIVIDE(
             [Beneficio],
             [Ventas Netas],
             0
         ),
         ALLSELECTED(Productos),
         ALLSELECTED(Ventas[VentaID])
     )
     ```

2. **Crear métricas de ROI**:
   - Implementa las siguientes medidas:
     ```DAX
     Inversión en Inventario = 
     SUMX(
         Inventario,
         Inventario[CantidadDisponible] * RELATED(Productos[Costo])
     )
     
     ROI por Producto = 
     DIVIDE(
         [Beneficio],
         CALCULATE(
             [Inversión en Inventario],
             ALLSELECTED(Ventas)
         ),
         0
     )
     
     Tiempo de Rotación = 
     DIVIDE(
         AVERAGE(Inventario[CantidadDisponible]),
         DIVIDE(
             SUM(Ventas[Cantidad]),
             COUNTROWS(DISTINCT(Calendario[Fecha]))
         ),
         0
     )
     ```

3. **Desarrollar análisis de punto de equilibrio**:
   - Crea las siguientes medidas:
     ```DAX
     Costo Fijo Estimado = 
     VAR CostoTotalProductos = [Total Costos]
     VAR PropCostoFijo = 0.3  // 30% del costo total estimado como fijo
     RETURN
     CostoTotalProductos * PropCostoFijo
     
     Punto de Equilibrio Unidades = 
     VAR CostoFijo = [Costo Fijo Estimado]
     VAR PrecioMedio = DIVIDE([Ventas Netas], SUM(Ventas[Cantidad]), 0)
     VAR CostoVariableMedio = DIVIDE([Total Costos] * 0.7, SUM(Ventas[Cantidad]), 0)
     VAR ContribucionMarginal = PrecioMedio - CostoVariableMedio
     RETURN
     DIVIDE(
         CostoFijo,
         ContribucionMarginal,
         0
     )
     
     % del Punto de Equilibrio = 
     DIVIDE(
         SUM(Ventas[Cantidad]),
         [Punto de Equilibrio Unidades],
         0
     )
     ```

4. **Implementar medidas para análisis de cuadrantes**:
   - Crea las siguientes medidas:
     ```DAX
     Volumen Relativo = 
     DIVIDE(
         [Ventas Netas],
         CALCULATE(
             [Ventas Netas],
             ALL(Productos[ProductoID])
         ),
         0
     )
     
     Margen Relativo = 
     DIVIDE(
         [Margen por Producto],
         AVERAGEX(
             VALUES(Productos[ProductoID]),
             CALCULATE([Margen por Producto])
         ),
         0
     )
     
     Cuadrante de Producto = 
     VAR VolumenProd = [Volumen Relativo]
     VAR MargenProd = [Margen Relativo]
     RETURN
     SWITCH(
         TRUE(),
         VolumenProd > 0.02 && MargenProd > 1.1, "Alto volumen, alto margen",
         VolumenProd > 0.02 && MargenProd <= 1.1, "Alto volumen, bajo margen",
         VolumenProd <= 0.02 && MargenProd > 1.1, "Bajo volumen, alto margen",
         "Bajo volumen, bajo margen"
     )
     ```

### Tarea 9: Evaluación frente a objetivos

1. **Crear medidas para comparar rendimiento vs presupuesto**:
   - Crea una sección "Análisis vs Objetivos"
   - Implementa las siguientes medidas:
     ```DAX
     Presupuesto Ventas = 
     SUM(Presupuesto[PresupuestoVentas])
     
     Presupuesto Unidades = 
     SUM(Presupuesto[PresupuestoUnidades])
     
     Presupuesto Costos = 
     SUM(Presupuesto[PresupuestoCostos])
     
     Cumplimiento Presupuesto = 
     DIVIDE(
         [Ventas Netas],
         [Presupuesto Ventas],
         0
     )
     ```

2. **Implementar cálculos de varianza presupuestaria**:
   - Crea las siguientes medidas:
     ```DAX
     Variación vs Presupuesto = 
     [Ventas Netas] - [Presupuesto Ventas]
     
     % Variación vs Presupuesto = 
     DIVIDE(
         [Variación vs Presupuesto],
         [Presupuesto Ventas],
         0
     )
     
     Variación Costos vs Presupuesto = 
     [Total Costos] - [Presupuesto Costos]
     
     % Variación Costos vs Presupuesto = 
     DIVIDE(
         [Variación Costos vs Presupuesto],
         [Presupuesto Costos],
         0
     )
     ```

3. **Desarrollar indicadores visuales de cumplimiento de objetivos**:
   - Implementa las siguientes medidas:
     ```DAX
     Estado Presupuesto = 
     VAR CumplimientoActual = [Cumplimiento Presupuesto]
     RETURN
     SWITCH(
         TRUE(),
         CumplimientoActual >= 1, "Cumplido",
         CumplimientoActual >= 0.9, "En riesgo",
         "No cumplido"
     )
     
     Indicador KPI = 
     VAR CumplimientoActual = [Cumplimiento Presupuesto]
     RETURN
     SWITCH(
         TRUE(),
         CumplimientoActual >= 1.05, "★★★★★",
         CumplimientoActual >= 1, "★★★★☆",
         CumplimientoActual >= 0.95, "★★★☆☆",
         CumplimientoActual >= 0.9, "★★☆☆☆",
         CumplimientoActual >= 0.8, "★☆☆☆☆",
         "☆☆☆☆☆"
     )
     
     Color Estado = 
     VAR CumplimientoActual = [Cumplimiento Presupuesto]
     RETURN
     SWITCH(
         TRUE(),
         CumplimientoActual >= 1, "Verde",
         CumplimientoActual >= 0.9, "Amarillo",
         "Rojo"
     )
     ```

4. **Crear medidas de forecast basadas en tendencias actuales**:
   - Implementa las siguientes medidas:
     ```DAX
     Tendencia Últimos 3 Meses = 
     VAR Mes1 = 
         CALCULATE(
             [Ventas Netas],
             DATEADD(Calendario[Fecha], -2, MONTH)
         )
     VAR Mes2 = 
         CALCULATE(
             [Ventas Netas],
             DATEADD(Calendario[Fecha], -1, MONTH)
         )
     VAR Mes3 = [Ventas Netas]
     VAR PendienteMensual = 
         AVERAGEX(
             {1, 2},
             SWITCH(
                 [VALUE],
                 1, Mes2 - Mes1,
                 2, Mes3 - Mes2
             )
         )
     RETURN
     PendienteMensual
     
     Forecast Próximo Mes = 
     VAR Actual = [Ventas Netas]
     VAR Tendencia = [Tendencia Últimos 3 Meses]
     RETURN
     Actual + Tendencia
     
     Forecast Fin de Año = 
     VAR MesActual = MAX(Calendario[Mes])
     VAR AñoActual = MAX(Calendario[Año])
     VAR MesesRestantes = 12 - MesActual
     VAR VentasYTD = [Ventas YTD]
     VAR TendenciaPromedio = 
         [Tendencia Últimos 3 Meses]
     RETURN
     VentasYTD + (TendenciaPromedio * MesesRestantes)
     ```

## Parte 4: Optimización y Patrones Avanzados

### Tarea 10: Patrones DAX complejos

1. **Implementar el patrón segmentador asimétrico**:
   - Crea una sección "Patrones Avanzados"
   - Implementa las siguientes medidas:
     ```DAX
     Ventas en Mes Seleccionado = 
     VAR SelectedMonth = SELECTEDVALUE(Calendario[Mes])
     VAR SelectedYear = SELECTEDVALUE(Calendario[Año])
     RETURN
     CALCULATE(
         [Ventas Netas],
         Calendario[Mes] = SelectedMonth,
         Calendario[Año] = SelectedYear
     )
     
     Ventas Resto de Meses = 
     VAR SelectedMonth = SELECTEDVALUE(Calendario[Mes])
     VAR SelectedYear = SELECTEDVALUE(Calendario[Año])
     RETURN
     CALCULATE(
         [Ventas Netas],
         Calendario[Mes] <> SelectedMonth,
         Calendario[Año] = SelectedYear
     )
     
     Comparativa Mes vs Resto = 
     DIVIDE(
         [Ventas en Mes Seleccionado],
         [Ventas Resto de Meses] / (11),  // Ajustar por número de meses
         0
     )
     ```

2. **Desarrollar patrón de análisis ABC de productos**:
   - Implementa las siguientes medidas:
     ```DAX
     Clasificación ABC = 
     VAR VentasAcumuladas = 
     SUMX(
         FILTER(
             ADDCOLUMNS(
                 SUMMARIZE(
                     Ventas,
                     Productos[ProductoID]
                 ),
                 "VentasProducto", CALCULATE([Ventas Netas])
             ),
             [VentasProducto] >= CALCULATE([VentasProducto], ALLSELECTED(Productos[ProductoID]))
         ),
         [VentasProducto]
     )
     
     VAR TotalVentas = 
     CALCULATE(
         [Ventas Netas],
         ALLSELECTED(Productos[ProductoID])
     )
     
     VAR PorcentajeAcumulado = DIVIDE(VentasAcumuladas, TotalVentas)
     
     RETURN
     SWITCH(
         TRUE(),
         PorcentajeAcumulado <= 0.8, "A",
         PorcentajeAcumulado <= 0.95, "B",
         "C"
     )
     
     Ventas Productos A = 
     CALCULATE(
         [Ventas Netas],
         [Clasificación ABC] = "A"
     )
     
     Ventas Productos B = 
     CALCULATE(
         [Ventas Netas],
         [Clasificación ABC] = "B"
     )
     
     Ventas Productos C = 
     CALCULATE(
         [Ventas Netas],
         [Clasificación ABC] = "C"
     )
     ```

3. **Crear medidas basadas en el patrón de distinto conteo**:
   - Implementa las siguientes medidas:
     ```DAX
     Productos Vendidos una Vez = 
     COUNTX(
         FILTER(
             ADDCOLUMNS(
                 SUMMARIZE(
                     Ventas,
                     Productos[ProductoID]
                 ),
                 "NumTransacciones", CALCULATE(DISTINCTCOUNT(Ventas[VentaID]))
             ),
             [NumTransacciones] = 1
         ),
         Productos[ProductoID]
     )
     
     Productos Vendidos Múltiples Veces = 
     COUNTX(
         FILTER(
             ADDCOLUMNS(
                 SUMMARIZE(
                     Ventas,
                     Productos[ProductoID]
                 ),
                 "NumTransacciones", CALCULATE(DISTINCTCOUNT(Ventas[VentaID]))
             ),
             [NumTransacciones] > 1
         ),
         Productos[ProductoID]
     )
     
     % Productos Múltiples Ventas = 
     DIVIDE(
         [Productos Vendidos Múltiples Veces],
         [Productos Vendidos una Vez] + [Productos Vendidos Múltiples Veces],
         0
     )
     ```

4. **Implementar patrón de detección de eventos**:
   - Crea las siguientes medidas:
     ```DAX
     Primera Venta = 
     MINX(
         Ventas,
         Ventas[Fecha]
     )
     
     Última Venta = 
     MAXX(
         Ventas,
         Ventas[Fecha]
     )
     
     Días desde Última Venta = 
     DATEDIFF(
         [Última Venta],
         MAX(Calendario[Fecha]),
         DAY
     )
     
     Productos Sin Venta 30d = 
     COUNTX(
         FILTER(
             ADDCOLUMNS(
                 SUMMARIZE(
                     Ventas,
                     Productos[ProductoID]
                 ),
                 "DiasUltimaVenta", CALCULATE([Días desde Última Venta])
             ),
             [DiasUltimaVenta] > 30
         ),
         Productos[ProductoID]
     )
     ```

### Tarea 11: Rendimiento y optimización

1. **Simplificar medidas complejas usando variables**:
   - Optimiza las siguientes medidas:
     ```DAX
     // Original
     % Margen y Crecimiento = 
     DIVIDE(
         [Beneficio],
         [Ventas Netas],
         0
     ) * 
     DIVIDE(
         [Ventas Netas] - CALCULATE([Ventas Netas], SAMEPERIODLASTYEAR(Calendario[Fecha])),
         CALCULATE([Ventas Netas], SAMEPERIODLASTYEAR(Calendario[Fecha])),
         0
     )
     
     // Optimizada
     % Margen y Crecimiento Optimizada = 
     VAR MargenActual = 
     DIVIDE(
         [Beneficio],
         [Ventas Netas],
         0
     )
     VAR VentasActuales = [Ventas Netas]
     VAR VentasAñoAnterior = 
     CALCULATE(
         [Ventas Netas],
         SAMEPERIODLASTYEAR(Calendario[Fecha])
     )
     VAR Crecimiento = 
     DIVIDE(
         VentasActuales - VentasAñoAnterior,
         VentasAñoAnterior,
         0
     )
     RETURN
     MargenActual * Crecimiento
     ```

2. **Optimizar expresiones DAX para mejorar rendimiento**:
   - Implementa las siguientes mejoras:
     ```DAX
     // Original
     Ventas por Región Lenta = 
     SUMX(
         FILTER(
             Ventas,
             Ventas[RegionVenta] = SELECTEDVALUE(Geografia[RegionVentas])
         ),
         Ventas[Cantidad] * Ventas[PrecioUnitario] * (1 - Ventas[Descuento])
     )
     
     // Optimizada
     Ventas por Región Optimizada = 
     CALCULATE(
         SUMX(
             Ventas,
             Ventas[Cantidad] * Ventas[PrecioUnitario] * (1 - Ventas[Descuento])
         ),
         Ventas[RegionVenta] = SELECTEDVALUE(Geografia[RegionVentas])
     )
     ```

3. **Analizar y documentar el comportamiento de las medidas**:
   - Crea una tabla de documentación con:
     - Nombres de medidas
     - Descripción y propósito
     - Comportamiento con diferentes filtros
     - Optimizaciones aplicadas

4. **Implementar técnicas de particionado y optimización de contextos**:
   - Mejora las medidas existentes con estas técnicas:
     ```DAX
     // Usando KEEPFILTERS para mantener contextos
     Ventas Categoría Filtrada = 
     CALCULATE(
         [Ventas Netas],
         KEEPFILTERS(Productos[CategoriaID] = SELECTEDVALUE(Productos[CategoriaID]))
     )
     
     // Usando CROSSFILTER para controlar direcciones de filtrado
     Ventas sin Filtro Bidireccional = 
     CALCULATE(
         [Ventas Netas],
         CROSSFILTER(
             Productos[ProductoID],
             Ventas[ProductoID], 
             BOTH
         )
     )
     ```

## Implementación de Visualizaciones

Una vez implementadas todas las medidas, crea un conjunto de visualizaciones que aprovechen las medidas DAX desarrolladas:

1. **Panel de rendimiento general**:
   - Tarjetas con KPIs principales (Ventas, Margen, Ticket Medio)
   - Gráfico de líneas con comparativas YoY
   - Matriz con análisis por categoría y región

2. **Panel de análisis temporal**:
   - Gráfico de columnas con acumulados MTD/QTD/YTD
   - Gráfico de líneas con tendencias y promedios móviles
   - Tabla con comparativas entre períodos

3. **Panel de análisis de rentabilidad**:
   - Diagrama de dispersión para análisis de cuadrantes
   - Gráfico de barras para margen por categoría
   - Gráfico de cascada para análisis de contribución

4. **Panel de cumplimiento de objetivos**:
   - Indicadores visuales de cumplimiento
   - Gráfico de columnas con real vs presupuesto
   - Tabla con análisis de varianzas

## Mejores Prácticas y Optimización Final

1. **Estructura y organización**:
   - Agrupa medidas relacionadas en carpetas lógicas
   - Usa un prefijo consistente para medidas relacionadas
   - Documenta cada medida con su propósito y uso

2. **Optimización de rendimiento**:
   - Usa variables para cálculos intermedios
   - Evita cálculos repetitivos
   - Utiliza CALCULATE en lugar de FILTER cuando sea posible
   - Prefiere INDEX en lugar de RANKX para grandes conjuntos de datos

3. **Mantenibilidad y legibilidad**:
   - Usa sangrías y espacios consistentes
   - Divide fórmulas complejas en múltiples líneas
   - Comenta secciones complejas de código
   - Usa nombres descriptivos para variables

4. **Validación y pruebas**:
   - Prueba cada medida con diferentes niveles de filtrado
   - Verifica resultados contra cálculos manuales para confirmación
   - Comprueba casos límite (valores nulos, divisiones por cero)
   - Valida el rendimiento usando el Analizador de rendimiento DAX

## Conclusión y Próximos Pasos

Al completar este laboratorio, has desarrollado un conjunto completo de medidas DAX avanzadas que son fundamentales para el análisis empresarial moderno. Las habilidades adquiridas te preparan para:

1. Implementar análisis temporal sofisticado
2. Crear métricas de rendimiento multidimensionales
3. Optimizar el modelo para consultas eficientes
4. Aplicar patrones DAX avanzados para resolver problemas complejos

Estas competencias representan un componente significativo del examen PL-300 y son altamente valoradas en entornos de análisis de datos empresariales.

Para continuar tu aprendizaje, considera explorar:
- Patrones DAX más avanzados
- Técnicas de modelado avanzadas
- Integración con servicios de Power BI
- Automatización de actualización de datos y flujos de trabajo