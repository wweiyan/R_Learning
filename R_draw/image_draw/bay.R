bay <- function (x, wf = "la8", J = 4) 
{
    n <- length(x)
    x.dwt <- dwt.2d(x, wf, J)
    sigma.mad <- list(HH1 = mad(abs(x.dwt$HH1)), HL1 = mad(abs(x.dwt$HL1)), LH1 = mad(abs(x.dwt$LH1)),
	HH2 = mad(abs(x.dwt$HH2)), HL2 = mad(abs(x.dwt$HL2)), LH2 = mad(abs(x.dwt$LH2)),
	HH3 = mad(abs(x.dwt$HH3)), HL3 = mad(abs(x.dwt$HL3)), LH3 = mad(abs(x.dwt$LH3)),
	HH4 = mad(abs(x.dwt$HH4)), HL4 = mad(abs(x.dwt$HL4)), LH4 = mad(abs(x.dwt$LH4)))
	
    sigma.var <- list(HH1 = var(c(x.dwt$HH1)), HL1 = var(c(x.dwt$HL1)), LH1 = var(c(x.dwt$LH1)),
	HH2 = var(c(x.dwt$HH2)), HL2 = var(c(x.dwt$HL2)), LH2 = var(c(x.dwt$LH2)),
	HH3 = var(c(x.dwt$HH3)), HL3 = var(c(x.dwt$HL3)), LH3 = var(c(x.dwt$LH3)),
	HH4 = var(c(x.dwt$HH4)), HL4 = var(c(x.dwt$HL4)), LH4 = var(c(x.dwt$LH4)))
    
    for (j in 1:J) {
        jj <- paste("HL", j, sep = "")
        x.dwt[[jj]] <- (sigma.var[[jj]] - (sigma.mad[[jj]]/0.6745)^2)/sigma.var[[jj]]*x.dwt[[jj]]
            
        jj <- paste("LH", j, sep = "")
        x.dwt[[jj]] <- (sigma.var[[jj]] - (sigma.mad[[jj]]/0.6745)^2)/sigma.var[[jj]]*x.dwt[[jj]]

        jj <- paste("HH", j, sep = "")
        x.dwt[[jj]] <- (sigma.var[[jj]] - (sigma.mad[[jj]]/0.6745)^2)/sigma.var[[jj]]*x.dwt[[jj]]
    }
    idwt.2d(x.dwt)
}