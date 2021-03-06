Gap <- c(354, 250, 234, 312)
Eul <- c(234, 450, 200, 250)

sales.k <- matrix(c(Gap, Eul), ncol=4, byrow=T, dimnames=list(c("Gap", "Eul"), c("Jan", "Feb","Mar", "Apr")))
sales.k


rowsum <- apply(sales.k, 1, sum)
rowsum
colsum <- apply(sales.k, 2, sum)
colsum

#monthly gross
barplot(sales.k, main="Total Sales", xlab="Month", ylab="Sales", names.arg=c("Jan", "Feb","Mar", "Apr"),
        border="blue", col=rainbow(2), ylim=(c(0, 1000)))

#점포별 비교
barplot(sales.k, main="Total Sales by Month", xlab="Month", ylab="Sales", beside=T, names.arg=c("Jan", "Feb","Mar", "Apr"), 
        border="blue", col=rainbow(2), ylim=(c(0, 500)))


#점포별 월 매출액 비교 
sales.k

barplot(t(sales.k), main="Total Sales by Sales", xlab="Store", ylab="Sales", beside=T, names.arg=c("Gap", "Eul"),
        border="blue", col=rainbow(4), ylim=(c(0, 400)))
legend(8.5, 400, c("Jan", "Feb", "Mar", "Apr"), cex=0.8, fill=rainbow(4))


library(ggplot2)
Month <-c("Jan", "Feb", "Mar", "Apr")
Gap<- c(354, 250, 234, 312)
Eul <- c(234, 450, 200, 250)
sales.df <- data.frame(Month, Gap, Eul)
sales.df


Month <- rep(c("Jan", "Feb", "Mar", "Apr"), each=2, len=8)
Store <- rep(c("Gap", "Eul"), times=4)
Sales <- c(354, 234, 250, 450, 234, 200, 312, 250)
sales.df2 <- data.frame(Month, Store, Sales)
sales.df2


d<- ggplot(sales.df2, aes(x=Month, y=Sales, fill=Store)) + geom_col()
d+scale_x_discrete(limits=c("Jan", "Feb", "Mar", "Apr"))


Pct <- round((Sales/600)*100, 1)
sales.df2 <- data.frame(sales.df2, Pct)
d <- ggplot(sales.df2, aes(x=Month, y=Pct, fill=Store))+ geom_col()
d+scale_x_discrete(limits=c("Jan", "Feb", "Mar", "Apr"))


ggplot(data=sales.df2, aes(x=reorder(Month, -Sales), y=Sales, fill=Store))+ geom_col()

ggplot(data=sales.df2, aes(x=reorder(Month, -Sales), y=Sales, fill=Store)) + geom_col() + coord_flip()


buy <- c("yes", "no", "no", "yes", "yes","no", "yes" )
gender <- c("male", "female", "male", "female", "female", "female", "female")
buy.gender <- data.frame(buy, gender)
ggplot(data=buy.gender) + geom_bar(aes(x=gender, fill=buy ))


ggplot(data=buy.gender) + geom_bar(aes(x=gender, fill=buy), position="dodge")


ggplot(data=buy.gender) + geom_bar(aes(x=gender, fill=buy), position="fill")



ggplot(data=buy.gender) + geom_bar(aes(x=gender, fill=buy))+ facet_wrap(~buy)
