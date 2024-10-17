# General description
The main purpose of this portfolio is to present my professional skills. Thus, I'm providing a few samples just to illustrate competencies I have. I find important to emphasise:
> *None of the data used in this portfolio relates to the real data of my previous employers.* 

*BPMN-diagrams*, *UML-diagrams*(except ER) and *Requirements* linked by the same case: implementation of a new payout partner.

# Content description 
## BPMN-diagrams
This folder contains an example of business process model I've prepared and presented to stakeholders and attached to BRD. This scheme illustrated the solution I've developed which were been properly described in requirement document afterwards. 
As far as I haven't dealt with BPM systems, the main purpose of my models is just to explain a process. BPMN is complex modeling notation, and a lot of information consumers are not advanced users. To make a model more comprehensible for untrained colleagues I don't use all possible BPMN elements.   

Attached file **withdraw_method_change_paysec.drawio** is a scheme of withdraw method selection for payouts. Duplicated as the image for a quick view.

## PowerBI-reports
The folder contains PowerBI report file **conversion.pbix report**. This report helps to identify areas where the website may be losing customers and provides opportunities for improvement. To demonstrate my skills I've prepared simple star data model and a bunch of measures(includind context transition).
 + The first page presents multiple visualizations that provide overview of the funnel stages with conversion rate and the number of visitors at each stage. The page also includes a breakdown of the customer device and gender.
 + Second page visulaizations describe purchases in slice of gender, device and day of the week with fictional KPI added. 

PDF version of the report applied for a quick view.
Datasource for the report is [here](https://www.kaggle.com/datasets/aerodinamicc/ecommerce-website-funnel-analysis).

## Python-regressions
This section contains python code to perform linear and logistic regressions (and source .csv files). I've written code in Jupyter Notebook. 

## Python-scripts
Here I attached python script **bank_marketing_campaigns_analysis.ipynb** I've written in Google Colab to process and analyze marketing campaign data.

## Requirements
The file **paysec_requirements.md** is an example of BRD document. It describes business requirements for implementation of the new payout partner. To simplify the document I intentionally missed some detailes. Usually I prepare this kinds of documents in Confluence, which has more possibilities for formatting; however, I tried to convey the general structure.

## SQL-queries
This folder contains an example of SQL queriy I've written to extract and analyze data from databases. Thus I'd like to highlight that I am able to work with complex SQL queries. 
The file **rewards_for_period_transposed.sql** is a query with CTE and multiple tables joins to analyse turnover and agency reward by systems for certain period.  

## UML-diagrams
The goal I pursue with this section is to demonstrate my abilities to thinking in terms of systems and usage of modelling tools. 
Both diagrams are duplicated as the image for a quick view. 

The folder includes the next UML-diagrams: 
* Sequence diagram **withdraw_method.puml** illustrates the flow of selecting the withdraw method through aside service. Designed with PlantUML.
* ER giagram **agency_reward.drawio** shows the data structure for agency reward service. To simplify the model I intentionally stoped on the logic level and missed technical details, such as data types. 