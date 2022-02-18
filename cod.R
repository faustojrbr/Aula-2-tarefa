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
mu$new <- new

ggplot(data = mu) + geom_point(mapping = aes(x = new, y = desmatado))
