# Instrucciones para Configurar el Laboratorio 3

Este documento proporciona los pasos necesarios para preparar los archivos de datos y el entorno para el Laboratorio 3: "Implementación de Medidas DAX Avanzadas" para la certificación PL-300.

## Archivos Necesarios

Para este laboratorio, necesitarás los siguientes archivos:

1. `Ventas_2022_2023_Completo.xlsx` - Datos de ventas ampliados con más información para análisis avanzado
2. `Presupuesto_2022_2023.xlsx` - Datos de presupuesto para realizar comparativas
3. `Metricas_Objetivos.xlsx` - Información sobre objetivos de KPIs para evaluación de rendimiento
4. Archivo PBIX del Laboratorio 2 (opcional) - Base para continuar el desarrollo

## Pasos de Configuración

### 1. Preparar el Archivo de Ventas Ampliado

1. Genera el archivo `Ventas_2022_2023_Completo.xlsx` utilizando el script Python proporcionado
2. Este archivo es una versión ampliada de los datos de ventas, con:
   - Mayor volumen de transacciones (2000+ registros)
   - Campos adicionales:
     - Categoría de Cliente
     - Segmento de Mercado
     - Canal de Marketing
     - Campaña Promocional
     - Método de Envío
     - Indicador de Devolución
     - Rentabilidad detallada

### 2. Preparar el Archivo de Presupuesto

1. Crea/genera el archivo `Presupuesto_2022_2023.xlsx` con los siguientes elementos:
   - Hoja "Presupuesto_Mensual" con columnas:
     - Año
     - Mes
     - Categoría de Producto
     - Región
     - Presupuesto de Ventas
     - Presupuesto de Unidades
     - Presupuesto de Costos
   - Debe cubrir todos los meses de 2022-2023 para principales categorías y regiones

### 3. Preparar el Archivo de Métricas y Objetivos

1. Crea/genera el archivo `Metricas_Objetivos.xlsx` con:
   - Hoja "Objetivos_KPI" con columnas:
     - Año
     - Mes (opcional)
     - Trimestre (opcional)
     - Métrica (ej. Ventas, Margen, Ticket Medio)
     - Valor Objetivo
     - Umbral Mínimo
     - Umbral Óptimo
   - Hoja "Segmentación_Productos" con columnas:
     - ProductoID
     - Categoría ABC (A=Top 20%, B=Siguiente 30%, C=Restante 50%)
     - Nivel de Rotación
     - Margen Objetivo

### 4. Configurar el Entorno de Trabajo

1. Crea una carpeta llamada "Laboratorio3" en tu directorio de trabajo
2. Organiza los archivos en las siguientes subcarpetas:
   - /Datos - Para archivos de datos
   - /Scripts - Para scripts de generación
   - /Soluciones - Para archivos PBIX de ejemplo
3. Copia todos los archivos preparados a sus respectivas carpetas

## Características Específicas para el Laboratorio

Para asegurar que los estudiantes puedan practicar todos los conceptos DAX requeridos, asegúrate de que los datos incluyan:

### 1. Para Inteligencia Temporal
- Datos distribuidos a lo largo de 24 meses completos (2022-2023)
- Patrones estacionales claros (picos en ciertos meses)
- Tendencias a lo largo del tiempo (crecimiento/decrecimiento)
- Algunos períodos con comportamiento atípico para análisis de anomalías

### 2. Para Análisis de Rentabilidad
- Variedad en márgenes entre productos/categorías
- Relación entre volumen y márgenes (algunos productos de alto volumen/bajo margen, otros al revés)
- Diferencias regionales en rentabilidad
- Evolución de márgenes a lo largo del tiempo

### 3. Para Comparativas con Objetivos
- Mezcla de objetivos alcanzados y no alcanzados
- Algunos objetivos fácilmente alcanzables y otros más ambiciosos
- Objetivos que varían estacionalmente
- Distintos criterios de evaluación según categoría/región

### 4. Para Patrones DAX Avanzados
- Productos con múltiples categorías/clasificaciones
- Clientes con historiales de compra variados para análisis de cohortes
- Información de primera/última compra para análisis de actividad
- Datos para análisis ABC (productos, clientes)

## Verificación Final

Antes de comenzar el laboratorio, verifica lo siguiente:

1. **Integridad de Datos**: Asegúrate de que todos los archivos contienen información completa
2. **Consistencia**: Verifica que haya consistencia entre los diferentes archivos (mismos períodos, categorías, etc.)
3. **Volumen**: Confirma que hay suficientes datos para realizar análisis significativos
4. **Complejidad**: Comprueba que los datos presentan suficiente variedad para implementar medidas complejas

## Consejos para Instructores

- Recuerda a los estudiantes que deben crear medidas en lugar de columnas calculadas cuando sea apropiado
- Sugiere empezar con medidas básicas antes de avanzar a las más complejas
- Recomienda el uso de variables para mejorar la legibilidad y rendimiento
- Enfatiza la importancia de probar las medidas en diferentes contextos de filtro

## Recursos Adicionales para la Configuración

- Puedes utilizar el script Python proporcionado para generar datos sintéticos con patrones realistas
- Considera proporcionar una guía de formato DAX con ejemplos de buenas prácticas
- Incluye referencias a documentación oficial y recursos de DAX

---

*Nota: Los archivos de datos están diseñados para permitir la implementación de todos los conceptos DAX requeridos en el laboratorio, con suficiente complejidad para desafiar a los estudiantes mientras mantienen un nivel apropiado para el examen PL-300.*