# Docker MySQL + phpMyAdmin Setup

Este proyecto contiene la configuración para desplegar una base de datos MySQL junto con phpMyAdmin utilizando Docker y Docker Compose.

## 📋 Requisitos

- Docker Engine
- Docker Compose
- Navegador web

## 🚀 Instalación y Configuración

### 1. Crear la Red Docker

Primero, crea una red personalizada para los contenedores:

```bash
docker network create dmq_th_net
```

### 2. Desplegar MySQL

Ejecuta el bloque de configuración de MySQL desde el archivo `despliegues.txt`:

<img width="875" height="250" alt="image" src="https://github.com/user-attachments/assets/22097b22-2ec1-45ce-b636-cc08d23470bf" />


### 3. Desplegar phpMyAdmin

Ejecuta el bloque de configuración de phpMyAdmin desde el archivo `despliegues.txt`:
<img width="886" height="715" alt="image" src="https://github.com/user-attachments/assets/40103be2-ebd9-49dc-b016-2ce4302710cc" />



### 4. Verificar el Estado de los Contenedores

Para verificar que todos los contenedores estén ejecutándose correctamente:

```bash
docker ps -a
```
<img width="886" height="50" alt="image" src="https://github.com/user-attachments/assets/dd337639-c1f8-4a8a-9f31-a7bc62b98295" />



## 🌐 Acceso a phpMyAdmin

### Credenciales de Acceso

- **URL**: http://localhost:8080
- **Usuario**: `user_dmq`
- **Contraseña**: `usrdmq`

### Verificación en el Navegador

1. Abre tu navegador web
2. Navega a `http://localhost:8080`
3. Ingresa las credenciales:
   - Usuario: `user_dmq`
   - Contraseña: `usrdmq`
4. Deberías poder acceder al panel de phpMyAdmin

## 📁 Estructura del Proyecto

```
proyecto/
├── despliegues.txt          # Archivo con las configuraciones Docker Compose
├── README.md               # Este archivo
└── docker-compose.yml     # (Opcional) Archivo combinado de ambos servicios
```

## 🔧 Comandos Útiles

### Detener los Contenedores
```bash
docker-compose down
```

### Ver Logs de los Contenedores
```bash
# MySQL
docker logs mysql_dmq

# phpMyAdmin
docker logs phpmyadmin_dmq
```

### Acceso Directo a MySQL
```bash
docker exec -it mysql_dmq mysql -u user_dmq -p
```

### Eliminar Todo (Incluidos los Volúmenes)
```bash
docker-compose down -v
docker network rm dmq_th_net
```

## 🚨 Troubleshooting

### Problemas Comunes

1. **Puerto 3306 ya en uso**
   - Verifica si hay otra instancia de MySQL ejecutándose
   - Cambia el puerto en el docker-compose: `"3307:3306"`

2. **Puerto 8080 ya en uso**
   - Cambia el puerto de phpMyAdmin: `"8081:80"`

3. **No se puede conectar a phpMyAdmin**
   - Verifica que ambos contenedores estén en la misma red
   - Confirma que MySQL esté completamente iniciado antes de phpMyAdmin

### Verificar Conectividad de Red
```bash
docker network inspect dmq_th_net
```

## 📝 Notas

- Los datos de MySQL se persisten en un volumen Docker llamado `mysql_data`
- La red `dmq_th_net` permite la comunicación entre los contenedores
- Los contenedores se reiniciarán automáticamente a menos que se detengan manualmente

## 🤝 Contribuciones

Si encuentras algún problema o tienes sugerencias de mejora, por favor crea un issue o envía un pull request.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
