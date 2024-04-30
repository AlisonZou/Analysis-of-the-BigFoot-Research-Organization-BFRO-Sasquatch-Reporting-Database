# Bigfoot Sightings Analysis


## Project Overview
This project aims to explore patterns in Bigfoot sightings across various locations, integrating BFRO sightings data with additional environment, species distribution, and unemployment information.


#Task 4:


## Dependencies
Python 3: The programming language used to write the script.
pandas: A library providing high-performance, easy-to-use data structures and data analysis tools.
spacy: An open-source library for advanced natural language processing.
number_parser: A library for parsing numbers written in natural language into their numerical representation.
openai: A library provided by OpenAI to interact with their GPT models for natural language processing tasks.


## Installation
Install the required libraries using pip:
pip install pandas spacy number_parser openai
python -m spacy download en_core_web_sm


# Task 5


## Datasets
1. **BFRO Sightings Data**: Primary dataset detailing reported sightings of Bigfoot, including timestamps, geolocations, and eyewitness accounts.
2. **Environmental Data**: Features image-based datasets on forest cover rates, the number of lakes, and total natural disasters within each state, manually entered from the National Centers for Environmental Information and other sources.
3. **Species Distribution Data**: Sourced from New York State's public API, provides county-specific ecological information such as wildlife diversity and conservation concerns.
4. **Unemployment Data**: Offers insights into unemployment rates by areas (counties, boroughs, parishes, etc.), potentially reflecting economic conditions of the areas where sightings were reported. The dataset also includes information on the locale categories (city, suburban, town, rural) of each area and the civilian labor force of each area.


## Features Extracted
- **From Environmental Data**: 'Forest Cover Rate', 'Number of Lakes', 'Total Disasters'
- **From Species Distribution Data**: 'Wildlife Diversity', 'Conservation Concern', 'Last Documented Presence'
- **From Unemployment Data**: ‘Unemployment rate’, ‘Civilian labor force’, ‘City/Suburb/Town/Rural’ 


## Notes on Unemployment Dataset:
* The column titled ‘Area_name’ in the unemployment dataset is essentially the same as the column titled ‘County’ in the BFRO dataset. The column is just labeled as ‘Area_name’ in the unemployment dataset because that column included counties, parishes, and boroughs, so it was called ‘Area_name’ to acknowledge that not all of the areas listed were necessarily counties. The ‘County’ column in the BFRO dataset also includes parishes, boroughs, and counties, but for the purpose of that dataset, it seems like all those areas are just labeled under the term county.
* The code for merging the third dataset (unemployment dataset) initially includes the column ‘Median_Household_Income_2019’ as a relevant column to keep while filtering the data. This is because median household income was originally going to be one of the features extracted from the dataset to be used when joining the unemployment dataset with the BFRO dataset. However, the decision was made later on to drop median household income as a feature and to use the feature of civilian labor force instead. The feature of median household income had already been extracted before the decision was made to drop it, which is why it can be seen in the code that the feature was originally retained but ultimately dropped.
* Some of the area names in the unemployment dataset were manually changed before merging that dataset with the BFRO dataset. This is because there were some slight differences in the names of a few of the counties. For example, one of the counties was labeled as “Southeast Fairbanks Census” in the unemployment dataset while the BFRO dataset had that county labeled only as “Southeast Fairbanks”. However, they are the exact same county, one of them was just labeled more specifically. 


## Installation and Usage


### Prerequisites
Ensure you have Python 3.6 or higher installed on your system.


### External libraries used:
* pandas: A data manipulation and analysis library in Python. It offers intuitive data structures and tools for working with structured data, including data cleaning, manipulation, and analysis.
* requests: A Python HTTP library for interacting with websites and web services. It offers an intuitive API for sending HTTP requests, managing parameters, headers, cookies, and more. 


