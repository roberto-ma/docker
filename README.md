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

   <img width="886" height="890" alt="image" src="https://github.com/user-attachments/assets/12ff8926-1a63-4655-b225-d0e2a4668481" />

   <img width="886" height="906" alt="image" src="https://github.com/user-attachments/assets/80d54e09-2fa8-41bc-b562-07ee6c7dffb6" />


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

### Verificar Conectividad de Red
```bash
docker network inspect dmq_th_net
```

## 📝 Notas

- Los datos de MySQL se persisten en un volumen Docker llamado `mysql_data`
- La red `dmq_th_net` permite la comunicación entre los contenedores

