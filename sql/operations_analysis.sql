-- Operations Performance Analytics
-- Dataset: Synthetic service requests
-- Purpose: Analyse service performance, SLA compliance, and operating costs.

-- 1. Overall performance summary
SELECT
    COUNT(*) AS total_requests,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    SUM(operating_cost) AS total_operating_cost
FROM service_requests;

-- 2. SLA compliance and breaches
SELECT
    COUNT(*) AS total_requests,
    SUM(CASE
        WHEN resolution_hours <= sla_target_hours THEN 1
        ELSE 0
    END) AS requests_within_sla,
    SUM(CASE
        WHEN resolution_hours > sla_target_hours THEN 1
        ELSE 0
    END) AS sla_breaches,
    ROUND(
        100.0 * SUM(CASE
            WHEN resolution_hours <= sla_target_hours THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0),
        2
    ) AS sla_compliance_pct
FROM service_requests
WHERE status = 'Completed';

-- 3. Performance by location
SELECT
    location,
    COUNT(*) AS total_requests,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    SUM(operating_cost) AS total_operating_cost
FROM service_requests
GROUP BY location
ORDER BY total_requests DESC;

-- 4. Performance by team
SELECT
    team,
    COUNT(*) AS total_requests,
    SUM(CASE
        WHEN resolution_hours > sla_target_hours THEN 1
        ELSE 0
    END) AS sla_breaches,
    SUM(operating_cost) AS total_operating_cost
FROM service_requests
WHERE status = 'Completed'
GROUP BY team
ORDER BY sla_breaches DESC;

-- 5. Requests requiring attention
SELECT
    request_id,
    location,
    service_type,
    team,
    priority,
    resolution_hours,
    sla_target_hours,
    status
FROM service_requests
WHERE status <> 'Completed'
   OR (status = 'Completed'
       AND resolution_hours > sla_target_hours)
ORDER BY priority, resolution_hours DESC;
