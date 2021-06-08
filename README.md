# Prevalencia
## Estudio sobre prevalencia, comportamiento y características de los usuarios de juego de azar en España.

Nuestro conjunto de datos original está formado por el utilizado para la realización del 
Estudio sobre prevalencia, comportamiento y características de los usuarios de juego de azar en España[1] 
por La Dirección General de Ordenación del Juego perteneciente al Ministerio de Consumo.
[1] Dirección General de Ordenación del Juego. MINISTERIO DE CONSUMO. Estudio sobre prevalencia, 
comportamiento y características de los usuarios de juego de azar en España [en línea]. 
[Fecha de consulta: 20 de abril de 2021]. 
Disponible en: https://ordenacionjuego.es/es/estudio-prevalencia

Adjuntamos un archivo pdf con el estudio del Ministerio de Consumo (estudio_prevalencia_2015.pdf).

Este conjunto de datos original está formado por las respuestas a un cuestionario  realizado en el 
año 2015 a personas que afirman haber jugado a juegos de azar habiendo gastado un 
mínimo de dinero. La muestra es representativa del conjunto de España habiéndose 
realizado 6.816 entrevistas. El cuestionario lo forman un total de 59 preguntas que 
conforman un total de 234 variables. 

Estas preguntas las podemos dividir en tres bloques; el primero formado por el grupo 
de preguntas “P0” relativos al lugar de residencia, el segundo formado por las 
preguntas “P1” a “P50” relativo al comportamiento respecto al juego de los 
entrevistados y un último bloque formado por las preguntas “D1” a “D8” referente a 
cuestiones sociodemográficas de los entrevistados. Las preguntas correspondientes al 
primer bloque son del tipo categórico, las del segundo bloque son del tipo categórico y 
de escala de Likert y las del último bloque son del tipo categórico, pudiendo ser 
considerada alguna de ellas ordinal. Las distintas categorías de las variables se 
recodifican con un número. No se han codificado los valores no disponibles (N/A).

Adjuntamos un archivo pdf con el cuestionario (Cuestionario.pdf).

El conjunto de datos inicial tiene un total de 234 variables, muchas de ellas con muy 
pocos datos o que no son relevantes para el objetivo de nuestra visualización, por otra 
parte, las variables originales no dan respuesta por sí solas a todas las preguntas 
formuladas, tenemos por ello que construir nuevas variables a partir de las originales 
para dar respuesta a las pretensiones de la visualización.
Para ello hemos creado un script con el programa R[2] el cual lee el archivo original, 
calcula las nuevas variables necesarias y crea un archivo xlsx con el nuevo 
conjunto de datos.

[2] R (Nº de versión 4.1.0). (2020). Windows. The R Project for Statistical Computing. 
Disponible en : https://www.r-project.org/

Las transformaciones de las variables originales para la creación de las nuevas han sido 
las siguientes:
-	Hemos agrupado el grupo de variables de los ítems NODS (P14A1, …, P14A17) 
	en las variables:
	P14_PREOCUPACION_A, P14_TOLERANCIA_A, P14_SIN_ABST_A, 
	P14_PER_CONT_A, P14_ESCAPE_A, P14_REC_COMP_A, P14_MENTIR_A, 
	P14_ACTOS_ILE_A, P14_ARRUINAR_REL_A, P14_MANT_FIN_A.
-	Hemos calculado la variable perfil como suma de las respuestas positivas de las 
	variables anteriores y posteriormente la hemos agrupado en 4 intervalos en 
	función del nivel de problemática.
-	Hemos transformado el grupo de variables P1P1A, …, P2P2O que nos miden la 
	intensidad con que se juega a los juegos de azar en unas nuevas (P1A, …, P2O) 
	que nos indican si se ha jugado o no al juego.
-	A partir de estas últimas hemos creado tres nuevas variables que nos dicen el 
	número de juegos, tanto presenciales como online o ambas, en los que ha 
	participado una persona jugadora.
-	Por último, hemos creado otras tres variables a partir de las últimas, que nos 
	dicen si la persona jugadora lo ha hecho de forma presencia, online o ambas.

Después de crear las nuevas variables las guardamos en archivo formato xlsx, junto 
con las siguientes seleccionadas del conjunto original:
-	P0F1: Si ha jugado o no apostando dinero.
-	CCAA: Comunidad autónoma de residencia de la persona jugadora.
-	POB1: Edad de la persona jugadora.
-	DB5: Estado civil.
-	P0C: Sexo.
-	DB3: Nivel de ingresos.
-	POB: Habitat. Tamaño de la población de residencia de la persona jugadora.
-	DB1: Situación laboral 
	
Con todo ello hemos pasado de 234 a 55 variables.
 
 
