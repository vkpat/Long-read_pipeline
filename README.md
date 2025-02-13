## This scripts are used for Mapping and QC of the Long-read data inlcuding ONT.

Notes: We used Pacbio germline and somatic pipeline for the Pacbio-revio data from Pacbio and BCM, it only be run on Nisaba due to the requirements. This repo doesn't include information on running the Pacbio germline and somatic pipelines.

## Preprocessing tool

PycoQC tool can be used on summary.txt file if provided by Northeastern or UCSC ONT data. We can only ran this if summary.txt file are provided with uBAM raw data.

Command used for pycoQC:

pycoQC -f 09_05_23_R1041_CancerProject_MGH3066_1_dorado_v0.3.4_sup4.2.0_summary.txt -o 09_05_23_R1041_CancerProject_MGH3066_1_dorado_v0.3.4_sup4.2.0.htm

## Mapping tools and command used in the script:

Minimap2 [2.26-r1175] was used to map uBAM to the three references. The command used for this mapping was received from UCSC lab.

samtools fastq \
    -TMM,ML ${UBAM} \
    | minimap2 -t ${THREADS} \
        -y -x map-ont --MD --eqx --cs -aL -z 600,200\
        -R ${RG} ${REF1} - \
    | samtools sort -m ${MEM}G -@${THREADS} \
        -O bam --reference ${REF1} > ${OUTBAM1}
samtools index ${OUTBAM1}


## QC tools used to generate the QC metrics on the BAM:

1) Samtools [samtools 1.21]
2) Cramino [cramino 0.15.0]
3) mosdepth wrapper [v3.3.3/bio/mosdepth]
4) Nanoplot [v1.42.0]
