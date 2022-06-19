#Assuming we have our SAM, BAM ready
#check the read length from fastqc of trimmed files.
bash ../JUM_2.0.2/JUM_A.sh --Folder ../JUM_2.0.2 --JuncThreshold 3 --Condition1_fileNum_threshold 2 --Condition2_fileNum_threshold 2 --IRthreshold 3 --Readlength 140 --Thread 2 --Condition1SampleName col0_1,col0_2,col0_3 --Condition2SampleName tcp23410_1,tcp23410_2,tcp23410_3

echo "DONE"

cd JUM_diff

Rscript /user/home/JUM_2.0.2/R_script_JUM.R experiment_design.txt > outputFile.Rout 2> errorFile.Rout

bash ../JUM_2.0.2/JUM_B.sh --Folder ../JUM_2.0.2 --Test pvalue --Cutoff 0.05 --TotalFileNum 6 --Condition1_fileNum_threshold 2 --Condition2_fileNum_threshold 2 --Condition1SampleName col0_1,col0_2,col0_3 --Condition2SampleName tcp23410_1,tcp23410_2,tcp23410_3

#it will create a new folder

#now taking qvalue into account:

bash ../JUM_2.0.2/JUM_B.sh --Folder ../JUM_2.0.2 --Test adjusted_pvalue --Cutoff 0.05 --TotalFileNum 6 --Condition1_fileNum_threshold 2 --Condition2_fileNum_threshold 2 --Condition1SampleName col0_1,col0_2,col0_3 --Condition2SampleName tcp23410_1,tcp23410_2,tcp23410_3


cd FINAL_JUM_OUTPUT_pvalue_0.05


bash ../JUM_2.0.2/JUM_C.sh --Folder ../JUM_2.0.2 --Test pvalue --Cutoff 0.05 --TotalCondition1FileNum 3 --TotalCondition2FileNum 3 --REF TAIR10.1_genePred_bygff.txt

cd ..

cd FINAL_JUM_OUTPUT_adjusted_pvalue_0.05

bash ../JUM_2.0.2/JUM_C.sh --Folder ../JUM_2.0.2 --Test adjusted_pvalue --Cutoff 0.05 --TotalCondition1FileNum 3 --TotalCondition2FileNum 3 --REF TAIR10.1_genePred_bygff.txt


