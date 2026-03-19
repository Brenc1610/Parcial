# Guía de Instalación y Ejecución del Proyecto

Sigue estos pasos para configurar y ejecutar el proyecto en tu PC local después de descargar el archivo ZIP.

---

## 📋 Prerrequisitos
Antes de empezar, asegúrate de tener instalado:
1. **Node.js** (LTS recomendado).
2. **Flutter SDK** (configurado en tu variable de entorno PATH).
3. **XAMPP** o cualquier servidor **MySQL**.

---

## 🛠️ Paso 1: Configurar la Base de Datos
1. Abre **phpMyAdmin** (o tu gestor MySQL preferido).
2. Crea una nueva base de datos llamada `api-crud`.
3. Importa el archivo SQL que se encuentra en:  
   `./api_basic/db/api-crud.sql`
   *(Asegúrate de que la tabla `api_users` tenga activado el Auto-Incremento).*

---

## 🖥️ Paso 2: Configurar el Backend (API)
1. Abre una terminal en la carpeta `api_basic`.
2. Instala las dependencias de Node.js:
   ```bash
   npm install
   ```
3. Verifica el archivo `.env` para asegurar que las credenciales de tu MySQL (usuario y contraseña) coincidan con tu configuración local.
4. Inicia el servidor:
   ```bash
   npm start
   ```
   *El servidor debería correr en `http://localhost:3000`.*

---

## 📱 Paso 3: Configurar el Frontend (Flutter)
1. Abre una nueva terminal en la carpeta `flutter`.
2. Descarga las dependencias de Flutter:
   ```bash
   flutter pub get
   ```
3. Ejecuta la aplicación:
   - **Para Navegador (Web)**:
     ```bash
     flutter run -d chrome
     ```
   - **Para Emulador Android**:
     *(Asegúrate de tener un emulador abierto).*
     ```bash
     flutter run
     ```

---

## 🔗 Notas de Conexión
La aplicación está configurada para conectarse automáticamente:
- Si usas **Web**, se conecta a `localhost`.
- Si usas **Emulador Android**, se conecta a la IP `10.0.2.2` (que mapea a tu localhost).

## 🚀 ¡Listo!
Ya puedes registrarte, iniciar sesión y navegar por los módulos de la aplicación.
