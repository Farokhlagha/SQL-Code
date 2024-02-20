TRUNCATE TABLE	[Database1].dbo.Example




INSERT INTO Scorecard.[dbo].Example
SELECT  DISTINCT  Masterkey
FROM	[AggregateDatabase1].dbo.[Example_Table]
WHERE	IDOrganization = 279
AND Masterkey LIKE '292%'





-- Getting patients first, last, and DOB


UPDATE Example
SET	[Patient's First Name]	= Pers..PsnFirst,	[Patient's Late Name]	=  Pers.PsnLaSt,	[Patient's Date of Birth]	=  Pers.Psnous,	[Client Name]	= Pers.PcPPracticeName
FROM [AggregateDatabase1].dbo.[Example_Table] Pers
JOIN  Scorecard.Example  samp
ON  Pers.MasterKey	=   samp.MRN
WHERE Pers.IDOrganization = Pers.IDMasterOrganization
AND  Pers.Idstatus = 1




--  getting most recent phone number

UPDATE  Example
SET	[Patient's  Phone  Number]	=  replace(replace(replace(replace(replace(replace(replace(replace(LTRIM(RTRIM(A.Phone)),'-',''),'(',''),')',''), ' ' ,''), '/' ,''),'x',''),'*',''),'calls','')
FROM (
 
SELECT  Phone [MasterKey],Phone.Phone,Phone.DateUpdated, ROW_NUMBER()  OVER (PARTITION BY Phone.MasterKey ORDER BY Phone.DateUpdated DESC) RN
FROM  [AggregateDatabase1].dbo.[Phone_Table]   Phone 
	INNER  JOIN  Scorecard.Example samp
ON Phone.Masterkey = samp.MRN
WHERE  PhoneType  in ('CELL','HOME') 
and  ISNULL ([Phone],'')  <> ''
and phone not  like  '%[a-z]%'
and  replace(replace(replace(replace(replace(replace(replace(replace(LTRIM(RTRIM(Phone.Phone)),'-',''),'(',''),')',''), ' ' ,''), '/' ,''),'x',''),'*',''),'calls','') NOT LIKE 'e%'
and lenreplace(replace(replace(replace(replace(replace(replace(replace(LTRIM(RTRIM(Phone.Phone)),'-',''),'(',''),')',''), ' ' ,''), '/' ,''),'x',''),'*',''),'calls','') = 10
) A

join [AggregateDatabase1].dbo.[Person_Table] j 	on a.MasterKey = j.MasterKey
join [AggregateDatabase1].dbo.[Master_Patient_Index_Table]  d  on  j.IDOrganization =  d.IDOrganization  END J.IDPerson = d.IDPerson 
INNER JOIN Scorecard.dbo.example Outp
ON A.MasterKey = OutP.MRN
WHERE  RN = 1





--  formats  phone  number
