This repository contains below items
-  Functional Test Cases which are created for an e-commerce web site in the "Test Cases - Petshop" directory
-  An API automation which is created by using Postman in "API - Postman" directory
-  Another API automation which is created by using Robot Framework - Requests Library in "API" directory
-  Also, an E2E UI automation which is created with Robot Framework - Selenium Library in the "Features, stepDefinitions and variables" directories

Technologies Used
-Robot Framework (Test Automation Framework)
-SeleniumLibrary (Web Automation Library)
-Allure Report (Test Reporting Tool)
-Python 3.x (Robot Framework Dependency)
-Chrome WebDriver / Geckodriver
-Postman

Prerequisites
- Install Python
- Install Robot Framework with required libraries
- Install Allure Report (Java must be installed)
- Download ChromeDriver
- For the Postman API, Postman Web Client can be used

In order to execute E2E UI Automation, below command is run on terminal
- robot --listener allure_robotframework --variable browserSelection:Chrome features
- Browser can be set with browserSelection parameter in above command like Chrome or Firefox

In order to generate an allure report after execution, below command is run on terminal
- allure serve output/allure

In order to execute API automation with robot framework, below command is run on terminal
- robot -d apiResult API
