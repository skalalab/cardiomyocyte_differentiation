<!-- # cardiomyocyte_differentiation
Label-free imaging for quality control of cardiomyocyte differentiation
 -->

# README file
# Label-free imaging for quality control of cardiomyocyte differentiation
---

## Data Availability Statements

All Excel files used to generate and support the results from the associated code have been deposited in the following repository: <https://github.com/skalalab/cardiomyocyte_differentiation>

## Dataset list

Data file | Source | Provided
------- | ------- | -------
classification_results_umap_AllData.csv | Collected/compiled by T.Q. | Yes
classification_results_umap_together_Day1Efficiency.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData_day1.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData_day0.csv | Collected/compiled by T.Q. | Yes

---

## 1) System requirements

### Software 
#### Python 
* Python 3.7.3
* Jupyter Notebook 5.7.8
    * numpy (1.16.2)
    * pandas (0.24.2)
    * umap (0.3.10)
    * sklearn (0.20.3)
    * matplotlib (3.0.3)
    * pathlib (1.0.1)

#### R
* R 3.6.2
* RStudio 1.1.463	
* ggplot2(3.2.1)
* ggdendro(0.1-20)
* reshape2(1.4.3)
* gplots(3.0.3)
* RColorBrewer(1.1-2)
* scales(1.1.0)
* spatstat(1.63-3)library(ggplot2)
* Hmisc(4.3.1)
* psych(1.9.12.31)
* dplyr(0.8.4)
* plyr(1.8.5)
* rlist(0.4.6.1)
* corrplot(0.84)
* tables(0.8.8)
* ggrepel(0.8.1)
* gridExtra(2.3)
* randomcoloR(1.1.0.1)
* inlmisc(0.4.9)

#### Hardware
All code was last run on a laptop with a 4-core Intel-based processor (6th gen Intel i7-6500U) with Windows 10 Home, 12 GB of RAM, and >1GB of storage  

No non-standard hardware required

--- 
## 2)  Installation Guide

#### Python 
The files _Differentiation Classification_Compiled_Clean.ipynb_ and _UMAP_Mapping_Compiled_Clean.ipynb_ lists will install the previously listed python dependencies on first run of the source code

#### R 

The files _Differentiation_UMAP_plotting.R_ and _Differentiation Z score heatmaps.R_ will install the previously listed dependencies on first run of the source code, and should be run once prior to running other programs

* Approximate installation time for all software is 30 minutes
* Approximate installation time for dependencies is 1-2 minutes

---
### 3) Demo (Run instructions & expected output)

* **Differentiation Classification_Compiled_Clean.ipynb**
  * _Instructions:_ 
    * Cell 1 will initialize dependencies, read in required data files, and generate optimized parameters for each classification model used (Logistic regression, support vector machine, & random forest). 
  * _Expected outputs:_ 
    * Cell 2 will standardize and randomly partition each data set for training each model using the optimized parameters determined from running code in cell 1; trained models will subsequently be evaluated with the partitioned test set
    * Cells 2, 3, & 4 will generate ROC curves and feature weight graphs for each model (formatted versions of expected outputs shown in Figures 3 & S5).
  * _Expected runtime:_
    * Cell 1) for model optimization took approximately 4 hours
    * Cell 2) for model training took approximately 4 hours

  &nbsp;

* **UMAP_Mapping_Compiled_Clean.ipynb**
  * _Instructions:_ 
    * Run the code which will initialize dependencies, read in required data files, and generate UMAP coordinates for all data according to projection mapped using listed parameters
  * _Expected outputs:_ 
    * The code will generate the following files also included in repository in the UMAP Data folder: _UMAPCoordinates_DifferentiationProject_Day1Efficiency.csv_ & _UMAPCoordinates_DifferentiationProject_Day1Efficiency_
  * _Expected runtime:_
    * Approximately 10 minutes
    
  &nbsp;

* **Differentiation_UMAP_plotting.R** 
  * _Instructions:_ 
    * Run the code which will initialize dependencies, read in required data files, and generate UMAP plots based on coordinates from above code. 
  * _Expected outputs:_ 
    * Resulting plots visualize UMAP clustering of specified subsets of data (formatted versions of expected outputs shown in Figures 2, 3, & S3).
  * _Expected runtime:_
    * Approximately 10 minutes

  &nbsp;
  
* **Differentiation Z score heatmaps.R** 
  * _Instructions:_ 
    * Run the code which will initialize dependencies, read in required data files, and generate heatmap plots.
  * _Expected outputs:_
    * Resulting plot depict heatmaps and dendogram clustering of z-scores for each differentiation efficiency condition at Days 0 and 1 (formatted versions of expected outputs shown in Figures 2 & S4).
   * _Expected runtime:_
     * Approximately 10 minutes

---
### 4) Instructions for use and reproduction
   
* **classification_results_umap_together_Day1Efficiency.csv**
  1) Open the file _Differentiation Classification_Compiled_Clean.ipynb_ inside a jupyter environment. Subsequently run each source code cell to run all processing steps in sequence and generate ROC curves and feature weight graphs for Figures 3 & S5. No other adjustments to the code should be needed.  
* **classification_results_umap_together_Day1Efficiency.csv** & **classification_results_umap_AllData.csv** 
  1) Open the file _UMAP_Mapping_Compiled_Clean.ipynb_ inside a jupyter environment. 
     * _classification_results_umap_together_AllData.csv_ is read in to produce Days 0-5 UMAPs (Figure 2).
     * _classification_results_umap_together_Day1Efficiency.csv_ is read in to produce Day 1 low vs high effiency UMAP (Figure 3). 
  * Run source code to perform all processing steps in sequence and save CSV file with UMAP coordinates. No other adjustments to the code should be needed.    
  2) Open the file _Differentiation_UMAP_plotting.R_ in RStudio
     *Run all source code in “Differentiation_UMAP_plotting.R” to perform all processing steps in sequence and generate UMAP plots for Figures 2, 3, & S3 and save .eps files for each UMAP plot. No other adjustments to the code should be needed.  
* **Differentiation_ZscoreData.csv Differentiation_ZscoreData_day1.csv, & Differentiation_ZscoreData_day0.csv**
  * Run all source code in “Differentiation Z score heatmaps.R” to perform all processing steps in sequence to generate heatmaps for Figures 2 & S4. No other adjustments to the code should be needed. 

**All code run according to the instructions provided above should accurately reproduce the results reported in the accompanying study. Source code also includes detailed comments for functionality of individual lines/sections.**

