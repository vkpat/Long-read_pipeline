#!/bin/bash

##Input BAM paths from the Nate's directory

##GRCh38_GIABv3 BAMS
##/lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam
##CHM13 BAMS
##//lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam
## GRCH37 BAMS
##/lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam

## Run the QC on the the GRCh38-GIABv3 BAMS ( samtools stats, Cramino and Nanoplot tools)

echo "Running the samtools stats on the BAM"

##samtools stats /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam > HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.samtools_stats.txt

echo " Running the Cramino tool"

cramino -t 22 --reference /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/resources/GRCh38_GIABv3_no_alt_analysis_set_maskedGRC_decoys_MAP2K3_KMT2C_KCNJ18.fasta.gz --hist --checksum --arrow HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow --karyotype --phased /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam >> HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.txt

echo "Running the Nanoplot on the BAM"

NanoPlot -t 8 --verbose --store -o HG008-T_GRCh38_GIABv3 --tsv_stats --info_in_report --loglength -f png --title "HG008-T_GRCh38-GIABv3" --arrow HG008-T_GRCh38_GIABv3_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow

# Run the QC on the the GRCh37 BAMS ( samtools stats, Cramino and Nanoplot tools)

echo "Running the samtools stats on the BAM"

## samtools stats /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam > HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.samtools.stats.txt

echo " Running the Cramino tool"

cramino -t 22 --reference /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/resources/hs37d5.fa.gz --hist --checksum --arrow HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow --karyotype --phased /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam >> HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.txt


echo "Running the Nanoplot on the BAM"

NanoPlot -t 8 --verbose --store -o HG008-T_GRCh37 --tsv_stats --info_in_report --loglength -f png --title "HG008-T_GRCh37" --arrow HG008-T_GRCh37_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow


# Run the QC on the the CHM13 BAMS ( samtools stats, Cramino and Nanoplot tools)

echo "Running the samtools stats on the BAM"

##samtools stats /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam > HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.samtools_stats.txt

echo " Running the Cramino tool"

cramino -t 22 --reference /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/resources/chm13v2.0_maskedY_rCRS.fa.gz --hist --checksum --arrow HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow --karyotype --phased /lab/mml/resdatahs/Projects/644-BBD-human-genomics/bbd-human-genomics/projects/incoming-TN/UCSC_ONT_20231003/HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.bam  >> HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.txt

echo "Running the Nanoplot on the BAM"

NanoPlot -t 8 --verbose --store -o HG008-T_CHM13v2.0 --tsv_stats --info_in_report --loglength -f png --title "HG008-T_CHM13v2.0" --arrow HG008-T_chm13v2.0_maskedY_rCRS_ONT-R10.4.1-doradov0.3.4-5mCG-5hmC_UCSC_20230905.cramino.arrow