setwd("../")

library(millefy)

# 遺伝子モデルの読み込み（一度だけ実行; 少し時間がかかる）
path_gtf1 <- "test_data/gencode.vM9.annotation.gtf"
dt_gtf_exon1 <- gtfToDtExon(path_gtf1)


bam_files <- list.files("test_data/_01_filterBam", "*.bam$", recursive = T, full.names = T)
bam_files

labels <- gsub(".bam", "", basename(bam_files))
groups <- gsub("_.+", "", gsub("RamDA_", "", labels))
color_labels <- colorRampPalette(c("yellow", "red"))(length(unique(groups))+1)[1:length(unique(groups))]

# BAMのリード数から計算した Normalization factor (テストなどで適当な値を入れている; あとで変える)
nf = rep(1, length(bam_files))

# load("test00/nf.Rdata")
# load("test01/tes01.Rdata")

bwfiles = list.files("test_data/bw_test/", full.names = TRUE)[1:25]
bwfiles

# トラックの指定
scTrackBw <- list(path_bam_files = bwfiles, groups = groups, group_colors = color_labels, max_value = 7873, isBw=TRUE)
cvTrack1 <- list(path_bam_files = bam_files[21:24], normFactor = nf[21:24], groups = c("A", "B", "C", "D"), trackHeight = 2, log=TRUE)
geneTrack1 <- list(path_gtf = path_gtf1, dt_gtf = dt_gtf_exon1, label = basename(path_gtf1))
tdlist <- list(scTrackBw, cvTrack1, geneTrack1)
tt <- c("sc","add", "gene")
heights = c(12, 4, 2)

# 領域の指定
chr =  "chr19"
start = 5824708
end = 5845478
text_main = sprintf("%s, RamDA time series", "Neat1")

# 
l <- millefyPlot4(track_data=tdlist, track_type=tt, heights=heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main)

# re-plot
invisible(millefyPlot4(track_data=l$track_data, track_type=l$track_type, heights=l$heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main, sc_avg_scale = 7000, sc_sort_destiny = 'all'))
invisible(millefyPlot4(track_data=l$track_data, track_type=l$track_type, heights=l$heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main, sc_sort_destiny = 'all'))
invisible(
	millefyPlot4(track_data=l$track_data, track_type=l$track_type, heights=l$heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main, sc_avg_scale = 10, sc_sort_destiny = 'group')
)

invisible(
	millefyPlot4(track_data=l$track_data, track_type=l$track_type, heights=l$heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main, sc_avg_scale = 10, sc_sort_destiny = 'group')
)


invisible(
	millefyPlot4(
		track_data=l$track_data, track_type=l$track_type, heights=l$heights, 
		sc_type = "heatmap", 
		chr = chr, start = start, end = end, 
		sc_avg = TRUE, sc_avg_height = 1, 
		title = text_main, sc_avg_scale = 10, sc_sort_destiny = 'all'
	)
)


###############
n_k = 3

scTrackBw <- list(path_bam_files = bwfiles[1:n_k], groups = groups[1:n_k], group_colors = color_labels[1], max_value = 7873, isBw=TRUE)
cvTrack1 <- list(path_bam_files = bam_files[21:24], normFactor = nf[21:24], groups = c("A", "B", "C", "D"), trackHeight = 2, log=TRUE)
geneTrack1 <- list(path_gtf = path_gtf1, dt_gtf = dt_gtf_exon1, label = basename(path_gtf1))
tdlist <- list(scTrackBw, cvTrack1, geneTrack1)
tt <- c("sc","add", "gene")
heights = c(12, 4, 2)
l <- millefyPlot4(track_data=tdlist, track_type=tt, heights=heights, sc_type = "heatmap", chr = chr, start = start, end = end, sc_avg = TRUE, sc_avg_height = 1, title = text_main)

invisible(
	millefyPlot4(
		track_data=l$track_data, track_type=l$track_type, heights=l$heights, 
		sc_type = "heatmap", 
		chr = chr, start = start, end = end, 
		sc_avg = TRUE, sc_avg_height = 1, 
		title = text_main, sc_avg_scale = 500, sc_sort_destiny = 'all'
	)
)
