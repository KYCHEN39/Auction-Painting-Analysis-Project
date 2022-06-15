Select * 
From dbo.Painting_ver3
;

Select CONCAT(UPPER(Left(PaintingName, 1)), LOWER(substring(PaintingName, 2, 20))) as PaintingNameCleaned
From dbo.Painting_ver3
;

With Painting_cte as 
	(
	Select PaintingID,
	count(case when Red > 0 then 1 else null end) as RedCount,
	count(case when Yellow > 0 then 1 else null end) as YellowCount,
	count(case when Orange > 0 then 1 else null end) as OrangeCount,
	count(case when Green > 0 then 1 else null end) as GreenCount,
	count(case when Blue > 0 then 1 else null end) as BlueCount,
	count(case when Violet > 0 then 1 else null end) as VioletCount,
	count(case when Brown > 0 then 1 else null end) as BrownCount,
	count(case when Black > 0 then 1 else null end) as BlackCount,
	count(case when Grey > 0 then 1 else null end) as GreyCount
	From dbo.Painting_ver3
	Group by PaintingID
	)


Select PaintingID, (RedCount+YellowCount+OrangeCount+GreenCount+BlueCount+VioletCount+BrownCount+BlackCount+GreyCount) as TotalCount
From Painting_cte
;



