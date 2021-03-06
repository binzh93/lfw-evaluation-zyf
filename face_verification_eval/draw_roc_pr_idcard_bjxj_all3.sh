#!/bin/sh

featfile=$1
savedir=feat

if [ $# -gt 1 ]; then
	save_dir=$2
fi

nohup python ./draw_pr_curve_zyf.py ${featfile}.mat \
	--same_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_same_with_id.txt \
	--diff_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_diff_with_id.txt \
	--save_dir verif_rlt_idcard_bjxj-${save_dir}-noflip \
	--distance cosine > nohup-log-idcard-bjxj-noflip.txt &

nohup python ./draw_pr_curve_zyf.py ${featfile}_mirror_eltmax.mat \
	--same_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_same_with_id.txt \
	--diff_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_diff_with_id.txt \
	--save_dir verif_rlt_idcard_bjxj-${save_dir}-eltmax \
	--distance cosine > nohup-log-idcard-bjxj-eltmax.txt &

nohup python ./draw_pr_curve_zyf.py ${featfile}_mirror_eltmax.mat \
	--same_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_same_with_id.txt \
	--diff_pairs_file /disk2/data/FACE/face-idcard-zxt/test_pairs_diff_with_id.txt \
	--save_dir verif_rlt_idcard_bjxj-${save_dir}-eltavg \
	--distance cosine > nohup-log-idcard-bjxj-eltavg.txt &
