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
classification_results_umap_together_Day1Efficiency 01192021.csv | Collected/compiled by T.Q. | Yes
classification_results_umap_together_Day1Efficiency 01192021_Dish1.csv | Collected/compiled by T.Q. | Yes
classification_results_umap_together_Day1Efficiency 01192021_Dish2.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData 02082021.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData_day1 02082021.csv | Collected/compiled by T.Q. | Yes
Differentiation_ZscoreData_day0 02082021.csv | Collected/compiled by T.Q. | Yes

---

## 1) System requirements

### Software 
#### Python 
* Python 3.7.3
* Jupyter Notebook 5.7.8
* numpy (1.16.2)
* pandas (0.24.2)
* umap-learn (0.3.10) 
* scikit-learn (0.20.3)  
* matplotlib (3.0.3)
* pathlib (1.0.1)
* progresssbar (2.5)

#### R
* R 3.6.2
* RStudio 1.1.463	
* ggplot2 (3.2.1)
* ggdendro (0.1-20)
* reshape2 (1.4.3)
* gplots (3.0.3)
* RColorBrewer (1.1-2)
* scales (1.1.0)
* spatstat (1.63-3)
* library(ggplot2)
* Hmisc (4.3.1)
* psych (1.9.12.31)
* dplyr (0.8.4)
* plyr (1.8.5)
* rlist (0.4.6.1)
* corrplot (0.84)
* tables (0.8.8)
* ggrepel (0.8.1)
* gridExtra (2.3)
* randomcoloR (1.1.0.1)
* inlmisc (0.4.9)

#### Hardware
All code was last run on a laptop with a 4-core Intel-based processor (6th gen Intel i7-6500U) with Windows 10 Home, 12 GB of RAM, and >1GB of storage  

No non-standard hardware required

--- 
## 2)  Installation Guide

#### Python 
The files _Differentiation Classification_Compiled_Clean.ipynb_ and _UMAP_Mapping_Compiled_Clean.ipynb_ will install the previously listed python dependencies on first run of the source code

#### R 

The files _Differentiation_UMAP_plotting.R_ and _Differentiation Z score heatmaps.R_ will install the previously listed dependencies on first run of the source code, and should be run once prior to running other programs

* Approximate installation time for all software is 30 minutes
* Approximate installation time for dependencies is 1-2 minutes

---
### 3) Demo (Run instructions & expected output)

* **Differentiation Classification_Compiled_Clean.ipynb**
  * _Instructions:_ 
    * Run cell 1 to initialize dependencies, read in required data files, and generate optimized parameters for each classification model used (Logistic regression, support vector machine, & random forest).
    * Run cell 2 to standardize and randomly partition each data set for training each model using the optimized parameters determined from running code in cell 1; trained models will subsequently be evaluated with the partitioned test set
  * _Expected outputs:_ 
    * Run cells 2, 3, & 4 to generate ROC curves and feature weight graphs for each model (formatted versions of expected outputs shown in Figures 3 & S5).
  * _Expected runtime:_
    * Cell 1 for model optimization took approximately 4 hours
    * Cell 2 for model training took approximately 4 hours
    * Cells 3, & 4 approximately 10 min

  &nbsp;

* **UMAP_Mapping_Compiled_Clean.ipynb**
  * _Instructions:_ 
    * Run the code to initialize dependencies, read in required data files, and generate UMAP coordinates for all data according to projection mapped using listed parameters
  * _Expected outputs:_ 
    * The code will generate the following files also included in the repository in the UMAP Data folder: _UMAPCoordinates_DifferentiationProject_AllDataMapping.csv_ & _UMAPCoordinates_DifferentiationProject_Day1EfficiencyNonnormalized revised.csv_
  * _Expected runtime:_
    * Approximately 10 minutes
    
  &nbsp;

* **Differentiation_UMAP_plotting.R** 
  * _Instructions:_ 
    * Update the path on line 2 to point to the extracted zip directory
        * Note: If using Windows, make sure the path variable uses forward slashes. (macOS and Linux already use them)
    * Run the code to initialize dependencies, read in required data files, and generate UMAP plots based on coordinates from above code. 
  * _Expected outputs:_ 
    * Resulting plots visualize UMAP clustering of specified subsets of data (formatted versions of expected outputs shown in Figures 2, 3, & S3).
  * _Expected runtime:_
    * Approximately 10 minutes

  &nbsp;
  
* **Differentiation Z score heatmaps.R** 
  * _Instructions:_ 
    * Update the path on line 2 to point to the extracted zip directory
        * Note: If using Windows, make sure the path variable uses forward slashes. (macOS and Linux already use them)
    * Run the code which will initialize dependencies, read in required data files, and generate heatmap plots.
  * _Expected outputs:_
    * Resulting plot depict heatmaps and dendogram clustering of z-scores for each differentiation efficiency condition at Days 0 and 1 (formatted versions of expected outputs shown in Figures 2 & S4).
   * _Expected runtime:_
     * Approximately 10 minutes

---
### 4) Instructions for use and reproduction

* **How to run Jupyter Notebooks** 
  1) Launch Jupyter Notebook and navigate to the root directory of the extracted zip file
  2) Open the notebook file you want to run
     * **UMAP_Mapping_Compiled_Clean.ipynb**
       * Reads in _classification_results_umap_together_AllData.csv_ to produce Days 0-5 UMAPs (Figure 2).
       * Reads in _classification_results_umap_together_Day1Efficiency 01192021.csv_ to produce Day 1 low vs high effiency UMAP (Figure 3).
     * **Differentiation Classification_Compiled_Clean.ipynb** 
       * Reads in _classification_results_umap_together_Day1Efficiency 01192021_Dish1.csv_ and _classification_results_umap_together_Day1Efficiency 01192021_Dish2.csv_ for respective training and test sets for classifer training and evaluation. Generates ROC curves and feature weight graphs for each model (formatted versions of expected outputs shown in Figures 3 & S5).
  3) Run source code/cells top to bottom to perform all processing steps in sequence. No other adjustments to the code needed.    
  
  &nbsp;

* **How to run the R Scripts** 
    1) Open your R integrated development environment (IDE) of choice (e.g. RStudio, RGui etc)
    2) Open the file you want to run
       * **Differentiation Z score heatmaps.R**
         * Reads in _Differentiation_ZscoreData 02082021.csv_ _Differentiation_ZscoreData_day1 02082021.csv_, & _Differentiation_ZscoreData_day0 02082021.csv_. Generates heatmaps for Figures 2 & S4. 
       * **Differentiation_UMAP_plotting.R**
         * Reads in _classification_results_umap_together_Day1Efficiency 01192021.csv_ and _classification_results_umap_AllData.csv_. Generates UMAP plots for Figures 2, 3, & S3 and saves .eps files for each UMAP plot. 
    3) Update the path on line 2 to point to the extracted zip directory
        * Note: If using Windows, make sure the path variable uses forward slashes. (macOS and Linux already use them)
    4) Run all source code. No other adjustments to the code needed.

**All code run according to the instructions provided above should accurately reproduce the results reported in the accompanying study. Source code also includes detailed comments for functionality of individual lines/sections.**

