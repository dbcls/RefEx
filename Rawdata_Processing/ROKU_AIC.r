AIC_0.25 <- function(x){
 # xの要素が全てNAやNaNの場合にエラーが出ていたので、そのような場合には外れ値なし、とする(2007/10/4追加)
 if(length(x) == sum(is.na(x))){
   x <- c(rep(0, length(x)))
 }else if(length(x) == sum(is.nan(x))){
    x <- c(rep(0, length(x)))
 }else{}
 x_org <- x             #20090731追加
 x <- x[(!is.na(x))]    #NA以外の要素をベクトルxに格納(20090731追加)
 x <- x[(!is.nan(x))]   #NaN以外の要素をベクトルxに格納(20090731追加)

 #データ数
 n_plus_s <- length(x)  #ベクトルxの要素数をx_lengthに格納
 #昇べきの順にソート
 x.sort <- sort(x)
 #ソートのcol番号
 x.order <- order(x)

 #絶対値が大きいほうから25%だけ取り出す
 limit <- 0.25*n_plus_s
 #25%の居場所
 target <- rev(order(abs(x)))[1:limit]

 #外れ値数
 s <- 1:limit
 #非外れ値数
 n <- n_plus_s - s
 #非外れ値の標本標準偏差
 set_sd <- c()
 for(i in 1:limit){set_sd[i] <- sd(x[setdiff(1:n_plus_s,target[1:i])])*sqrt((n[i]-1)/n[i])}
 #U-value
 Ut <- n*log(set_sd) + sqrt(2)*s*(0.5*log(2*pi) + (0.5+n)*log(n)-n)/n
 #最終決定の外れ値数
 #初期値（外れ値無しと考えたとき）
 maice_Ut <- n_plus_s*log(sd(x)*sqrt((n_plus_s-1)/n_plus_s))
 maice_i <- 0
 maice_j <- 0
 #外れ値があるほうが、U値が小さくなる場合
 if(maice_Ut > min(Ut)){
 maice_Ut <- which(Ut==min(Ut))
 #そのうちのマイナス側が何個あったか
 maice_i <- length(which(x[target[1:maice_Ut]]<0))
 #そのうちのプラス側が何個あったか
 maice_j <- length(which(x[target[1:maice_Ut]]>0))
 }
 #フラグ
 flag <- c(rep(0, length=n_plus_s))
 if(sd(x) != 0){ #xの要素が全て0の場合(2007/10/1追加)
 if(maice_i > 0){ flag[x.order[1:(maice_i)]] <- -1 }
 if(maice_j > 0){ flag[x.order[n_plus_s - maice_j + 1 :n_plus_s]] <- 1 }
 tmp <- replace(x_org, ((!is.nan(x_org)) & (!is.na(x_org))), flag)  #20090731追加
 return(tmp)
 }else{
 tmp <- replace(x_org, ((!is.nan(x_org)) & (!is.na(x_org))), flag)  #20090731追加
 return(tmp)
 }
}

