# Operations Performance Analytics

## Project Overview

This project demonstrates how data analytics can support operational decision-making through service performance monitoring, SLA compliance analysis, cost analysis, and identification of requests requiring attention.

The project uses a **synthetic service-request dataset** created for portfolio and learning purposes. All records are fictional and do not represent actual company or client data.

## Business Problem

Service organisations need clear visibility into how efficiently requests are handled, whether service-level targets are being met, how performance varies across locations and teams, and where operational attention may be required.

This project explores how structured data analysis can help answer these questions.

## Project Objectives

- Measure overall service-request volumes and average resolution time.
- Assess SLA compliance and identify breaches.
- Compare operational performance across locations and teams.
- Examine operating costs.
- Identify incomplete requests and completed requests that exceeded their SLA targets.
- Translate analytical findings into practical operational recommendations.

## Tools and Technologies

- **CSV:** Dataset storage and organisation.
- **SQL:** Data aggregation, conditional logic, grouping, filtering, and performance analysis.
- **Power BI:** Planned interactive dashboard and KPI visualisation.
- **Excel / Power Query:** Planned data inspection and transformation.

## Repository Structure

- `data/service_requests.csv` — Synthetic service-request records.
- `sql/operations_analysis.sql` — SQL queries for operational performance analysis.
- `README.md` — Project overview, objectives, and documentation.

## Key Performance Indicators

The planned analysis covers:

- Total service requests.
- Average resolution time.
- SLA compliance percentage.
- Number of SLA breaches.
- Operating costs.
- Performance by location and team.
- Outstanding requests requiring follow-up.

## Methodology

1. Prepare and inspect the synthetic dataset.
2. Validate the fields and confirm the definitions of relevant KPIs.
3. Analyse performance using SQL.
4. Identify patterns, exceptions, and areas requiring further investigation.
5. Develop a Power BI dashboard to communicate the findings.
6. Document evidence-based recommendations.

## Expected Deliverables

- Synthetic dataset.
- SQL analysis scripts.
- Interactive performance dashboard.
- Summary of findings and operational recommendations.

## Important Note

This is a portfolio project built with fictional data. Findings and recommendations will be documented after the analysis has been executed and validated.

## Key Findings

*This project uses a fictional service-request dataset created for analytical demonstration.*

### Overall Operational Performance

- Total requests: 20
- Completed requests: 18
- In-progress requests: 2
- Average recorded resolution time: 13.45 hours
- Total recorded operating cost: 233,500 cost units

### SLA Compliance

Of the 18 completed requests, 13 were resolved within their SLA targets, while 5 exceeded their targets. Overall SLA compliance was **72.22%**.

The five breaches accumulated 14 hours beyond their SLA targets, averaging 2.8 hours per breached request. The largest individual delay was 5 hours.

### Performance by Location

- **Lagos:** 57.14% SLA compliance, with 3 breaches among 7 completed requests.
- **Ibadan:** 80.00% SLA compliance, with 1 breach among 5 completed requests.
- **Abuja:** 83.33% SLA compliance, with 1 breach among 6 completed requests.

Lagos had the lowest SLA compliance and accounted for 60% of all recorded breaches.

### Performance by Team

- **Team A:** 66.67% SLA compliance; 2 breaches among 6 completed requests.
- **Team B:** 66.67% SLA compliance; 2 breaches among 6 completed requests.
- **Team C:** 83.33% SLA compliance; 1 breach among 6 completed requests.

Teams A and B had the lowest recorded compliance rates.

### Performance by Service Type

- **Maintenance:** 40.00% breach rate, with 2 breaches among 5 completed requests.
- **Inspection:** 25.00% breach rate, with 1 breach among 4 completed requests.
- **Technical Support:** 25.00% breach rate, with 1 breach among 4 completed requests.
- **Installation:** 20.00% breach rate, with 1 breach among 5 completed requests.

Maintenance had the highest recorded breach rate.

### Recommendations

1. Investigate the causes of SLA breaches in Lagos, including workload, resource availability, scheduling, and handover processes.
2. Review the maintenance workflow and identify potential sources of delay.
3. Examine the breached requests handled by Teams A and B to determine whether additional support or process changes are warranted.
4. Monitor SLA compliance by location, team, and service type over time.
5. Introduce a structured exception-tracking process to document breach causes, corrective actions, owners, and resolution dates.

### Limitations

The dataset contains only 20 fictional records. The findings demonstrate SQL analysis and operational reasoning; they are not evidence of actual business performance. The results identify areas for further investigation but do not establish the causes of the observed breaches.

## Tools and Skills Demonstrated

- PostgreSQL and SQL
- Data validation and aggregation
- SLA and KPI calculations
- Conditional filtering and grouping
- Operational exception analysis
- Evidence-based recommendations


## Author

**Kemi Mathew**  
Operations and Data Analytics

[GitHub Profile](https://github.com/oluwakemimathew01-cpu)

