
--Question 1:
--We need to understand  students adaptability  in online education. I  am interesting  to know which level of  adaptability  have  students with  poor financial 
--condition  and using  mobile data   instead  of wi-fi. We want to make  sure we understand  if better  finantial  condicions help  students  to  better  adapt  in  online  
--education. / Created by Hialena C
  
SELECT [Adaptivity_Level]
      ,[Internet_Type]
      ,[Financial_Condition]
	  ,[Education_Level]

FROM [EC_IT143_DA].[dbo].[Students_OnlineEducations]
WHERE Financial_Condition = 'poor' AND Internet_Type = 'mobile data'
     ORDER BY Education_Level ASC;


--Question 2:
--The  department  of education  want  to know  if students  enrolled  in Non Government  Institutions have higher level of  adaptability than students  enrolled in 
--Government  institucions/ I need  to know this by age group, gender and  education level. /Created by Hialena C

SELECT [Adaptivity_Level]
	  ,[Education_Level]
	  ,[Gender]
      ,[Age]
      ,[Institution_Type]
FROM [EC_IT143_DA].[dbo].[Students_OnlineEducations]
WHERE Institution_Type = 'Non Government' 
     ORDER BY Age ASC;


--Question 3:
--We need to understand how New York City  students enrolled in public  schools  performed  in SAT exams. I am interesting   to know which  NYC public  schools  had received  
--the highest  SAT score in math / I need to know this  by  school name and  zip  code / Created by Hialena C
SELECT [SCHOOL_NAME]       
   ,[SAT_Math_Avg_Score]  
FROM[EC_IT143_DA].[dbo].[SAT_RESULT NYC]
WHERE SAT_Math_Avg_Score =(
SELECT max(S.SAT_Math_Avg_Score) 
      FROM [EC_IT143_DA].[dbo].[SAT_RESULT NYC] AS S)
	  
--Question4:
--The   New York City department of  education wants to know how  many  students have taken  SAT test  in public  schools and  
--also  they  want to know which school has the  highest Numer of SAT test takers/ Created by Hialena C
SELECT SUM(Num_of_SAT_Test_Takers) AS Number_Students_Had_Taken_SAT_In_NYC
FROM[EC_IT143_DA].[dbo].[SAT_RESULT NYC] 

SELECT *
      FROM  [EC_IT143_DA].[dbo].[SAT_RESULT NYC] 
	  INNER JOIN [EC_IT143_DA].[dbo].[NYC_SAT SCORES]
	  ON [EC_IT143_DA].[dbo].[SAT_RESULT NYC] .SCHOOL_NAME=[EC_IT143_DA].[dbo].[NYC_SAT SCORES].School_Name
	  ORDER BY Num_of_SAT_Test_Takers DESC;
