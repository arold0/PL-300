# Laboratorio 2: Creación de Modelo de Datos con Relaciones Complejas

## Objetivo del Laboratorio

Este laboratorio está diseñado para desarrollar habilidades avanzadas en el modelado de datos con Power BI Desktop, enfocándose en la creación de relaciones complejas, implementación de jerarquías y optimización del rendimiento del modelo. Estas habilidades son esenciales para la certificación PL-300 y representan aproximadamente el 30-35% del contenido del examen.

## Escenario

Continuando con el rol de analista de datos para la cadena minorista internacional, ahora necesitas crear un modelo de datos más sofisticado que permita análisis avanzados. El modelo debe incorporar:

1. Relaciones de muchos a muchos
2. Jerarquías en varias dimensiones
3. Tablas de hechos múltiples
4. Seguridad a nivel de fila
5. Cálculos de inteligencia temporal

## Áreas de Conocimiento Abarcadas

| Área de Conocimiento | Subáreas | Relevancia para PL-300 |
|----------------------|----------|------------------------|
| Diseño de modelos de datos | - Esquema estrella<br>- Esquema copo de nieve<br>- Tablas de hechos y dimensiones | Alta |
| Creación de relaciones complejas | - Relaciones de muchos a muchos<br>- Dirección de filtros bidireccional<br>- Tablas puente | Alta |
| Tablas calculadas y medidas | - Creación de tablas calculadas<br>- Funciones CALCULATE, FILTER, ALL<br>- Contextos de fila y filtro | Alta |
| Inteligencia temporal | - Función DATEADD<br>- Análisis año tras año<br>- Acumulados móviles | Media-Alta |
| Jerarquías y roles | - Jerarquías padre-hijo<br>- Jerarquías desbalanceadas<br>- Seguridad a nivel de fila | Media |

## Requisitos Previos

1. Haber completado el Laboratorio 1
2. Power BI Desktop actualizado
3. Archivos del Laboratorio 2:
   - `VentasDetalladas_2022_2023.xlsx`
   - `InventarioActualizado.xlsx`
   - `Geografias.csv`
   - `Empleados.csv`
   - `CanalVentas.csv`
   - `CategoriaProductos.csv`
   - Carpeta con archivos JSON de promociones

## Tareas del Laboratorio

### Parte 1: Diseño del Modelo de Datos Avanzado (25 puntos)

1. **Refinamiento del Esquema Estrella (7 puntos)**
   - Evaluar el modelo actual y reconvertirlo a un esquema estrella
   - Crear dimensiones conformadas para atributos compartidos
   - Documentar el diseño conceptual del nuevo modelo
   - Implementar best practices en nombres de tablas y campos

2. **Creación de Dimensiones de Degeneración (8 puntos)**
   - Identificar atributos que requieren dimensiones de degeneración
   - Crear dimensiones para atributos como Regiones, Categorías y Segmentos
   - Implementar dimensiones de cambio lento (SCD) tipo 2 para seguimiento histórico
   - Configurar las propiedades adecuadas para cada dimensión

3. **Configuración de Tablas de Hechos Múltiples (10 puntos)**
   - Crear una tabla de hechos para ventas
   - Crear una tabla de hechos para inventario
   - Crear una tabla de hechos para promociones
   - Asegurar que todas las tablas de hechos comparten dimensiones conformadas

### Parte 2: Implementación de Relaciones Complejas (30 puntos)

4. **Relaciones Muchos a Muchos (10 puntos)**
   - Identificar escenarios que requieren relaciones muchos a muchos
   - Crear tabla puente para relación Promociones-Productos
   - Implementar filtros bidireccionales donde sea apropiado
   - Documentar el impacto en el rendimiento de las relaciones bidireccionales

5. **Jerarquías Avanzadas (10 puntos)**
   - Implementar jerarquía geográfica (País, Región, Ciudad)
   - Crear jerarquía de productos (Categoría, Subcategoría, Producto)
   - Implementar jerarquía temporal (Año, Trimestre, Mes, Semana, Día)
   - Configurar propiedades de ordenación y visualización

