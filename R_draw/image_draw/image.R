library(ImageMetrics)
library(waveslim)



im <- readPNG('test.png')
im <- im*255
n <- NROW(im)
sd <- 25
im.noise <- im + matrix(rnorm(n*n, sd=sd), n, n)

im.bayes1 <- denoise.bayes1(im.noise, wf='la20')

im.bayes2 <- denoise.bayes2(im.noise, wf='la20', rule="soft")

im.hard <- denoise.dwt.2d(im.noise, wf="la20")

im.soft <- denoise.dwt.2d(im.noise, wf="la20", rule="soft")

im.garrote <- denoise.garrote(im.noise, wf="la20",thresh=sqrt(3)*sd)

plot(imagematrix(im.noise/255))
plot(imagematrix(im.hard/255))
plot(imagematrix(im.soft/255))
plot(imagematrix(im.bayes1/255))
plot(imagematrix(im.bayes2/255))
plot(imagematrix(im.garrote/255))

var(c(abs(im.noise-im)))
var(c(abs(im.hard-im)))
var(c(abs(im.soft-im)))
var(c(abs(im.bayes1-im)))
var(c(abs(im.bayes2-im)))
var(c(abs(im.garrote-im)))

i <- matrix(rnorm(1024*1024, sd=7), 1024, 1024)
sum(var(abs(i)))
mad(i)