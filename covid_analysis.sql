show tables;
select * from coviddeaths;
-- since during import we have imported everything as varchar (text), so before working
-- we need to make sure that the columns have their required datatype. 
-- we are working with table "coviddeath" right now

update coviddeaths set `date` = str_to_date(`date`, "%d/%m/%Y");

ALTER TABLE coviddeaths MODIFY `date` DATE;

-- we will repeat these two queries below to make the data trimmed and replace '' -> NULL
-- this is required if we want to convert text -> int/numeric
SELECT *
FROM coviddeaths
WHERE trim(new_cases_smoothed) = '';

UPDATE coviddeaths
SET new_cases_smoothed = NULL
WHERE trim(new_cases_smoothed) = '';


-- now we will modify the data types of columns
ALTER TABLE coviddeaths
MODIFY population BIGINT,
MODIFY total_cases DECIMAL(20,6),
MODIFY new_cases DECIMAL(20,6),
MODIFY total_deaths DECIMAL(20,6),
MODIFY new_deaths DECIMAL(20,6);

alter table coviddeaths
modify new_cases_smoothed decimal(20,6);

select  new_deaths_smoothed from coviddeaths;
select  total_cases_per_million from coviddeaths;
select  new_cases_per_million from coviddeaths;
select  new_cases_smoothed_per_million from coviddeaths;
select  total_deaths_per_million from coviddeaths;
select  new_deaths_per_million from coviddeaths;
select  new_deaths_smoothed_per_million from coviddeaths;
select  reproduction_rate from coviddeaths;
select  icu_patients from coviddeaths order by 1 desc; -- int
select  icu_patients_per_million from coviddeaths order by 1 desc;

alter table coviddeaths
modify total_cases_per_million decimal(20,6),
modify new_cases_per_million decimal(20,6),
modify new_cases_smoothed_per_million decimal(20,6),
modify total_deaths_per_million decimal(20,6),
modify new_deaths_per_million decimal(20,6),
modify new_deaths_smoothed_per_million decimal(20,6),
modify reproduction_rate decimal(20,6),
modify icu_patients bigint,
modify icu_patients_per_million decimal(20,6);

SELECT *
FROM coviddeaths
WHERE trim(total_cases_per_million) = '';

UPDATE coviddeaths
SET icu_patients_per_million = NULL
WHERE trim(icu_patients_per_million) = '';


select hosp_patients from coviddeaths order by 1 desc; -- int
select hosp_patients_per_million from coviddeaths;
select weekly_icu_admissions from coviddeaths;
select weekly_icu_admissions_per_million from coviddeaths;
select weekly_hosp_admissions from coviddeaths;
select weekly_hosp_admissions_per_million from coviddeaths;
select MyUnknownColumn from coviddeaths order by 1 desc;
select `MyUnknownColumn_[0]` from coviddeaths order by 1 desc;
select `MyUnknownColumn_[1]` from coviddeaths order by 1 desc;

UPDATE coviddeaths
SET weekly_hosp_admissions_per_million = NULL
WHERE trim(weekly_hosp_admissions_per_million) = '';

alter table coviddeaths
modify hosp_patients bigint,
modify hosp_patients_per_million decimal(20,6),
modify weekly_icu_admissions decimal(20,6),
modify weekly_icu_admissions_per_million decimal(20,6),
modify weekly_hosp_admissions decimal(20,6),
modify weekly_hosp_admissions_per_million decimal(20,6);

alter table coviddeaths modify total_deaths bigint;
alter table coviddeaths modify new_cases bigint, modify total_cases bigint;
alter table coviddeaths modify new_deaths bigint;

select * from coviddeaths where trim(continent) = '';
update coviddeaths  set continent = NULL where trim(continent) = '';


-- Now the table coviddeaths have columns which are in thier suitable datatype
-- and all the empty strings are replaced by NULL


select location,`date`,total_cases, new_cases,total_deaths,population
from coviddeaths
order by 1,2;


-- looking at total cases vs total deaths
-- shows likelihood of dying (percentage)

select location,`date`,total_cases,total_deaths, (total_deaths/total_cases)*100 as deathPercentage
from coviddeaths
where location like '%india%'
order by 1,2;



-- looking at total cases vs population
-- shows what % of population got covid

select location,`date`,total_cases,population, (total_cases/population)*100 as percentPopulationInfected 
from coviddeaths
where location like '%india%'
order by 1,2;




-- looking at countries with highest infection rate compared to poluation

select location,population, max(total_cases) as highestInfectionCount, 
	max((total_cases/population)*100 ) as percentPopulationInfected
from coviddeaths
group by location,population
order by percentPopulationInfected desc; 




-- looking at countries with highest death count vs population

select location, max(total_deaths) as totalDeathCount 
from coviddeaths
where continent is not null
group by location
order by totalDeathCount desc; 



-- looking at things by continent
-- showing continents with highest death count

select continent, max(total_deaths) as totalDeathCount 
from coviddeaths
where continent is not null
group by continent
order by totalDeathCount desc; 



-- numbers , globally
-- death % by date

select `date`, sum(new_cases), sum(new_deaths),  sum(new_deaths)*100/sum(new_cases) as deathPercentage
from coviddeaths
where continent is not null
group by `date`
order by 1,2;

-- overall death %
select  sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,  sum(new_deaths)*100/sum(new_cases) as deathPercentage
from coviddeath s
where continent is not null
order by 1,2;




-- ======================================================================================================
-- ======================================================================================================

-- now we work on table "covidvaccinations". since all cols were imported as text, we need to modify and
-- assign suitable data types to each col

