#!/bin/sh
THREADS=25
MEM=16
REF1="/lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/pipelines/resources/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta.gz"
REF2="/lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/pipelines/resources/hs37d5.fa.gz"
REF3="/lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/pipelines/resources/chm13v2.0_maskedY_rCRS.fa.gz"
UBAM="HG008-T_UCSC_20230905_ONT-std-R10.4.1_1_dorado_v0.3.4_sup4.2.0_5mCG-5hmC.bam"
OUTBAM1="HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam"
OUTBAM2="HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam"
OUTBAM3="HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam"
#Read Group information obtained from uBam header 
RG="@RG\tID:dd64fc98af6a1024ce05919e9e34a7e11743e255_dna_r10.4.1_e8.2_400bps_sup@v4.2.0\tPU:PAQ90415\tPL:nanopore\tPM:PC48B200\tLB:09_05_23_R1041_CancerProject_MGH3066_1\tDT:2023-09-05T19:56:15.900+00:00\tPG:dorado-0.3.4+5f5cd02-dna_r10.4.1_e8.2_400bps_sup@v4.2.0\tSM:HG008-T"


echo "## Software version information"
echo "minimap2"
minimap2 --version
echo "samtools"
samtools --version


echo "## Starting alignment"

samtools fastq \
    -TMM,ML ${UBAM} \
    | minimap2 -t ${THREADS} \
        -y -x map-ont --MD --eqx --cs -aL -z 600,200\
        -R ${RG} ${REF1} - \
    | samtools sort -m ${MEM}G -@${THREADS} \
        -O bam --reference ${REF1} > ${OUTBAM1}
samtools index ${OUTBAM1}

samtools fastq \
    -TMM,ML ${UBAM} \
    | minimap2 -t ${THREADS} \
        -y -x map-ont --MD --eqx --cs -aL -z 600,200\
        -R ${RG} ${REF2} - \
    | samtools sort -m ${MEM}G -@${THREADS} \
        -O bam --reference ${REF2} > ${OUTBAM2}
samtools index ${OUTBAM2}


samtools fastq \
    -TMM,ML ${UBAM} \
    | minimap2 -t ${THREADS} \
        -y -x map-ont --MD --eqx --cs -aL -z 600,200\
        -R ${RG} ${REF3} - \
    | samtools sort -m ${MEM}G -@${THREADS} \
        -O bam --reference ${REF3} > ${OUTBAM3}
samtools index ${OUTBAM3}
