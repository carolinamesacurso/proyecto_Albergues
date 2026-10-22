# Albergues \--- PostgreSQL e Adminer con Docker Compose

Este proyecto trata de levantantar con contendores una estructura con varios servicios para poder trabajar con la base de datos Albergues.

Para esto utilizaremos las imágenes de postgressql y Adminer , las cuales nos dejarán tratar y visualizar la base de datos por una url .

## Estrutura do proxecto

.

├── compose.yml

├── .env.example

├── .gitignore

├── .env   #no se sube al repositorio              

└── initdb/

&nbsp;&nbsp;&nbsp;&nbsp;├── 01\_tablas.sql  

&nbsp;&nbsp;&nbsp;&nbsp;└── 02\_datos.sql 

## Requisitos

- Docker desktop instalado.

## Como arrancar o proxecto paso a paso

### 1\. Clonar el poryecto (ubuntu)

Crea una estructura de subcarpetas donde se pueda clonar el repositorio con los siguientes comandos:

mkdir carpetaEjemplo

&nbsp;

### 2\. Crea el enviroment y actívalo

&nbsp;python3 \-m venv .venv

&nbsp;source .venv/bin/activate

### 3\. Clona el repositorio

```powershell
git clone https://github.com/carolinamesacurso/proyecto_Albergues
```

&nbsp;

Configura los valores reales de las variables en el archivo .env .

***1-*** Realiza un 'code .' para poder abrir el proyecto en visual studio

***2-*** El proyecto te proporcionará un '.env.example' el cual tendrás que copiar para crear el fichero '.env' donde realizaremos los siguientes pasos.

```dotenv
Modifica estas variables en '.env' para configurar el usuario , contraseña y base de datos a utilizar

POSTGRES_USER=***
POSTGRES_PASSWORD=***
POSTGRES_DB=***
```

&nbsp;

### 4\. Levantar los servicios

docker compose up

Los ficheiros compatibles de `initdb/` se ejecutan automaticamente en orden solo cuando los volumenes no estaban incializados. Localización de los scripts en /initdb:

1. `01_tablas.sql` crea la tabla `albergues`.  
2. `02_datos.sql` añade 8 registros.

### 5\. Acceder al Adminer para trabajara con la base de datos

Con la siguiente url se incia sesión para poder trabajar con los contenedores [http\://localhost:8080](http://localhost:8080):

Servidor ,Usurio, Contraseña : Valores que están guardados en .env

## Prueba de persistencia

En esta parte realizamos una prueba donde se comprueba los resultados de cada uno de los siguientes pasos:

***1 \-*** docker compose up \-d : Inicializamos el proyecto con sus contenedores en base a las imágenes

***2 \-*** Insertamos un nuevo albergue : Al volver a visualizar el contenido lo vemos reflejado con los anteriores caminos

&nbsp;INSERT INTO albergues

&nbsp;&nbsp;&nbsp;&nbsp;(identificador, nome, concello, camino, num\_prazas, prezo\_noite)

VALUES

&nbsp;&nbsp;&nbsp;&nbsp;(9, 'Albergue de prueba de persistencia', 'prueba', 'persistencia', 40, 15.00);

***3-*** docker compose down y docker compose up \-d :

En el primer comando eliminamos solo los contenedores. En el segundo lso levantamos y visualizamos de nuevo nuestros datos ya guardados en las tablas correspondientes

***4-*** docker compose down \-v e docker compose up \-d

Con estos comando comprobamos que al añadir la parte del comando '-v' estamos indicando que vamso a eliminar los volumenes creados con anterioridad en la siguiente ruta :

volumes:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\- postgres\_data:/var/lib/postgresql/data

Al volver a levantar los contenedores observamos que al no insertar nuestro albergue de prueba en el script este ha dejado de visualizarse en la tabla , es decir , lo tendríamos que volver a crear ya que las tablas han dejado de existir.
