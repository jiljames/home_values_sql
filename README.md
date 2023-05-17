# home_values_sql
Investigation of Home Values Over Time Using SQL

The Dataset used in this project can be found here https://drive.google.com/file/d/1Ew2rS1O_Mu5dUh59rlVw9IhCy_xrwftk/view
See home_values.sql to see the SQL code that answers the questions below.

Initial Exploration of the Database:

    How many distinct zip codes are in this dataset?
    How many zip codes are from each state?
    What range of years are represented in the data?
        Hint: The date column is in the format yyyy-mm. Try taking a look at using the substr() function to help extract just the year.
    Using the most recent month of data available, what is the range of estimated home values across the nation?
        Note: When we imported the data from a CSV file, all fields are treated as a string. Make sure to convert the value field into a numeric type if you will be ordering by that field. See here 687 for a hint.

Analysis: Explore how home value differ by region as well as change over time.

    Using the most recent month of data available, which states have the highest average home values? How about the lowest?
    Which states have the highest/lowest average home values for the year of 2017? What about for the year of 2007? 1997?

