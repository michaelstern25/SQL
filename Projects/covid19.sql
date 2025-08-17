/*
Covid 19 Data Exploration 

Skills used: Joins, Windows Functions, Aggregate Functions, Converting Data Types

*/

-- ALTER TABLE "CovidDeaths" RENAME TO covid_deaths; -- (Rename Table Optional)

SELECT * FROM "CovidVaccination";

SELECT * FROM "CovidDeaths"
WHERE continent IS NOT NULL
ORDER BY 3,4;


-- Select Data that we are going to be starting with
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM "CovidDeaths"
WHERE continent IS NOT NULL
ORDER BY 1,2;


-- 1. Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
SELECT Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage 
FROM "CovidDeaths"
WHERE location LIKE 'India'
AND continent IS NOT NULL 
ORDER BY 1,2;


-- 2. Total Cases vs Population
-- Shows what percentage of population infected with Covid
SELECT Location, date, Population, total_cases,  (total_cases/population)*100 AS PercentPopulationInfected
FROM "CovidDeaths"
WHERE location LIKE 'India'
ORDER BY 1,2;


-- 3. Countries with Highest Infection Rate compared to Population
SELECT Location, Population, MAX(total_cases) AS HighestInfectionCount,  
							 Max((total_cases/population))*100 AS PercentPopulationInfected
FROM "CovidDeaths"
-- Where location like '%India%'
GROUP BY Location, Population
ORDER BY PercentPopulationInfected DESC;


-- 4. Countries with Highest Death Count per Population
SELECT Location, MAX(CAST(Total_deaths AS int)) AS TotalDeathCount
FROM "CovidDeaths"
--Where location like '%states%'
WHERE continent IS NOT NULL 
GROUP BY Location
ORDER BY TotalDeathCount DESC;


-- BREAKING THINGS DOWN BY CONTINENT

-- 5. Showing contintents with the highest death count per population
SELECT continent, MAX(CAST(Total_deaths AS int)) AS TotalDeathCount
From "CovidDeaths"
--Where location like '%states%'
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY TotalDeathCount DESC;


-- 6. GLOBAL NUMBERS
SELECT continent, SUM(new_cases) AS total_cases, 
	   SUM(CAST(new_deaths AS int)) AS total_deaths, 
	   SUM(CAST(new_deaths AS int))/SUM(New_Cases)*100 AS DeathPercentage
FROM "CovidDeaths"
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY 1,2;


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
	SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM "CovidDeaths" dea
JOIN "CovidVaccination" vac
	ON dea.location = vac.location
	AND dea.date = vac.date::date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3;

