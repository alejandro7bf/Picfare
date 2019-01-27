# Picfare
### IOS Themoviedb.org
Swift & XCODE
Alamofire
Swiftyjson
## 1. Las capas de la aplicación (por ejemplo capa de persistencia, vistas, red, negocio, etc) y qué clases pertenecen a cual.

Para el desarrollo de esta aplicación se utilizó la arquitectura Modelo Vista Controlador (MVC), por ende existe una capa
de vistas, una de los controladores y por último una del modelo. 

Vistas: Storyboards: Launch Screen, Main (home), Detail
Controladores: Main and Detail controllers.
Modelo: Movie y sus herederos que hacen la conexión a la base de datos de Themoviedb.org a traves de la clase API.

## 2. La responsabilidad de cada clase creada.

 En la capa del modelo, se creo la clase Movie, en donde se genera la estructura de los datos y realiza la obtención de 
 los datos a través de la clase API. Por otro lado, existen 3 clases que heredan de movie , ya que pertenecen a diferentes
 categorias : 'Top Rated', 'Up Coming' y 'Popular'
 
 En la capa de controladores, se crearon dos controladores que se encargan de la comunicación entre el modelo y las vistas, para 
 realizar un correcto despliegue de la información.
 
 ## 3. En qué consiste el principio de responsabilidad única? Cuál es su propósito?
 
 Este principio hace referencia a que cada clase debe tener una única funcionalidad, es decir, que en una misma clase
 existan funciones de la capa del modelo y de la vista. Es decir, que toda la responsabilidad de una función la debe hacer esa 
 clase sin tener que compartir métodos con otras clases.
 
## 4. Qué características tiene, según su opinión, un “buen” código o código limpio

En mi parecer es muy subjetivo, aunque existan muchos patrones y arquitecturas, no existen reglas de oro para definir
cuando existe un "buen código", de hecho, creo que de ahí surge la necesidad de tratar de estandarizar el código por medio
de patrones de diseño, arquitecturas etc. 

Sin embargo, considero que escribir código, aparte de ser un set de instrucciones para que la maquina ejecute, tambien debe
ser un set de instrucciones para que cualquier persona incluso sino sabe programar ,lo entienda.
¿Cómo se logra esto?
Con nombres acordes para las funciones y atributos; y comentarios que den cuenta lo que hace cada porción de código, y digo pórcion porque considero que
la programación debe ser modular con el fin de que exista tolerancia a los fallos y pueda ser escalable en el tiempo.

Muchas gracias!
