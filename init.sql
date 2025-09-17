-- init.sql

-- Tabla de empleados
CREATE TABLE IF NOT EXISTS empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(100) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

-- Tabla de registros de asistencia
CREATE TABLE IF NOT EXISTS asistencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIME,
    hora_salida_almuerzo TIME,
    hora_entrada_almuerzo TIME,
    hora_salida TIME,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id) ON DELETE CASCADE
);

-- Datos de ejemplo
INSERT INTO empleados (nombre, puesto, activo) VALUES
('Juan Pérez', 'Administrador', TRUE),
('Ana López', 'Desarrolladora', TRUE);

-- Insertar registros de asistencia de ejemplo
INSERT INTO asistencias (empleado_id, fecha, hora_entrada, hora_salida_almuerzo, hora_entrada_almuerzo, hora_salida) VALUES
(1, '2025-09-12', '08:00:00', '12:30:00', '13:30:00', '17:00:00'),
(2, '2025-09-12', '08:30:00', '12:45:00', '13:45:00', '17:30:00');

