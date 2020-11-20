README file - Label-free imaging for quality control of cardiomyocyte differentiation


Data Availability Statements

    All Excel files used to generate and support the results from the associated code have been deposited in the skalalab/cardiomyocyte_differentation github repository

Dataset list

Data file 						       Source 				 Provided
    classification_results_umap_AllData.csv 		       Collected/compiled by T.Q.        Yes
    classification_results_umap_together_Day1Efficiency.csv    Collected/compiled by T.Q.	 Yes
    Differentiation_ZscoreData.csv			       Collected/compiled by T.Q.        Yes
    Differentiation_ZscoreData_day1.csv			       Collected/compiled by T.Q.        Yes
    Differentiation_ZscoreData_day0.csv			       Collected/compiled by T.Q.        Yes													

System requirements

Software Requirements and Installation instructions/time
    Python 3.7.3
    Jupyter Notebook 5.7.8
        numpy (1.16.2)
        pandas (0.24.2)
        umap (0.3.10)
        sklearn (0.20.3)
        matplotlib (3.0.3)
        the files “Differentiation Classification_Compiled_Clean.ipynb” and “UMAP_Mapping_Complied_Clean.ipynb” lists these dependencies and will install at the initial run of all source code
    R 3.6.2
    RStudio 1.1.463	
 	ggplot2(3.2.1)
	ggdendro(0.1-20)
	reshape2(1.4.3)
	gplots(3.0.3)
	RColorBrewer(1.1-2)
	scales(1.1.0)
	spatstat(1.63-3)library(ggplot2)
	Hmisc(4.3.1)
	psych(1.9.12.31)
	dplyr(0.8.4)
	plyr(1.8.5)
	rlist(0.4.6.1)
	corrplot(0.84)
	tables(0.8.8)
	ggrepel(0.8.1)
	gridExtra(2.3)
	randomcoloR(1.1.0.1)
	inlmisc(0.4.9)
        the files “Differentiation_UMAP_plotting.R” and “Differentiation Z score heatmaps.R” will install all dependencies needed per source code, and should be run once prior to running other programs.

	Approximate installation time for all software is 30 minutes. Approximate installation time for dependencies is 1-2 minutes.

Demo (Run instructions & expected output)

    “Differentiation Classification_Compiled_Clean.ipynb” cell 1 will initialize dependencies, read in required data files, and generate optimized parameters for each classification model used (Logistic regression, support vector machine, & random forest). Cell 2 will standardize and randomly partition each data set for training each model using the optimized parameters determined from running code in cell 1; trained models will subsequently be evaluated with partitioned test set. Cells 2, 3,& 4 will generate ROC curves and feature weight graphs for each model (formatted versions of expected outputs shown in Figures 3 & S5).
    “UMAP_Mapping_Compiled_Clean.ipynb” will initialize dependencies, read in required data files, and generate UMAP coordinates for all data according to model project using listed parameters (Expected outputs - "UMAPCoordinates_DifferentiationProject_Day1Efficiency.csv" & "UMAPCoordinates_DifferentiationProject_Day1Efficiency"; included in repository in UMAP Data folder. 
    “Differentiation_UMAP_plotting.R” will initialize dependencies, read in required data files, and generate UMAP plots based on coordinates from above code. Resulting plots visualize UMAP clustering of specified subsets of data (formatted versions of expected outputs shown in Figures 2, 3, & S3).
    “Differentiation Z score heatmaps.R” will initialize dependencies, read in required data files, and generate heatmaps and dendogram clustering of z-scores for each differentiation efficiency condition at Days 0 and 1 (formatted versions of expected outputs shown in Figures 2 & S4).   
 
Memory and Runtime Requirements

    All code was last run on a 4-core Intel-based laptop with Windows 10 Home, 12 GB of RAM, 189 GB of local storage. 
    Python code for model optimization (“Differentiation Classification_Compiled_Clean.ipynb" - cell 1) took approximately 4 hours.
    Python code for model training (“Differentiation Classification_Compiled_Clean.ipynb" - cell 2) took approximately 4 hours.
    Python code for UMAP coordinate generation (“UMAP_Mapping_Compiled_Clean.ipynb”) and all R code (“Differentiation_UMAP_plotting.R” & “Differentiation Z score heatmaps.R”) took approximately 10 minutes.

Instructions for use + Reproduction Instructions
   
    Download "classification_results_umap_together_Day1Efficiency.csv" referenced above to the desired file location. Edit "full_data" variable in cells 1 and 2 of “Differentiation Classification_Compiled_Clean.ipynb” to adjust the default path to correspond with file location. Subsequently run each source code cell to run all processing steps in sequence and generate ROC curves and feature weight graphs for Figures 3 & S5. No other adjustments to the code should be needed.  
    Download "classification_results_umap_together_Day1Efficiency.csv" & "classification_results_umap_AllData.csv" referenced above to the desired file location. Edit "full_data" variables in “UMAP_Mapping_Compiled_Clean.ipynb” to adjust the default path to correspond with file location. "classification_results_umap_together_AllData.csv" should be run for Days 0-5 UMAPs (Figure 2). "classification_results_umap_together_Day1Efficiency.csv" should be run for Day 1 low vs high effiency UMAP (Figure 3). Comment out any corresponding "full data" & "df.to_csv" lines not specific to the dataset of interest. Run source code to perform all processing steps in sequence and save CSV file with UMAP coordinates. No other adjustments to the code should be needed.  
    Set R/RStudio directory to path location of the two CSV files above to run “Differentiation_UMAP_plotting.R”. Run all source code to perform all processing steps in sequence and generate UMAPs for Figures 2, 3, & S3 and save .eps files for each UMAP plot. No other adjustments to the code should be needed.  
    Download "Differentiation_ZscoreData.csv", "Differentiation_ZscoreData_day1.csv", & "Differentiation_ZscoreData_day0.csv" referenced above to the desired file location.  Set R/RStudio directory to path location of these three CSV files above to run “Differentiation Z score heatmaps.R”. Run source code to perform all processing steps in sequence and generate UMAPs for Figures 2 & S4. No other adjustments to the code should be needed. 

    All code run according to the instructions provided above should accurately reproduce the results reported in the accompanying study. Source code also includes detailed comments for functionality of individual lines/sections.

