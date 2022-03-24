*Seamus Gallivan*

### Overall Grade: 117/120

### Quality of report: 8/10

-   Is the homework submitted (git tag time) before deadline? Take 10 pts per day for late submission.  

-   Is the final report in a human readable format html? 

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how results are produced by just reading the report? Take some points off if the solutions are too succint to grasp, or there are too many typos/grammar. 

    Your last question is very sloppy. Not only is the code in one bunch, not separating the results clearly, either by a new line or new code section, but the results are one mumbo jumbo paragraph. No one wants to read that. `-2`.

### Completeness, correctness and efficiency of solution: 70/70

- Q1 (10/10)

- Q2 (20/20)

- Q3 (20/20)

- Q4 (10/10)

- Q5 (10/10)
	    
### Usage of Git: 10/10

-   Are branches (`main` and `develop`) correctly set up? Is the hw submission put into the `main` branch?

    Yes

-   Are there enough commits (>=5) in develop branch? Are commit messages clear? The commits should span out not clustered the day before deadline. 
          
-   Is the hw1 submission tagged? 

    Yes

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes
  
-   Do not put a lot auxiliary files into version control. 

-   If those gz data files or `pg42671` are in Git, take 5 points off.

### Reproducibility: 9/10

-   Are the materials (files and instructions) submitted to the `main` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? 

    The materials are all there. However, lines 173 and 203 were `eval = F`. When I make them `eval = TRUE`, comment off the directory, then the answer loads. Please try this. The idea is to have everything in one folder to knit. `-1`.

-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the results?

### R code style: 20/20

For bash commands, only enforce the 80-character rule. Take 2 pts off for each violation. 

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 

-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.). 
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. 

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.