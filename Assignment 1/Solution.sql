#a
select distinct pat.SSN, pat.`name`
from medical_prescriptions.patient pat
	inner join (select idpatient,`Date` from medical_prescriptions.prescription) pre
	ON pat.SSN = pre.idpatient
where gender='M' and timestampdiff(year,pat.date_of_birth,curdate()) >=30
and year(Date)=2021;

#b
select distinct SSN 
from patient pat
where gender='F'and SSN in (select idpatient
	from prescription as P 
		left join (select iddrug, price from drug) D on D.iddrug=P.iddrug 
        where year(`date`)=2021
	group by  idpatient
	having  sum(quantity*price) >1000);

#c
select a.idArea,a.`name`, round(sum(dr.price*p.Quantity),2) as 'Total amount of drugs prescribed'
from area a 
	left join doctor d 
	on a.idArea=d.idArea
		left join (select idDoctor,quantity,iddrug from prescription) p
		on d.idDoctor=p.idDoctor 
			left join (select iddrug,price from drug) dr 
			on p.iddrug=dr.iddrug
group by a.idArea,a.`name`;

#d
select P.iddrug, month(P.`Date`) as 'Month', ROUND(SUM(Quantity*price),2)  as 'Total Amount'
from prescription as P
	left join (select iddrug,price from drug) D on P.iddrug=D.iddrug
where year(P.`Date`)=2021
group by P.iddrug, month(P.`Date`)
order by P.iddrug, month(P.`Date`);

#e
select D.idDoctor,D.`Name`,ROUND(SUM(Quantity*price),2)  as 'Total Amount'
from doctor as D
	left join (select idArea, mean_income from area) A on D.idArea=A.idArea
		left join (select idDoctor,  Quantity, iddrug from prescription) P on D.idDoctor=P.idDoctor
			left join (select iddrug, price from drug) as DR on P.iddrug=DR.iddrug
where mean_income between 20000 and 30000
group by D.idDoctor,D.`Name`
order by D.idDoctor;

#f
select specialization,ROUND(SUM(Quantity*price),2)  as 'Total Amount'
from doctor as D
	left join (select idDoctor,Quantity,`Date`,iddrug from prescription) P
    on D.idDoctor=P.idDoctor
		left join (select iddrug, price from drug) DR
        on P.iddrug=DR.iddrug
where year(P.`Date`)=2021
group by specialization;


#g
with  year_2020 as(
	select  P.iddrug as 'iddrug',  year(P.`Date`) as 'year' ,round(sum(Quantity*price),2) as 'Y1_total'
    from  prescription as P
		left join (select iddrug, price from drug) D on P.iddrug=D.iddrug
	where year(P.`Date`)=2020
	group by  P.iddrug,year(P.`Date`)
	order by P.iddrug,year(P.`Date`)),
	  year_2021 as(
	select  P.iddrug as 'iddrug',  year(P.`Date`) as 'year' ,round(sum(Quantity*price),2) as 'Y2_total'
    from  prescription as P
		left join (select iddrug, price from drug) D on P.iddrug=D.iddrug
	where year(P.`Date`)=2021
	group by  P.iddrug,year(P.`Date`)
	order by P.iddrug,year(P.`Date`))

select Y1.iddrug, ROUND((Y2_total-Y1_total)/Y1_total,2)*100 AS 'Percentage change %'
from year_2020 as Y1 
	join year_2021  as Y2 
    on Y1.iddrug=Y2.iddrug;

#h
select D.iddrug, sum( case when  gender='F' then  round(((Quantity*price)),2) else 0 end) AS 'F',
sum( case when  gender='M' then  round(((Quantity*price)),2) else 0 end) as 'M'
from patient as PA
	left join (select idpatient, Quantity,iddrug, `Date` from prescription) P
    on PA.SSN=P.idpatient 
		left join (select iddrug,price from drug) D
        on P.iddrug=D.iddrug 
	where year(P.`Date`) =2021
group by  D.iddrug
order by  D.iddrug;