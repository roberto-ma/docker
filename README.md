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

```yaml
# MySQL
version: '3.8'
services:
  mysql:
    image: mysql:8.0
    container_name: mysql_dmq
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: dmq_database
      MYSQL_USER: user_dmq
      MYSQL_PASSWORD: usrdmq
    ports:
      - "3306:3306"
    networks:
      - dmq_th_net
    volumes:
      - mysql_data:/var/lib/mysql
    restart: unless-stopped

volumes:
  mysql_data:

networks:
  dmq_th_net:
    external: true
```

### 3. Desplegar phpMyAdmin

Ejecuta el bloque de configuración de phpMyAdmin desde el archivo `despliegues.txt`:

```yaml
# phpMyAdmin
version: '3.8'
services:
  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    container_name: phpmyadmin_dmq
    environment:
      PMA_HOST: mysql_dmq
      PMA_PORT: 3306
      PMA_USER: user_dmq
      PMA_PASSWORD: usrdmq
    ports:
      - "8080:80"
    networks:
      - dmq_th_net
    depends_on:
      - mysql
    restart: unless-stopped

networks:
  dmq_th_net:
    external: true
```

### 4. Verificar el Estado de los Contenedores

Para verificar que todos los contenedores estén ejecutándose correctamente:

```bash
docker ps -a
```

Deberías ver algo similar a:

```
CONTAINER ID   IMAGE                          COMMAND                  CREATED          STATUS          PORTS                                                  NAMES
abc123def456   phpmyadmin/phpmyadmin:latest   "/docker-entrypoint.…"   2 minutes ago    Up 2 minutes    0.0.0.0:8080->80/tcp                                   phpmyadmin_dmq
789ghi012jkl   mysql:8.0                      "docker-entrypoint.s…"   3 minutes ago    Up 3 minutes    0.0.0.0:3306->3306/tcp, 33060/tcp                     mysql_dmq
```

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
