# vmm

dntchenpeng@163.com
陈鹏


SELECT
	o.id AS ordersid,
	o.numbering,
	o.customerid,
	c.numbering AS customername,
	v.id AS vehicleid,
	v.vehname,
	v.carmodel,
	o.warrcontent,
	b.id AS bustatusid,
	b.statename AS busstatus,
	p.id AS paystatusid,
	p.statusname AS paystatus,
	o.esdeliverytime,
	q.ptotal,
	m.mtotal,
	(q.ptotal+m.mtotal) as totalcost
FROM
	orders AS o
JOIN customer AS c ON (o.customerid = c.id)
JOIN vehicle AS v ON (o.vehicleid = v.id)
JOIN bustatus AS b ON (o.bustatusid = b.id)
JOIN paystatus AS p ON (o.paystatusid = p.id)
JOIN (
	SELECT
		_p.ordersid,
		SUM(_p.ptotal) AS ptotal
	FROM
		(
			SELECT
				u.ordersid,
				(

					IF (
						u.receivednum = '0',
						'0',
						u.receivednum * p.salesprice
					)
				) AS ptotal
			FROM
				partused AS u
			JOIN part AS p ON (u.partid = p.id) 
		) AS _p 
		group by _p.ordersid
) AS q ON (q.ordersid = o.id)
JOIN (
	SELECT
		_m.ordersid,
		sum(_m.totalcost) AS mtotal
	FROM
		(
			SELECT
				m.ordersid,
				m.spenttime * i.itemprice AS totalcost
			FROM
				mainprojreg AS m
			JOIN mainitem AS i ON (m.mainitemid = i.id) 
		) AS _m 
		group by _m.ordersid
) AS m ON (m.ordersid = o.id)
where o.bustatusid='3' 
ORDER BY
	o.id ASC;
	
	
	
select 
p.id as procid,
p.partcode,
i.partname,
p.partcategorycode,
c.partcategory,
p.suppliercode,
p.suppliername,
p.pruchdemand,
p.partcategoryname as createtime,
p.purchstatus
from partproc as p
join partcategory as c on(p.partcategorycode=c.id)
join part as i on(p.partcode=i.id)

