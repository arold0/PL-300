# Laboratorio 3: Implementación de Medidas DAX Avanzadas

## Objetivo del Laboratorio

Este laboratorio está diseñado para desarrollar habilidades avanzadas en la creación y optimización de medidas DAX (Data Analysis Expressions) en Power BI, centrándose en la implementación de cálculos complejos, inteligencia temporal y análisis multidimensional. Estas habilidades son esenciales para la certificación PL-300 y representan aproximadamente el 25-30% del contenido del examen.

## Escenario

Continuando con el rol de analista de datos para la cadena minorista internacional, ahora necesitas implementar un conjunto de medidas DAX avanzadas para analizar el rendimiento del negocio desde múltiples perspectivas. El análisis debe permitir a la dirección:

1. Analizar tendencias de ventas con métricas temporales sofisticadas
2. Evaluar la rentabilidad por diversas dimensiones
3. Implementar indicadores clave de rendimiento (KPIs)
4. Crear segmentaciones e informes avanzados
5. Optimizar el rendimiento de las consultas

## Áreas de Conocimiento Abarcadas

| Área de Conocimiento | Subáreas | Relevancia para PL-300 |
|----------------------|----------|------------------------|
| Medidas DAX básicas | - Funciones de agregación<br>- Operadores de contexto<br>- Filtrado | Alta |
| Inteligencia temporal | - Funciones DATEADD<br>- Acumulados<br>- Año tras año (YoY)<br>- Mes tras mes (MoM) | Alta |
| Análisis de variaciones | - Valores actuales vs anteriores<br>- Porcentajes de crecimiento<br>- Análisis de contribución | Alta |
| Contextos de evaluación | - Contexto de fila<br>- Contexto de filtro<br>- Contexto de transición | Media-Alta |
| Optimización de DAX | - Selección de funciones<br>- Variables<br>- Formato y legibilidad | Media |

## Requisitos Previos

1. Haber completado el Laboratorio 2
2. Power BI Desktop actualizado
3. Archivos del Laboratorio 3:
   - `Ventas_2022_2023_Completo.xlsx` (datos ampliados)
   - `Presupuesto_2022_2023.xlsx`
   - `Metricas_Objetivos.xlsx`
   - El modelo de datos desarrollado en el Laboratorio 2

## Tareas del Laboratorio

### Parte 1: Medidas DAX Fundamentales (20 puntos)

1. **Medidas básicas y KPIs (7 puntos)**
   - Implementar medidas para ventas brutas, netas, costos y beneficio
   - Crear medidas para ticket medio y unidades por transacción
   - Documentar con descripciones claras cada medida
   - Organizar medidas en grupos lógicos y aplicar formato

2. **Funciones de agregación avanzadas (8 puntos)**
   - Implementar medidas utilizando SUMX, AVERAGEX, MAXX, MINX
   - Crear medidas con operaciones de agregación condicionadas
   - Implementar medidas de conteo distinto
   - Usar funciones X con expresiones complejas

3. **Segmentación y filtrado con DAX (5 puntos)**
   - Crear medidas para análisis de productos Top N
   - Implementar segmentación por rangos (productos por rango de precio)
   - Calcular porcentajes sobre el total utilizando ALL y ALLEXCEPT
   - Crear medidas que respeten y/o ignoren selectivamente filtros específicos

### Parte 2: Inteligencia Temporal Avanzada (30 puntos)

4. **Medidas acumuladas (10 puntos)**
   - Implementar cálculos YTD (Year-To-Date)
   - Crear medidas QTD (Quarter-To-Date)
   - Desarrollar cálculos MTD (Month-To-Date)
   - Combinar acumulados con otras medidas (% del total anual acumulado)

5. **Análisis comparativo temporal (10 puntos)**
   - Implementar comparativas YoY (año sobre año)
   - Crear medidas MoM (mes sobre mes)
   - Desarrollar análisis de variación absoluta y porcentual entre períodos
   - Implementar análisis comparativo acumulado (YTD vs YTD año anterior)

