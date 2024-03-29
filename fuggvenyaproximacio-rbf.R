# A feladat a sin(x) f�ggv�ny k�zel�t�se a [-pi/2,*pi] intervallumon, kett� f�le m�dszerrel.
# A k�vetkez� p�r sor k�d a f�ggv�ny k�zel�t�s�t mutatja be svm haszn�lat�val.
# Megpr�b�lom helyesen k�zel�teni a f�ggv�nyt a megadott intervallumon.

library(RSNNS)

f<-function(x){ sin(x) }

#Intervallum megad�sa.
from = -pi / 2;
to = 2 * pi;

#Tan�t�pontok X koordin�t�ja, 50 hossz�s�g� vektor.
x<- seq(from=from,to=to,length=50)  
#Tan�t�pontok Y koordin�t�ja, egy kis hib�val terhelve.
y<- f(x)+rnorm(length(x),0,0.1)

#F�ggv�ny �br�zol�sa a megadott intervallumon
plot(f,from,to)
points(x,y,col="blue",pch=1)   

# 1. rbf halozat, 5 rejtett r�tegge�
rbfnet <- rbf(x,y, size=5,initFuncParams=c(0, 1, 0, 0.25, 0.04))   
lines(x,fitted(rbfnet),col="green",lwd=2,lty="dashed")     # 1. halozat kozelitese 


# 2. rbf halozat 3 rejtett r�teggel
rbfnet2 <- rbf(x,y, size=3,initFuncParams=c(0, 1, 0, 0.25, 0.04))     
lines(x,fitted(rbfnet2),col="red",lwd=2,lty="dotdash")     # 2. halozat kozelitese 

title(main="RBF")