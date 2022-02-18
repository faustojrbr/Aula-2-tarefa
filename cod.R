library("tidyverse")
library("basedosdados")
basedosdados::set_billing_id("aula-estat-2")
query <- "SELECT * FROM `basedosdados.br_inpe_prodes.desmatamento_municipio`" 
df = basedosdados::read_sql(query)

mu <- filter(df, id_municipio == 1100015)

is.integer64 <- function(x){
  class(x)=="integer64"
}

df_mut <- mu %>%
  mutate_if(is.integer64, as.integer)

new <- c(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,
         2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)
mu$ano <- new

ggplot(data = mu, aes(ano, floresta))+
  geom_line(col = "red") + 
  ggtitle("Floresta total em Km^2")
ggplot(data = mu) + 
  geom_bar(mapping = aes(x = ano, y = desmatado, fill = incremento), stat = "identity") +
  ggtitle("Desmatamento total acumulado em Km^2")