6. **Períodos paralelos y móviles (10 puntos)**
   - Crear medidas para períodos paralelos (mismo período año anterior)
   - Implementar análisis de promedio móvil (últimos 3, 6, 12 meses)
   - Desarrollo de indicadores de tendencia 
   - Calcular tasas de crecimiento compuesto (CAGR)

### Parte 3: Análisis Multi-dimensional (30 puntos)

7. **Jerarquías y agrupaciones (10 puntos)**
   - Desarrollar medidas que respeten la jerarquía de selección
   - Implementar análisis de contribución por nivel jerárquico
   - Crear medidas específicas para categorías vs subcategorías
   - Implementar navegación dinámica entre niveles de jerarquía

8. **Análisis de rentabilidad (10 puntos)**
   - Implementar cálculos de margen por producto, categoría y cliente
   - Crear métricas de ROI (Retorno sobre inversión)
   - Desarrollar análisis de punto de equilibrio
   - Implementar medidas para análisis de cuadrantes (alto volumen/alto margen)

9. **Evaluación frente a objetivos (10 puntos)**
   - Crear medidas para comparar rendimiento vs presupuesto
   - Implementar cálculos de varianza presupuestaria
   - Desarrollar indicadores visuales de cumplimiento de objetivos
   - Crear medidas de forecast basadas en tendencias actuales

### Parte 4: Optimización y Patrones Avanzados (20 puntos)

10. **Patrones DAX complejos (10 puntos)**
    - Implementar el patrón segmentador asimétrico
    - Desarrollar patrón de análisis ABC de productos
    - Crear medidas basadas en el patrón de distinto conteo
    - Implementar patrón de detección de eventos (primero, último, cambios)

11. **Rendimiento y optimización (10 puntos)**
    - Simplificar medidas complejas usando variables
    - Optimizar expresiones DAX para mejorar rendimiento
    - Analizar y documentar el comportamiento de las medidas
    - Implementar técnicas de particionado y optimización de contextos

## Entregables

1. Archivo Power BI (.pbix) con todas las medidas implementadas
2. Documentación de medidas con explicaciones de fórmulas y usos
3. Cuadro de mando con visualizaciones que demuestren las medidas creadas
4. Respuestas a las preguntas de reflexión (ver abajo)

## Preguntas de Reflexión

1. ¿Qué consideraciones tomaste para optimizar el rendimiento de las medidas DAX más complejas?
2. ¿Cómo elegiste entre distintas opciones de cálculo para las medidas de inteligencia temporal?
3. ¿De qué manera has adaptado tus medidas para garantizar que funcionen correctamente con distintos niveles de filtrado?
4. ¿Qué patrones DAX encontraste más útiles para los requisitos de análisis empresarial?

## Rúbrica de Evaluación

| Calificación | Descripción |
|--------------|-------------|
| 90-100 | Excelente: Medidas DAX implementadas con precisión, optimización avanzada y documentación clara |
| 80-89 | Muy Bueno: Medidas DAX funcionales con buena optimización y estructura lógica |
| 70-79 | Bueno: Medidas básicas correctas, con algunas avanzadas implementadas adecuadamente |
| 60-69 | Satisfactorio: Cumple requisitos mínimos, varias áreas requieren mejora |
| <60 | No Satisfactorio: No cumple con los requisitos mínimos |

## Recursos Adicionales

- [Documentación oficial de DAX](https://docs.microsoft.com/dax/)
- [Patrones de DAX](https://www.daxpatterns.com/)
- [Optimización de fórmulas DAX](https://docs.microsoft.com/power-bi/guidance/dax-variables)
- [DAX Guide](https://dax.guide/)

---

## Extensiones Opcionales

Para estudiantes avanzados o con experiencia previa:

1. Implementar tablas calculadas dinámicas con DAX para escenarios what-if
2. Desarrollar patrones de análisis de cohortes avanzados
3. Crear escenarios de modelado predictivo simple con DAX
4. Implementar cálculos de análisis estadístico (desviación estándar, correlaciones)

---

*Nota: Este laboratorio se alinea con los objetivos del examen PL-300 y cubre específicamente el área "Crear medidas con DAX" que representa aproximadamente el 25-30% del examen.*