6. **Relaciones Inactivas y Alternativas (10 puntos)**
   - Identificar casos de uso para relaciones inactivas
   - Implementar relaciones alternativas para análisis de envíos vs ventas
   - Crear funciones DAX que utilicen USERELATIONSHIP
   - Validar la funcionalidad mediante consultas básicas

### Parte 3: Implementación de Medidas y Cálculos (30 puntos)

7. **Medidas Básicas (8 puntos)**
   - Crear medidas para totales de ventas e inventario
   - Implementar medidas para porcentajes y ratios
   - Documentar cada medida con descripciones
   - Agrupar medidas de forma lógica

8. **Cálculos de Inteligencia Temporal (12 puntos)**
   - Implementar comparaciones año tras año (YoY)
   - Crear cálculos de acumulados móviles (MTD, QTD, YTD)
   - Desarrollar análisis de períodos paralelos
   - Implementar funciones de varianza y crecimiento

9. **Tablas Calculadas y Funciones DAX Avanzadas (10 puntos)**
   - Crear tabla calculada para análisis de cohortes
   - Implementar función CALCULATE con múltiples filtros
   - Utilizar funciones FILTER, ALL, ALLEXCEPT
   - Aplicar funciones de inteligencia de tiempo como DATEADD y SAMEPERIODLASTYEAR

### Parte 4: Seguridad y Optimización (15 puntos)

10. **Implementación de RLS (Seguridad a Nivel de Fila) (8 puntos)**
    - Diseñar modelo de seguridad por región y departamento
    - Crear roles de seguridad
    - Implementar filtros DAX para RLS
    - Probar efectividad de los roles de seguridad

11. **Optimización de Rendimiento (7 puntos)**
    - Analizar y documentar tamaño del modelo
    - Implementar columnas calculadas vs. medidas apropiadamente
    - Optimizar fórmulas DAX para rendimiento
    - Monitorear rendimiento con diagnóstico DAX

## Entregables

1. Archivo Power BI (.pbix) con el modelo de datos optimizado
2. Documento de diseño del modelo que incluya:
   - Diagrama del modelo con relaciones
   - Documentación de medidas DAX
   - Explicación de las decisiones de diseño
3. Respuestas a preguntas de reflexión (ver abajo)

## Preguntas de Reflexión

1. ¿Qué ventajas aporta el uso de un modelo con relaciones muchos a muchos en este escenario?
2. ¿Cómo decidiste qué relaciones debían ser bidireccionales y cuál fue el impacto?
3. ¿Qué consideraciones tuviste en cuenta para optimizar el rendimiento del modelo?
4. ¿Cómo se podría expandir este modelo para incluir análisis predictivos?

## Rúbrica de Evaluación

| Calificación | Descripción |
|--------------|-------------|
| 90-100 | Excelente: Modelo implementado con relaciones óptimas, jerarquías completas y medidas eficientes |
| 80-89 | Muy Bueno: Modelo funcional con todas las relaciones requeridas, algunas oportunidades de optimización |
| 70-79 | Bueno: Relaciones básicas implementadas correctamente, jerarquías funcionales pero mejorables |
| 60-69 | Satisfactorio: Cumple requisitos mínimos, varias áreas requieren mejora |
| <60 | No Satisfactorio: No cumple con los requisitos mínimos |

## Recursos Adicionales

- [Documentación oficial de modelado en Power BI](https://docs.microsoft.com/power-bi/guidance/star-schema)
- [Optimización de relaciones en Power BI](https://docs.microsoft.com/power-bi/guidance/relationships-bidirectional-filtering)
- [Patrones de DAX avanzado](https://docs.microsoft.com/dax/dax-patterns)

---

## Extensiones Opcionales

Para estudiantes avanzados o con experiencia previa:

1. Implementar patrón de análisis de embudo (funnel) para seguimiento de conversión de clientes
2. Crear un patrón de simulación "what-if" para previsiones de ventas
3. Implementar métricas financieras complejas como ROI, margen de contribución, etc.
4. Desarrollar un modelo de atribución para análisis de canales de marketing

---

*Nota: Este laboratorio se alinea con los objetivos del examen PL-300 y cubre específicamente el área "Modelar los datos (30-35%)"*