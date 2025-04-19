# Laboratorio 1: Conexión a Múltiples Fuentes y Transformación de Datos

## Objetivo del Laboratorio

Este laboratorio está diseñado para desarrollar habilidades fundamentales en la obtención, limpieza y transformación de datos de múltiples fuentes utilizando Power BI Desktop. Estas habilidades son esenciales para la certificación PL-300 y representan aproximadamente el 25-30% del contenido del examen.

## Escenario

Eres un analista de datos para una cadena minorista internacional. La empresa necesita consolidar datos de ventas, inventario y clientes de diferentes sistemas para crear un informe unificado. Los datos provienen de:

1. Un archivo Excel con datos de ventas
2. Una base de datos SQL Server con datos de inventario
3. Un archivo CSV con información de clientes
4. Una carpeta con archivos JSON que contienen datos de promociones

## Áreas de Conocimiento Abarcadas

| Área de Conocimiento | Subáreas | Relevancia para PL-300 |
|----------------------|----------|------------------------|
| Obtener datos de diferentes fuentes | - Conectores de datos<br>- Opciones de importación<br>- Modos de almacenamiento | Alta |
| Perfilar datos | - Identificación de anomalías<br>- Estadísticas de resumen<br>- Evaluación de calidad | Alta |
| Transformar datos | - Limpieza<br>- Combinación de consultas<br>- Funciones personalizadas | Alta |
| Cargar datos | - Optimización del modelo<br>- Creación de relaciones<br>- Implementación de tablas de fechas | Media-Alta |

## Requisitos Previos

1. Power BI Desktop instalado (última versión)
2. [Archivos de laboratorio descargados](https://github.com/tu-usuario/PL-300/datos) que incluyen:
   - `Ventas_2022_2023.xlsx`
   - Acceso a la base de datos de ejemplo (o script para crearla localmente)
   - `Clientes.csv`
   - Carpeta con archivos JSON de promociones

## Tareas del Laboratorio

### Parte 1: Conexión a Fuentes de Datos (25 puntos)

1. **Conectar a Excel (5 puntos)**
   - Abrir Power BI Desktop y crear un nuevo archivo
   - Conectar al archivo `Ventas_2022_2023.xlsx`
   - Seleccionar las tablas `VentasMensuales` y `Productos`
   - Evaluar las opciones de importación y elegir la más adecuada

2. **Conectar a SQL Server (7 puntos)**
   - Utilizar el conector de SQL Server
   - Conectar a la base de datos `Inventario`
   - Escribir una consulta SQL para obtener solo los registros de inventario activos
   - Configurar opciones de privacidad

3. **Conectar a CSV (5 puntos)**
   - Importar el archivo `Clientes.csv`
   - Configurar el delimitador correcto
   - Establecer tipos de datos apropiados

4. **Conectar a múltiples archivos JSON (8 puntos)**
   - Utilizar el conector de carpeta
   - Apuntar a la carpeta con archivos JSON
   - Combinar los archivos
   - Expandir y seleccionar las columnas necesarias

### Parte 2: Perfilado y Transformación de Datos (40 puntos)

5. **Perfilado de Datos (10 puntos)**
   - Utilizar herramientas de perfilado para identificar problemas de calidad
   - Generar estadísticas descriptivas (mín, máx, distribución)
   - Documentar anomalías encontradas

6. **Limpieza de Datos (15 puntos)**
   - Eliminar filas duplicadas
   - Manejar valores nulos y faltantes
   - Estandarizar formatos (fechas, monedas, textos)
   - Crear columnas calculadas para derivar información útil

7. **Transformaciones Avanzadas (15 puntos)**
   - Crear una función personalizada para estandarizar nombres de productos
   - Aplicar trasposición de datos donde sea necesario
   - Utilizar columnas condicionales
   - Implementar operaciones de agrupación

### Parte 3: Modelo de Datos Inicial (25 puntos)

8. **Crear una Tabla de Calendario (10 puntos)**
   - Crear una tabla de fechas personalizada que cubra el rango de datos
   - Añadir columnas para año, trimestre, mes, semana, día
   - Añadir columnas para filtros empresariales (día hábil, fin de semana, temporada)

9. **Establecer Relaciones (10 puntos)**
   - Crear relaciones adecuadas entre todas las tablas
   - Configurar la cardinalidad y dirección de filtro correctamente
   - Validar las relaciones con diagramas

10. **Optimizar el Modelo (5 puntos)**
    - Renombrar tablas y campos con nomenclatura clara
    - Ocultar campos innecesarios
    - Organizar campos en jerarquías lógicas
    - Establecer formatos adecuados

### Parte 4: Documentación y Evaluación (10 puntos)

11. **Documentar el Proceso (5 puntos)**
    - Crear una tabla de metadatos que documente las fuentes
    - Añadir descripciones a las tablas y campos principales
    - Documentar las decisiones de transformación

12. **Evaluación Final (5 puntos)**
    - Evaluar el rendimiento de las consultas
    - Identificar oportunidades de optimización adicional
    - Asegurar que el modelo cumpla con los requisitos

## Entregables

1. Archivo Power BI (.pbix) con todas las conexiones y transformaciones
2. Documento con capturas de pantalla de cada paso principal
3. Respuestas a las preguntas de reflexión (ver abajo)

## Preguntas de Reflexión

1. ¿Qué problemas de calidad de datos encontraste y cómo los resolviste?
2. ¿Cuáles son las ventajas y desventajas de usar consultas SQL nativas versus transformar los datos en Power Query?
3. ¿Qué consideraciones de rendimiento tuviste en cuenta al diseñar tus transformaciones?
4. ¿Cómo se podría mejorar el proceso para actualizaciones incrementales de datos?

## Rúbrica de Evaluación

| Calificación | Descripción |
|--------------|-------------|
| 90-100 | Excelente: Todas las conexiones funcionan correctamente, transformaciones óptimas, modelo bien diseñado |
| 80-89 | Muy Bueno: Conexiones correctas, buenas transformaciones, modelo con pequeñas oportunidades de mejora |
| 70-79 | Bueno: Funcionalidad básica correcta, algunas transformaciones podrían optimizarse |
| 60-69 | Satisfactorio: Cumple requisitos mínimos, varios aspectos requieren mejora |
| <60 | No Satisfactorio: No cumple con los requisitos mínimos |

## Recursos Adicionales

- [Documentación oficial de Power Query](https://docs.microsoft.com/power-query/)
- [Mejores prácticas para conexiones de datos en Power BI](https://docs.microsoft.com/power-bi/guidance/power-query-best-practices)
- [Optimización de modelos de datos](https://docs.microsoft.com/power-bi/guidance/star-schema)

---

## Extensiones Opcionales

Para estudiantes avanzados o con experiencia previa, considere estas tareas adicionales:

1. Implementar parámetros para hacer flexible la conexión a fuentes de datos
2. Crear consultas de conexión incrementales para grandes conjuntos de datos
3. Implementar transformaciones con código M avanzado
4. Diseñar un proceso de actualización optimizado para múltiples fuentes

---

*Nota: Este laboratorio se alinea con los objetivos del examen PL-300 y cubre específicamente el área "Preparar los datos (25-30%)"*