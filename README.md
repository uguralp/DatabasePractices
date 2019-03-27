## Practice Project

A small company in Ontario has 2 plants in Guelph and Waterloo. The company produces parts for
cars and motorcycles. The owner of the company keeps information about the production in a
manual journal, which is shown below.
![](https://i.imgur.com/JGM13EP.png)
The owner of the company realized that the manual journal will soon become too long and hard to
understand. She hires you to design a new database, which will be replacing the journal. The
company owner main requirement is that no data from the original manual journal is lost while
transferring it to the new database.

The new database design requires that you split the table above to several database tables. You
will have to describe why and how you will perform the split (or several splits). Please provide the
description as commented text within your SQL script file.

## Solution
1.    The database was split up because it was complicated to track the different information in one place.  Now we have 3 tables which we can track every information easily and fast.
2.    I have 3 tables on the new database. I am going to explain how I split up the old table with these three.

### Part table: 
This table provides the parts that the company has. The part should have a unique table because that is the effective option to track them and provide the available ones to the customers. For this reason, I split up the part records from the Journal table to the Part table.
### Employee table: 
This table provides the information of the employees. I moved out the employee’s name into the Employee table to track them easily.
### Customer table: 
This table provides the information about the customers. Since the customer has an employee that they were bonded and parts that they bought, there should be a unique customer table to track this information. I moved out the customer name into the Customer table and added the PartID and EmployeeID to make a relationship between Part and Employee table.
