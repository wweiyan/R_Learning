library(devtools)
install_github('badbye/baidumap')
install_github('lchiffon/REmap')

library(baidumap)
options(baidumap.key = '574ab07ad21d8f09a9835fb29bc9c61b')
library(ggmap)
library(REmap)
q <- getBaiduMap('北京大学', width=600, height=600, zoom=18, scale = 2, messaging=FALSE)
ggmap(q)
getCoordinate(c('华南理工大学', '清华大学', '人民大学'), formatted = T)
getCoordinate('北京大学',output='json') #json格式

getLocation(c(118.12845, 24.57232),formatted = T)

bjMap = getBaiduMap('汕尾海丰',color = 'bw')
df = getRoute('全球通大厦', '红场')
ggmap(bjMap) + geom_path(data = df, aes(lon, lat), alpha = 0.5, col = 'red')
