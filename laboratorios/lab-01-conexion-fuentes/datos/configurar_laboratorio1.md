# Instrucciones para Configurar el Laboratorio 1

Este documento proporciona los pasos necesarios para preparar los archivos de datos y el entorno para el Laboratorio 1: "Conexión a Múltiples Fuentes y Transformación de Datos" para la certificación PL-300.

## Archivos Necesarios

Para este laboratorio, necesitarás los siguientes archivos que se han preparado:

1. `ventas_2022_2023.xlsx` - Datos de ventas en formato Excel
2. `Clientes.csv` - Información de clientes en formato CSV
3. `[Script SQL]` - Script para crear la base de datos "Inventario"
4. Archivos JSON de promociones (al menos 3 archivos)

## Pasos de Configuración

### 1. Preparar el Archivo Excel

1. Crea un nuevo archivo Excel llamado `ventas_2022_2023.xlsx`
2. Crea dos hojas: "VentasMensuales" y "Productos"
3. En cada hoja, copia los datos proporcionados en el formato adecuado
4. Asegúrate de mantener los problemas de calidad de datos deliberados (espacios, mayúsculas, nulos, duplicados)
5. Guarda el archivo en tu carpeta de trabajo

### 2. Preparar el Archivo CSV

1. Crea un archivo de texto y guárdalo como `Clientes.csv`
2. Copia los datos proporcionados, asegurándote de que los campos estén correctamente delimitados por comas
3. Incluye algunos registros duplicados y problemas de datos para el ejercicio de limpieza
4. Guarda el archivo en tu carpeta de trabajo

### 3. Configurar la Base de Datos SQL Server

**Opción A: Si tienes SQL Server instalado localmente:**

1. Abre SQL Server Management Studio o Azure Data Studio
2. Conecta a tu instancia local de SQL Server
3. Ejecuta el script SQL proporcionado para crear la base de datos "Inventario" con sus tablas y datos

**Opción B: Si no tienes SQL Server instalado:**

1. Descarga e instala SQL Server Express (gratuito) desde el sitio web de Microsoft
2. Instala SQL Server Management Studio o Azure Data Studio
3. Continúa con los pasos de la Opción A

**Opción C: Usar SQL Server en Azure (si tienes una suscripción):**

1. Crea una base de datos SQL en Azure
2. Conéctate usando Azure Data Studio o SQL Server Management Studio
3. Ejecuta el script SQL proporcionado

### 4. Preparar los Archivos JSON

1. Crea una nueva carpeta llamada `Promociones` en tu carpeta de trabajo
2. Crea al menos 3 archivos JSON con los nombres:
   - `promociones_2022_Q1.json`
   - `promociones_2022_Q2.json`
   - `promociones_2022_Q3.json`
   - `promociones_2023_Q1.json` (opcional)
3. Copia los datos JSON proporcionados en cada archivo
4. Guarda los archivos en la carpeta `Promociones`

## Verificación de la Configuración

Antes de comenzar el laboratorio, verifica lo siguiente:

1. **Excel**: Abre el archivo y asegúrate de que contiene las dos hojas con los datos correctos
2. **CSV**: Abre el archivo en un editor de texto para verificar que el formato es correcto
3. **Base de datos**: Verifica la conexión a SQL Server y que puedes ejecutar:
   ```sql
   SELECT * FROM Inventario.dbo.vw_InventarioCompleto;
   ```
4. **Archivos JSON**: Abre cada archivo JSON en un editor de texto y verifica el formato

## Consejos

- Si tienes problemas con la base de datos SQL Server, puedes usar SQLite como alternativa más ligera
- Para verificar archivos JSON, puedes usar herramientas online como JSONLint para validar el formato
- Si no puedes crear la base de datos, una alternativa es generar un archivo CSV con los datos del inventario

## Siguientes Pasos

Una vez que hayas configurado todos los archivos y el entorno, puedes proceder con las tareas del Laboratorio 1 según las instrucciones detalladas.

---

*Recuerda que estos archivos contienen problemas de calidad de datos deliberados que deberás identificar y corregir durante el laboratorio como parte del ejercicio de transformación y limpieza de datos.*