select * from covidvaccinations;

-- using the name code to replace '' -> NULL . just copy and paste the respective col names
select * from covidvaccinations
where trim(total_tests_per_thousand) = '';

update covidvaccinations
set human_development_index = null
where trim(human_development_index) = '';

select * from covidvaccinations;

alter table covidvaccinations
rename column MyUnknownColumn to `date`;


update covidvaccinations
set `date` = str_to_date(`date`, "%d/%m/%Y");

select tests_units from covidvaccinations order by 1 desc;

alter table covidvaccinations
modify new_tests bigint,
modify total_tests bigint,
modify total_tests_per_thousand decimal(20,6),
modify new_tests_per_thousand decimal(20,6),
modify new_tests_smoothed bigint,
modify new_tests_smoothed_per_thousand decimal(20,6),
modify positive_rate decimal(20,6),
modify tests_per_case decimal(20,6),
-- modify tests_units
modify total_vaccinations bigint,
modify people_vaccinated bigint,
modify people_fully_vaccinated bigint,
modify new_vaccinations bigint,
modify new_vaccinations_smoothed bigint,
modify total_vaccinations_per_hundred decimal(20,6),
modify people_vaccinated_per_hundred decimal(20,6),
modify people_fully_vaccinated_per_hundred decimal(20,6),
modify new_vaccinations_smoothed_per_million decimal(20,6),
modify stringency_index decimal(20,6),
modify population_density decimal(20,6),
modify median_age decimal(20,6),
modify aged_65_older decimal(20,6),
modify aged_70_older decimal(20,6),
modify gdp_per_capita decimal(20,6),
modify extreme_poverty decimal(20,6),
modify cardiovasc_death_rate decimal(20,6),
modify diabetes_prevalence decimal(20,6),
modify female_smokers decimal(20,6),
modify male_smokers decimal(20,6),
modify handwashing_facilities decimal(20,6),
modify hospital_beds_per_thousand decimal(20,6),
modify life_expectancy decimal(20,6),
modify human_development_index decimal(20,6);


describe covidvaccinations;

-- done with the modificaitons


-- now we will join the two tables


-- looking at total population vs vaccinatinon

select d.continent, d.location, d.date, d.population, v.new_vaccinations
from coviddeaths d
join covidvaccinations v
	on d.location = v.location and d.date = v.date
where d.continent is not null
order by  2,3;




-- looking at total population vs vaccinatinon and rolling sum of vaccinations

select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
	sum(v.new_vaccinations) over(partition by d.location order by d.location, d.date ) as rolling_sum_vaccinations
from coviddeaths d
join covidvaccinations v
	on d.location = v.location and d.date = v.date
where d.continent is not null
order by  2,3;


-- looking at total population vs vaccinatinon and rolling sum of vaccinations and rolling % of vaccinaited people
-- but we cant do it directly in select staement. we need to use a CTE

with popVsVac(continent, location, date, population, new_vaccinations, rolling_sum_vaccinations)
as
(
	select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
		sum(v.new_vaccinations) over(partition by d.location order by d.location, d.date ) as rolling_sum_vaccinations
	from coviddeaths d
	join covidvaccinations v
		on d.location = v.location and d.date = v.date
	where d.continent is not null
)
select *, rolling_sum_vaccinations*100 /population
from popVsVac;



-- we can also use a temporary table here

drop table if exists percentPopVaccinated;
create temporary table percentPopVaccinated(
	continent nvarchar(255),
    location nvarchar(255),
    `date` datetime,
    population numeric,
    new_vaccinations numeric,
    rolling_sum_vaccinations numeric
);
    
insert into percentPopVaccinated 
select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
	sum(v.new_vaccinations) over(partition by d.location order by d.location, d.date ) as rolling_sum_vaccinations
from coviddeaths d
join covidvaccinations v
	on d.location = v.location and d.date = v.date;
-- where d.continent is not null;

select *, rolling_sum_vaccinations*100 /population
from percentPopVaccinated;




-- creating view to store data for later visualizations
 create view percentPopVaccinated as
	select d.continent, d.location, d.date, d.population, v.new_vaccinations, 
		sum(v.new_vaccinations) over(partition by d.location order by d.location, d.date ) as rolling_sum_vaccinations
	from coviddeaths d
	join covidvaccinations v
		on d.location = v.location and d.date = v.date
	where d.continent is not null;
    
 


-- ==========================
-- we did exploratory data analysis, cleaned data . now we will choose certain queries
-- to export as tables , which we will use to create visualizations on tableau
-- we are using the table : coviddeaths

-- 1. global numbers
select  sum(new_cases) as total_cases, sum(new_deaths) as total_deaths,  sum(new_deaths)*100/sum(new_cases) as deathPercentage
from coviddeaths
where continent is not null
order by 1,2;

-- 2. total deaths by continents 
select location, sum(new_deaths) as totalDeathCount
from coviddeaths
where continent is null
and location not in ('World','European Union','International')
group by location
order by totalDeathCount desc; 


-- 3. global % infected -> we will make this on map
select location,population, max(total_cases) as highestInfectionCount, 
	max((total_cases/population)*100 ) as percentPopulationInfected
from coviddeaths
group by location,population
order by percentPopulationInfected desc; 

-- 4. population infection rate
select location,population,date, max(total_cases) as highestInfectionCount, 
	max((total_cases/population)*100 ) as percentPopulationInfected
from coviddeaths 
group by location,population,date
order by percentPopulationInfected desc; 








































