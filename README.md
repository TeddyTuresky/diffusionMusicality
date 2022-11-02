# diffusionMusicality

This repository houses code (or links to code) used for the following study:

##### *Jennifer Zuk, Jolijn Vanderauwera, Ted K. Turesky, Xi Yu, Nadine Gaab (2022) Neurobiological predispositions for musicality: White matter in infancy predicts school-age music aptitude* 

The following scripts were used to process the raw data and run statistical analyses:

    .
    ├── dtiConvPrepHLE.sh                               <-- conversion from dicom to nrrd using Slicer4 and DTI Prep (https://www.nitrc.org/projects/dtiprep/)
    ├── dtiGradientSelectGood.m                         <-- removes artifactual gradients identified by DTI Prep. New 4D diffusion volumes generated with dcm2niix
    ├── topEddy.sh                                      <-- topup and eddy from FSL (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/eddy/UsersGuide)  
    ├── vista_preprocessing.m                           <-- tensorfitting (https://vistalab.stanford.edu/)
    ├── DTI_AFQrun_mrdiff_SPM.m                         <-- fiber tracking (https://github.com/yeatmanlab/AFQ)
    ├── wholeBrainTractographyAllTractsSep.m            <-- quality checks tract reconstructions. adapted from http://yeatmanlab.github.io/AFQ/tutorials/AFQ_example
    ├── dti_corr_perm_100nodes_reg.m                    <-- parametric bootstrapping (code fragments taken from https://github.com/yeatmanlab/AFQ 
    ├── AFQ_MultiCompCorrection.m                       <-- multiple comparison corrections from https://github.com/yeatmanlab/AFQ   
    
    
Visualizations:

    .
    ├── vis_ind_tracts.m                                <-- generates tracts
    ├── afq_vis_lslf.m                               <-- generates tracts with significant nodes
