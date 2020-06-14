library(rio)
linkEst="https://github.com/guido-laguna/TrabajoEstad2/raw/master/DataEst2.sav"
DataEst2=import(linkEst)
View(DataEst2)
## Eliminar Variables no necesarias: únicamente dejé las variables que podían describir mejor a la persona encuestada y la varibale en estudio
DataEst2$idnum=NULL
DataEst2$estratopri=NULL
DataEst2$estratosec=NULL
DataEst2$upm=NULL
DataEst2$cluster=NULL
DataEst2$tamano=NULL
DataEst2$fecha=NULL
DataEst2$wt=NULL
DataEst2$q2y=NULL
DataEst2$ls3=NULL
DataEst2$a4=NULL
DataEst2$idio2=NULL
DataEst2$soct2=NULL
DataEst2$np1=NULL
DataEst2$np2=NULL
DataEst2$sgl1=NULL
DataEst2$sgl2=NULL
DataEst2$muni5=NULL
DataEst2$muni6=NULL
DataEst2$muni11=NULL
DataEst2$cp4a=NULL
DataEst2$cp5=NULL
DataEst2$cp6=NULL
DataEst2$cp7=NULL
DataEst2[,c(11:184)]=NULL
#Cambiar nombre a las variables para que sea más fácil trabajar con ellas
names(DataEst2)[names(DataEst2)=="prov"]="departamento"
names(DataEst2)[names(DataEst2)=="uniq_id"]="identificador"
names(DataEst2)[names(DataEst2)=="perprov"]="provincia"
names(DataEst2)[names(DataEst2)=="idiomaq"]="idioma"
names(DataEst2)[names(DataEst2)=="q1"]="sexo"
names(DataEst2)[names(DataEst2)=="q2"]="edad"
names(DataEst2)[names(DataEst2)=="cp8"]="asistencia"
#Reemplazar valores
DataEst2$pais <- gsub("11","Perú",DataEst2$pais)
DataEst2$ur <- gsub("1","Urbano",DataEst2$ur)
DataEst2$ur <- gsub("2","Rural",DataEst2$ur)
DataEst2$idioma <- gsub("1","Español",DataEst2$idioma)
DataEst2$sexo <- gsub("1","Hombre",DataEst2$sexo)
DataEst2$sexo <- gsub("2","Mujer",DataEst2$sexo)
DataEst2$asistencia <- gsub("1","Una vez a la semana",DataEst2$asistencia)
DataEst2$asistencia <- gsub("2","Una o dos veces al mes",DataEst2$asistencia)
DataEst2$asistencia <- gsub("3","Una o dos veces al año",DataEst2$asistencia)
DataEst2$asistencia <- gsub("4","Nunca",DataEst2$asistencia)
#Verificamos la estructura
str(DataEst2)
#Eliminamos espacios vacíos solamente en la columna de la variable a estudiar
DataEst2 <- DataEst2[!is.na(DataEst2$asistencia),]
