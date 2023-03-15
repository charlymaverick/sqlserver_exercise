
--orden año nacimiento (Year_Birth)
select *
from PortfolioProject..marketing_place
order by 2

--Seleccion de datos que vamos a usar
Select ID,Year_Birth,Marital_Status
from PortfolioProject..marketing_place
order by 1,2

--Recuento de datos segun es estado civil(Marital_Status)
Select Marital_Status,COUNT(*) as Total
from PortfolioProject..marketing_place
group by Marital_Status
order by Total desc

--Vamos a revisar las quejas de las personas casadas
Select Marital_Status,sum(complain)
from PortfolioProject..marketing_place
Group by Marital_Status

--Vamos a revisar las quejas filtrado por estado civil
Select Marital_Status,sum(complain) as quejas_total
from PortfolioProject..marketing_place
Group by Marital_Status
order by quejas_total desc

--Reconocimiento de max clientes en vino,fruta,carne,dulces
select Marital_Status,sum(MntWines) as vino 
from PortfolioProject..marketing_products
group by Marital_Status
order by vino desc

select Marital_Status,MntFishProducts as frutas 
from PortfolioProject..marketing_products
group by Marital_Status
order by frutas desc

select Marital_Status,sum(MntMeatProducts) as carne
from PortfolioProject..marketing_products
group by Marital_Status
order by carne desc

select Marital_Status,sum(MntFishProducts) as pescado
from PortfolioProject..marketing_products
group by Marital_Status
order by pescado desc

select Marital_Status,sum(MntSweetProducts) as dulces
from PortfolioProject..marketing_products
group by Marital_Status
order by dulces desc

select Year_Birth,sum(MntSweetProducts) as dulces
from PortfolioProject..marketing_products
group by Year_Birth
order by dulces desc

select Year_Birth, SUM(MntMeatProducts) as carne, SUM(MntFishProducts) AS pescado,
    (select SUM(MntMeatProducts) + SUM(MntFishProducts) as total
     from PortfolioProject..marketing_products as innerTable
     where innerTable.Year_Birth = outerTable.Year_Birth
     group by innerTable.Year_Birth
    ) as total
from PortfolioProject..marketing_products as outerTable
group by Year_Birth
order by total desc;





--consulta de compras segun el lugar
select Marital_Status,sum(NumWebPurchases)as pag_web,sum(NumCatalogPurchases) as catalogo,sum(NumStorePurchases) as tiendas
from PortfolioProject..marketing_place
group by Marital_Status

select sum(NumWebPurchases)/sum(NumWebVisitsMonth) *100 as resultado
from PortfolioProject..marketing_place

--consulta de promociones
select sum(AcceptedCmp1) as camp1,sum(AcceptedCmp2) as camp2,sum(AcceptedCmp3) as camp3,sum(AcceptedCmp4) as camp4,sum(AcceptedCmp5) as camp5
from PortfolioProject..marketing_place

select Marital_Status,sum(AcceptedCmp1) as camp1,sum(AcceptedCmp2) as camp2,sum(AcceptedCmp3) as camp3,sum(AcceptedCmp4) as camp4,sum(AcceptedCmp5) as camp5
from PortfolioProject..marketing_place
group by Marital_Status

--consulta fecha de alta clientes
select Dt_Customer,count(*) as total
from PortfolioProject..marketing_place 
group by Dt_Customer
order by total 





























