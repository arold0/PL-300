# Instrucciones para Configurar el Laboratorio 2

Este documento proporciona los pasos necesarios para preparar los archivos de datos y el entorno para el Laboratorio 2: "Creación de Modelo de Datos con Relaciones Complejas" para la certificación PL-300.

## Archivos Necesarios

Para este laboratorio, necesitarás los siguientes archivos que se han preparado:

1. `VentasDetalladas_2022_2023.xlsx` - Datos de ventas detallados en formato Excel
2. `InventarioActualizado.xlsx` - Información de inventario actualizada
3. `Geografias.csv` - Datos geográficos jerárquicos
4. `Empleados.csv` - Información de empleados para RLS
5. `CanalVentas.csv` - Información sobre canales de venta
6. `CategoriaProductos.csv` - Jerarquía de categorías de productos
7. Archivos JSON de promociones (mismos del Laboratorio 1)

## Pasos de Configuración

### 1. Preparar los Archivos Excel

#### 1.1 VentasDetalladas_2022_2023.xlsx

1. Crea un nuevo archivo Excel llamado `VentasDetalladas_2022_2023.xlsx`
2. Crea una hoja llamada "VentasDetalladas"
3. Incluye las siguientes columnas:
   - VentaID
   - Fecha
   - ClienteID
   - ProductoID
   - EmpleadoID
   - CanalVentaID
   - Cantidad
   - PrecioUnitario
   - Descuento
   - Costo
   - FechaEnvio
   - MetodoPago
   - RegionVenta
4. Incluye al menos 500 registros que cubran el período 2022-2023
5. Asegúrate de incluir algunos casos de:
   - Descuentos variados
   - Diferentes métodos de pago
   - Envíos en fechas distintas a las ventas

#### 1.2 InventarioActualizado.xlsx

1. Crea un nuevo archivo Excel llamado `InventarioActualizado.xlsx`
2. Crea una hoja llamada "InventarioActual"
3. Incluye las siguientes columnas:
   - InventarioID
   - ProductoID
   - UbicacionID
   - CantidadDisponible
   - FechaUltimoConteo
   - ValorInventario
   - EstadoStock (Óptimo, Bajo, Crítico)
   - DiasPromedioReposicion
4. Incluye al menos 200 registros de diferentes productos y ubicaciones

### 2. Preparar los Archivos CSV

#### 2.1 Geografias.csv

1. Crea un archivo CSV llamado `Geografias.csv`
2. Incluye las siguientes columnas:
   - GeoID
   - Pais
   - Region
   - Ciudad
   - CodigoPostal
   - Latitud
   - Longitud
   - RegionVentas
   - ZonaHoraria
3. Incluye datos para todas las regiones mencionadas en las ventas

#### 2.2 Empleados.csv

1. Crea un archivo CSV llamado `Empleados.csv`
2. Incluye las siguientes columnas:
   - EmpleadoID
   - Nombre
   - Apellido
   - Email
   - Puesto
   - Departamento
   - FechaContratacion
   - RegionAsignada
   - GerenteID (para relaciones jerárquicas)
   - Activo (1/0)
3. Incluye al menos 50 empleados con diferentes regiones asignadas

#### 2.3 CanalVentas.csv

1. Crea un archivo CSV llamado `CanalVentas.csv`
2. Incluye las siguientes columnas:
   - CanalVentaID
   - NombreCanal (Online, Tienda física, Teléfono, Distribuidor)
   - Descripcion
   - ComisionPromedio
   - CostoOperativo
   - FechaInicio
   - Estado
3. Incluye al menos 4-6 diferentes canales de venta

#### 2.4 CategoriaProductos.csv

1. Crea un archivo CSV llamado `CategoriaProductos.csv`
2. Incluye las siguientes columnas:
   - CategoriaID
   - CategoriaPadreID (para relaciones jerárquicas)
   - NombreCategoria
   - Nivel (1=Categoría, 2=Subcategoría, 3=Grupo)
   - Descripcion
   - DepartamentoResponsable
3. Incluye una estructura jerárquica de al menos 3 niveles con relaciones padre-hijo

### 3. Verificación de JSON de Promociones

1. Reutiliza los archivos JSON de promociones del Laboratorio 1
2. Verifica que tienen las siguientes propiedades:
   - PromocionID
   - Descripcion
   - FechaInicio
   - FechaFin
   - Descuento
   - ProductosAplicables (array)
   - RequiereCodigoCupon
   - CodigoCupon
   - RegionesDisponibles (array)

### 4. Preparar el Entorno de Trabajo

1. Crea una carpeta llamada "Laboratorio2" en tu directorio de trabajo
2. Organiza los archivos en las siguientes subcarpetas:
   - /Excel - Para archivos Excel
   - /CSV - Para archivos CSV
   - /JSON - Para archivos JSON
3. Copia todos los archivos preparados a sus respectivas carpetas

## Características Específicas para el Laboratorio

Para asegurar que los estudiantes puedan practicar todos los conceptos requeridos, asegúrate de que los datos incluyan:

### 1. Para Relaciones Muchos a Muchos
- Productos que pertenecen a múltiples categorías
- Promociones que aplican a múltiples productos
- Clientes que pertenecen a múltiples segmentos

### 2. Para Jerarquías Avanzadas
- Estructura completa País > Región > Ciudad en Geografias.csv
- Estructura jerárquica en CategoriaProductos.csv
- Estructura de gestión en Empleados.csv (Gerente > Empleado)

### 3. Para Inteligencia Temporal
- Datos distribuidos en 2 años completos (2022-2023)
- Patrones estacionales en ventas
- Promociones en períodos específicos

### 4. Para Seguridad a Nivel de Fila
- Empleados asignados a regiones específicas 
- Departamentos con diferentes niveles de acceso

## Verificación Final

Antes de comenzar el laboratorio, verifica lo siguiente:

1. **Integridad Referencial**: Asegúrate de que los IDs entre las diferentes tablas sean consistentes
2. **Cobertura Temporal**: Confirma que los datos cubran todo el período 2022-2023
3. **Valores Atípicos**: Incluye algunos valores atípicos para que los estudiantes puedan practicar su identificación
4. **Problemas de Calidad de Datos**: Introduce intencionalmente algunos problemas de calidad de datos para que los estudiantes practiquen su limpieza

## Consejos para Instructores

- Los estudiantes pueden necesitar ayuda para entender las relaciones muchos a muchos y cómo implementarlas
- La seguridad a nivel de fila suele ser un tema complejo para los principiantes
- Recomienda a los estudiantes que comiencen por dibujar el modelo en papel antes de implementarlo
- Sugiere comenzar con un subconjunto de datos para probar el modelo antes de usar el conjunto completo

---

*Recuerda que el objetivo principal de este laboratorio es que los estudiantes practiquen la creación de un modelo de datos complejo con diferentes tipos de relaciones, jerarquías y medidas avanzadas. La configuración de estos datos debe permitirles desarrollar todas estas competencias.*