### Setup and installing the required libraries:
1. Clone this repository to your local machine.
2. Navigate to the root directory of the cloned repository in your terminal.
3. Install the required Python packages using the following command:
   ```bash
   pip install -r Requirements.txt


### Running the Jupyter Notebook


After setting up the environment and installing all necessary dependencies, follow these steps to run the `code.ipynb` notebook located in the `notebook` folder:


1. **Launch Jupyter Notebook**: Open the terminal or command prompt, navigate to the project directory, and then run:
   ```bash
   jupyter notebook
   ```
   This will start the Jupyter Notebook server and open your default web browser to the Jupyter dashboard.


2. **Navigate to the Notebook**: In the Jupyter dashboard, navigate to the `notebook` folder and click on `code.ipynb` to open it.


3. **Run the Notebook**: Execute the cells sequentially by selecting each and pressing `Shift + Enter`, or use the "Run All" option in the menu to execute all cells in the notebook.


4. **Review the Results**: Outputs from the analysis will be displayed directly below each cell. Review these to find the updated csv file.




# Task 6


## Remove unimportant features
We want to remove some features and only keep features that may be correlated. Run **remove_tsvcol.ipynb** to remove the unimportant features from merged_bfro.tsv, and we can get a new tsv file named selected_bfro.tsv


## Use ETLLib to transform tsv file to json
We use ETLLib to transform tsv files to json. First grab ETLLib, I personally installed ETTlib in the homework main folder, if you choose to install ETLLib in a different place, the codes need to be adjusted a little bit regarding the paths.
1. ```git clone git@github.com:chrismattmann/etllib.git```


Also need to install libmagic
1. ```brew install libmagic```


Next we install ETLLib by the following command, python 2.7.x is needed, create a python 2.7 environment is a choice
1. ```cd etllib```
2. ```python setup.py install```


## Install tika-similarity
Before actually running tika similarity, first install it, I personally installed that in the data directory, so the commands below assumes that the tika similarity directory is inside the data directory, if you choose to install tika similarity in a different place, the codes need to be adjusted a little bit regarding the paths. 


Install Tika-Python
```pip install tika```


Install Java Development Kit from https://www.oracle.com/java/technologies/javase-downloads.html


Install tika-similarity by
```
git clone https://github.com/chrismattmann/tika-img-similarity
pip install tika editdistance
```


## tsvtojson and repackage
Before you perform this, make sure you have gone (cd) to the ‘Source_Code’ directory, and make sure you have the aggregate-json folder and repackaged_data folder in the data folder. Then run the tsvtojson.sh by the following command
1. ```chmod +x tsvtojson.sh```
2. ```./tsvtojson.sh```


## Split dataset into chunks
We now have 5499 json files, we want to split that up into 100-file chunks. To do this, run the split_jsons.sh:
1. ```chmod +x split_jsons.sh```
2. ```./split_jsons.sh```


## Jaccard Similarity
Create a tika_results directory inside the Source_Code directory
Run these command, make sure you are in the code directory
1. ```chmod +x jaccard_100.sh```
2. ```./jaccard_100.sh```


## Edit Distance Similarity
Run the following command in the Source_Code directory
1. ```chmod +x edit_100.sh```
2. ```./edit_100.sh```


## Cosine Similarity
Run these commands in the Source_Code directory
1. ```chmod +x cosine_100.sh```
2. ```./cosine_100.sh```


## Split that up into 200-file and 300-file chunks
I then repeated the above steps by splitting the dataset into 200-file chunks and 300-file chunks. Also created a folder containing datasets with up to 1000 json files, but wasn't able to analyze it due to tika server connection issues. To create these splitted folders, run the following
1. ```chmod +x split_jsons_1.sh```
2. ```./split_jsons_1.sh```


Now we have three folders, splitted_200, splitted_300 and splitted_1k in our splitted_data folder
And now get Jaccard similarity, edit-distance, and cosine similarity using Tika Similarity for the 200-file chunks and 300-file chunks by the following command:


Jaccard similarity:
1. ```chmod +x jaccard_200.sh```
2. ```./jaccard_200.sh```
3. ```chmod +x jaccard_300.sh```
4. ```./jaccard_300.sh```


Edit distance:
1. ```chmod +x edit_200.sh```
2. ```./edit_200.sh```
1. ```chmod +x edit_200.sh```
2. ```./edit_200.sh```


Cosine similarity
1. ```chmod +x cosine_200.sh```
2. ```./cosine_200.sh```
1. ```chmod +x cosine_300.sh```
2. ```./cosine_300.sh```


Now if you want to check the plots for any analysis, cd/go to that directory, and run
```python -mSimpleHTTPServer 8082```, or ```python -mhttp.server 8082``` for Python 3 and then you can use http://localhost:8082/levelCluster-d3.html to see the results. For example, if I want to check the plot result for Jaccard similarity of the 200-file datasets, and assume I’m now in the Source_Code directory, I will run
1. ```cd ../data/tika_results/jaccard_2```
2. ```python -mSimpleHTTPServer 8082```


And then use the html link above to access the plot. 
The screenshots of Tika similarity results are in the data/tika_result_images folder. 






Task details:
Task 3&4 Kayden Lea
Task 5 Kexuan Zou, Katherine Lieu
Task 6 Yifeng Zou, Xinyao Fu