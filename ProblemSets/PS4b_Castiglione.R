library('dplyr')

df1<-as.data.frame(iris)
createdataframe(df<-iris)
type(df1)
type(df)
view(df)

#First 6 rows
head(select(df,df$Sepal_length, df$species))
head(select(df1,df1$Sepal.Length,df1$Species))

#filter first 6 rows
head(filter(df,df$sepal_length>5.5))
head(filter(df1,df1$sepal_length>5.5))

#combined
head(select(df, df$species, filter(df$sepal_length >5.5)))
head(select(df1,df1$Species, filter(df1$Sepal.Length>5.5)
            
 #RDD operations
 head(summarize(groupBy(df, df$Species), mean=mean(df$Sepal_Length), count=n(df$Sepal_Length)))
 head(summarize(groupBy(df1, df1$Species), mean=mean(d1f$Sepal_Length), count=n(df$Sepal_Length)))
            