library(readxl)
library(openxlsx)

data <- read_excel("./Data.xlsx")

# Calculamos los ítems agrupados del NODS
data$P14_PREOCUPACION_A <- ifelse ((data$P14A1 == 1 | data$P14A2 == 1), 1 ,0)
data$P14_TOLERANCIA_A <- ifelse ((data$P14A3 == 1), 1 ,0)
data$P14_SIN_ABST_A <- ifelse ((data$P14A4 == 1 | data$P14A5 == 1), 1 ,0)
data$P14_PER_CONT_A <- ifelse ((data$P14A6 == 1 | data$P14A7 == 1), 1 ,0)
data$P14_ESCAPE_A <- ifelse ((data$P14A8 == 1 | data$P14A9 == 1), 1 ,0)
data$P14_REC_COMP_A <- ifelse ((data$P14A10 == 1), 1 ,0)
data$P14_MENTIR_A <- ifelse ((data$P14A11 == 1 | data$P14A12 == 1), 1 ,0)
data$P14_ACTOS_ILE_A <- ifelse ((data$P14A13 == 1), 1 ,0)
data$P14_ARRUINAR_REL_A <- ifelse ((data$P14A14 == 1 | data$P14A15 == 1 | data$P14A16 == 1),1 ,0)
data$P14_MANT_FIN_A <- ifelse ((data$P14A17 == 1), 1 ,0)


A <- c(241:250)
data$perfil = rowSums (data[ , A])

l <- length(data$perfil)

data$perfil[is.na(data$perfil)] <- ""

for (n in (1:l)){  
  if (data$perfil[n] == ""){
    data$perfil[n] <- ""
  } else if (data$perfil[n] == 0){
    data$perfil[n] <- 1 # "Sin riesgo"
  } else if (data$perfil[n] == 1 | data$perfil[n] == 2){
      data$perfil[n] <- 2 # "En riesgo"
  } else if (data$perfil[n] == 3 | data$perfil[n] == 4){
      data$perfil[n] <- 3 # "Con problemas"
  } else {
      data$perfil[n] <- 4 # "Con patología"
  }
}

# Creamos las variables dicótomicas para juego presencial
var_P1 <- c(13:27)
valores <- c(2:7)

for (i in var_P1){
  data[i][is.na(data[i])] <- 0
  data[i+239] <- 0
  for (n in (1:l)){  
    if (data[i][n,] == valores){
      data[i+239][n,] <- 1
    } else {
      data[i+239][n,] <- 0
    }
  }
}

nombres_P1 <- c('P1A'	, 'P1B'	, 'P1C'	, 'P1D'	, 'P1E'	, 'P1F'	, 'P1G'	, 'P1H'	, 'P1I'	, 'P1J'	, 'P1K'	, 'P1L'	, 'P1M'	, 'P1N'	, 'P1O')
var_P1_tot = var_P1 + 239

names (data)[var_P1_tot] = nombres_P1


# Creamos las columnas nuevas dicótomicas para juego online
var_P2 <- var_P1 + 15

for (i in var_P2){
  data[i][is.na(data[i])] <- 0
  data[i+239] <- 0
  for (n in (1:l)){  
    if (data[i][n,] == valores){
      data[i+239][n,] <- 1
    } else {
      data[i+239][n,] <- 0
    }
  }
}

nombres_P2 <- c('P2A'	, 'P2B'	, 'P2C'	, 'P2D'	, 'P2E'	, 'P2F'	, 'P2G'	, 'P2H'	, 'P2I'	, 'P2J'	, 'P2K'	, 'P2L'	, 'P2M'	, 'P2N'	, 'P2O')
var_P2_tot = var_P2 + 239

names (data)[var_P2_tot] = nombres_P2

# Calculamos el número de juegos de azar en los que ha participado presencial
data$P1 = rowSums (data[ , var_P1_tot])

# Calculamos el número de juegos de azar en los que ha participado online
data$P2 = rowSums (data[ , var_P2_tot])

# Calculamos el número de juegos de azar en los que ha participado presencial y online
data$P1_P2 = rowSums (data[ , c(282,283)])

for (i in c(282:284)){
  data[i+3] <- 0
  for (n in (1:l)){  
    if (data[i][n,] == 0){
      data[i+3][n,] <- 0
    } else {
      data[i+3][n,] <- 1
    }
  }
}

names (data)[285:287] = c('presencial', 'online', 'mixto')

# Creamos un nuevo dataframe con las variables a utilizar en el análisis
atributos <- c(3,4,5,7,8,228,230,232, c(241:287))
df <- data[atributos]
# Guardamos el archivo en una hoja excel
write.xlsx(df, file = "Prevalencia.xlsx", sheetName = "Prevalencia")

