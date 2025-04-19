# Matriz de Evaluación - Laboratorio 2: Creación de Modelo de Datos con Relaciones Complejas

Esta matriz detalla las competencias evaluadas, criterios de puntuación y proporciona un desglose de las áreas de conocimiento abarcadas en el Laboratorio 2 para la preparación del examen PL-300.

## Áreas de Conocimiento de PL-300 Cubiertas

| Área del Examen | Subárea | Porcentaje Cubierto | Relevancia |
|-----------------|---------|---------------------|------------|
| **Preparar los datos (25-30%)** | Perfilar datos | 30% | ⭐⭐ |
| | Limpiar, transformar y cargar datos | 40% | ⭐⭐ |
| **Modelar los datos (30-35%)** | Diseñar y desarrollar un modelo de datos | 95% | ⭐⭐⭐⭐⭐ |
| | Crear medidas con DAX | 90% | ⭐⭐⭐⭐⭐ |
| | Optimizar el rendimiento del modelo | 80% | ⭐⭐⭐⭐ |
| **Visualizar datos (20-25%)** | Crear informes | 15% | ⭐ |
| **Implementar y gestionar (15-20%)** | Administrar conjuntos de datos | 50% | ⭐⭐⭐ |
| | Implementar seguridad a nivel de fila | 90% | ⭐⭐⭐⭐⭐ |

## Desglose Detallado de Competencias

### 1. Competencias en Diseño de Modelo de Datos (25%)

| Competencia | Puntos Posibles | Criterios de Evaluación |
|-------------|-----------------|-------------------------|
| Refinamiento del Esquema Estrella | 7 | • Correcta implementación del esquema<br>• Diseño conceptual documentado<br>• Nomenclatura consistente y clara |
| Dimensiones de Degeneración | 8 | • Correcto diseño e implementación<br>• Manejo adecuado de SCDs<br>• Propiedades configuradas correctamente |
| Tablas de Hechos Múltiples | 10 | • Diseño adecuado de tablas de hechos<br>• Configuración correcta de granularidad<br>• Dimensiones conformadas compartidas |

### 2. Competencias en Relaciones Complejas (30%)

| Competencia | Puntos Posibles | Criterios de Evaluación |
|-------------|-----------------|-------------------------|
| Relaciones Muchos a Muchos | 10 | • Implementación correcta de tablas puente<br>• Uso apropiado de filtros bidireccionales<br>• Documentación del impacto en rendimiento |
| Jerarquías Avanzadas | 10 | • Implementación correcta de jerarquías<br>• Propiedades de ordenación configuradas<br>• Estructura lógica y usabilidad |
| Relaciones Inactivas | 10 | • Identificación de casos de uso<br>• Implementación correcta con USERELATIONSHIP<br>• Validación de funcionalidad |

### 3. Competencias en Medidas y Cálculos (30%)

| Competencia | Puntos Posibles | Criterios de Evaluación |
|-------------|-----------------|-------------------------|
| Medidas Básicas | 8 | • Corrección de las fórmulas<br>• Documentación clara<br>• Agrupación lógica |
| Inteligencia Temporal | 12 | • Implementación de comparativas YoY<br>• Funcionalidad de acumulados<br>• Cálculos de varianza |
| Funciones DAX Avanzadas | 10 | • Uso de CALCULATE, FILTER, ALL<br>• Implementación de tablas calculadas<br>• Optimización de fórmulas |

### 4. Competencias en Seguridad y Optimización (15%)

| Competencia | Puntos Posibles | Criterios de Evaluación |
|-------------|-----------------|-------------------------|
| Seguridad a Nivel de Fila | 8 | • Diseño de modelo de seguridad<br>• Implementación de roles<br>• Pruebas de efectividad |
| Optimización de Rendimiento | 7 | • Análisis de tamaño del modelo<br>• Uso apropiado de columnas calculadas vs. medidas<br>• Optimización de fórmulas DAX |

## Sistema de Puntuación

| Rango de Puntuación | Calificación | Descripción |
|---------------------|--------------|-------------|
| 90-100 | A (Excelente) | Dominio excepcional del modelado de datos. Relaciones complejas implementadas de forma óptima. |
| 80-89 | B (Muy Bueno) | Modelo bien diseñado con relaciones adecuadas y medidas eficientes. Pequeñas áreas de mejora. |
| 70-79 | C (Bueno) | Competencia demostrada en modelado básico con algunas relaciones complejas. Varias áreas necesitan refinamiento. |
| 60-69 | D (Satisfactorio) | Cumple requisitos mínimos de modelado pero requiere mejoras significativas en relaciones y medidas. |
| <60 | F (No Satisfactorio) | No cumple con los requisitos mínimos de modelado de datos. |

## Relevancia para el Examen PL-300

Este laboratorio cubre aproximadamente el 90% del área "Modelar los datos" del examen PL-300, que representa el 30-35% del examen completo. También introduce conceptos importantes del área "Implementar y gestionar" relacionados con la seguridad a nivel de fila.

## Retroalimentación Personalizada

Al completar este laboratorio, se proporcionará una retroalimentación detallada que incluirá:

1. Fortalezas identificadas en el diseño del modelo
2. Áreas específicas de mejora en relaciones y medidas
3. Recomendaciones para optimización adicional
4. Sugerencias para expandir el modelo con características avanzadas

## Preparación para Laboratorios Futuros

El dominio de este laboratorio establece la base para:

- Laboratorio 3: Implementación de visualizaciones avanzadas e interactividad
- Laboratorio 4: Publicación y compartición de informes y conjuntos de datos
- Laboratorio 5: Implementación de soluciones empresariales completas

## Evaluación de Conocimientos Clave

| Concepto | Peso en la Evaluación | Aplicación en el Laboratorio |
|----------|------------------------|------------------------------|
| Esquema estrella vs. copo de nieve | Alto | Diseño conceptual del modelo |
| Relaciones muchos a muchos | Alto | Tabla puente para promociones-productos |
| Contextos de filtro en DAX | Alto | Implementación de medidas avanzadas |
| Inteligencia temporal | Alto | Cálculos YoY, MTD, QTD, YTD |
| Seguridad a nivel de fila | Medio | Implementación de roles por región |
| Optimización de rendimiento | Medio | Análisis y mejora del modelo |

---

*Esta matriz de evaluación está diseñada para medir de manera objetiva las competencias desarrolladas en el Laboratorio 2, con un enfoque en las áreas más relevantes para el examen de certificación PL-300.*