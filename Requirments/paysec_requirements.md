# Paysec as a new withdraw method
## Contents
1. General information
    1.1. Glossary
    1.2. Version history
2. Context
3. Concept
    3.1. Processes schemes
    3.2. Business rules
    3.3. API documentation
4. Requirements
    4.1. Withdraw method selection
    4.2. Adding a new Paysec account as the withdraw method
    4.3. Verification check
    4.4. Choosing existing Paysec account as the withdraw method 
    4.4. Monthly AR withdrawals
5. Risks and countermeasures

## 1. General information
### 1.1. Glossary
| Notion | Definition |
|--------|------------|
| Agency, Agent | Client of our service marked as a private person. |
| AR | Agency Reward. Percent of agency clients' turnover that pays back to agency. |
| Withdraw method | Method for withdraw Agency reward from our service. |
| SE | Agent in Self-employed status. |
| Paysec | Service for payments to self-employed contractors. |
| Invite | SMS message with registration link from Paysec service. |
| Contractor | Agent registered as a Contractor in Paysec service with self-employed status. |
| Contract | The agreement that must be e-signed in Paysec service by the Contractor and us. | 
### 1.2. Version history
| Version | Date | Changes made |
|---------|------|--------------|
|1.1      | 06.07.2022 | Business rule 5 added. |

## 2.Context
During our strategy to collaborate with self-employed agents, we've select a Paysec service as a new partner for agency reward payouts. 
Paysec is able to regularly check a self-employed status and create invoices, and has integration API.
Registration in Paysec is available only by link. The link is unique for us and the same for all our clients. Our link provides possibility to register in Paysec only as a self-employed.

## 3. Concept
We're adding Paysec service as another one withdraw methods. All existing withdraw methods remain. 
General process description for an agent:
- Select Paysec as a withdraw method.
- Create Paysec accound by invite link and verify it. 
- Sign a contract with us in Paysec service.

After contract signature all next agency rewards automatically withdraw to Paysec account.

### 3.1. Processes schemes
> Usually you can find here a business processes models and schemes. As far as current document is just a .md file, they are in UML and BPMN folders in the portfolio.

### 3.2. Business rules
| # | Business Rule |
|---|---------------|
| 1. | Withdraw fee for Paysec is 2%. This fee charged on our side by formula `reward_amount x 0.98` with round to 2 decimal. |
| 2. | We're not checking provided mobile numbers, as we are not able to send SMS. |
| 3. | AR withdrawal to Paysec is availble only for agents in self-employed status. |
| 4. | Agent in our service may has one and only one active Contractor account in Paysec. | 
| 5. | Invite doesn't have a lifetime - its perpetual. | 

### 3.3. API-documentation
Please find Paysec API documentation [here](link).

## 4. Requirements
---
### 4.1. Withdraw method selection
**[Inerface mockups](link)**

1. The system must suggest to Agents with type "private person" a new method "To Paysec balance" on the Withdraw method selection page.
2. The Agent must be informed that:
     + The Paysec method is available only for Agents in self-employed status. During the registration process Paysec asks the user for this status confirmation. Before the AR withdrawal we also will check this status.
     + Paysec account verification and contract signature are mandatory.
     + Withdrawal fee is 2%. 
3. The Agent must have an opportunity to create a new Paysec account or choose an existing one. 
4. After the form sending the Agent must see the current withdraw method with no changes and a label "Paysec account unverified" until we'll receive an information about successful verification. 
---
### 4.2. Adding a new Paysec account as the withdraw method
**[Inerface mockups](link)**

After the Agent entered his phone number and sent request to the new Paysec account on the Withdraw method selection page the system must:
1. Request Invite(*link to API method*). Request parameters:
    + name: agency_id.
    + phone: user's phone number.
2. If Invite successfully sent: add information abount Paysec account in our system with status "Unverified" without existing withdraw method' changing. 
3. In case of the Validation error: inform the Agent that Paysec account for this number already exists.
---
### 4.3. Verification check
**[Inerface mockups](link)**

For all known unverified Paysec accounts the system must:
1. Check Paysec status(*link to API method*) for each 15 minutes by phone numbers(*link to API method*). 
2. For verified accounts with signed contract:
    + get contract ids and sign contracts from our side (*link to API method*).
    + change withdraw method in our service to "Paysec account balance".    
---
### 4.4. Choosing existing Paysec account as the withdraw method
**[Inerface mockups](link)**

If the Agent selected an existing Paysec account to the Withdraw method selection page the system must: 
1. Suggest to the Agent all Paysec accounts we know about with its' status(verified, unverified). 
2. In case of choosing verified account: change withdraw method to "Paysec account balance". 
---
### 4.5. Monthly AR withdrawals
**[Inerface mockups](link)**

At 10th day of each month for all agents with active Paysec withdraw method the system must:
1. Check self-employed status(*link to API method*).
2. For all confirmed self-employed agents create AR invoices in the Paysec(*link to API method*). Request parameters:
    + user: paysec user_id.
    + amount: `AR amount x 0.98`, round to 2 decimals.
    + invoice_number: {agency-id}-{invoice_date}.
    + invoice_date: last day of the previous month.
    + start_date: 1st day of the previous month.
    + end_date: end_date of the previous month. 
3. Sign all created invoices from our side(*link to API method*).
4. Pay all created invoices from the company balance in Paysec(*link to API method*).
---
## 5. Risks and countermeasures
| # | Risk | Countermeasure |
|---|------|----------------|
| 1 | Invoice creation for an agent with lost self-employed status. | Status check before the invoicing. | 

