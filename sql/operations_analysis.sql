-- Operations Performance Analytics
-- Dataset: Synthetic service requests
-- Purpose: Analyse service performance, SLA compliance, and operating costs.


-- 1. Key performance indicators
SELECT
    COUNT(*) AS total_requests,
    COUNT(*) FILTER (
        WHERE status = 'Completed'
    ) AS completed_requests,
    COUNT(*) FILTER (
        WHERE status = 'In Progress'
    ) AS in_progress_requests,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    SUM(operating_cost) AS total_operating_cost
FROM service_requests;


-- 2. SLA compliance summary
SELECT
    COUNT(*) AS completed_requests,
    COUNT(*) FILTER (
        WHERE resolution_hours <= sla_target_hours
    ) AS sla_compliant_requests,
    COUNT(*) FILTER (
        WHERE resolution_hours > sla_target_hours
    ) AS sla_breaches,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE resolution_hours <= sla_target_hours
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS sla_compliance_percentage
FROM service_requests
WHERE status = 'Completed';


-- 3. SLA performance by location
SELECT
    location,
    COUNT(*) AS completed_requests,
    COUNT(*) FILTER (
        WHERE resolution_hours > sla_target_hours
    ) AS sla_breaches,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE resolution_hours <= sla_target_hours
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS sla_compliance_percentage
FROM service_requests
WHERE status = 'Completed'
GROUP BY location
ORDER BY sla_compliance_percentage ASC;


-- 4. SLA performance by team
SELECT
    team,
    COUNT(*) AS completed_requests,
    COUNT(*) FILTER (
        WHERE resolution_hours > sla_target_hours
    ) AS sla_breaches,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE resolution_hours <= sla_target_hours
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS sla_compliance_percentage
FROM service_requests
WHERE status = 'Completed'
GROUP BY team
ORDER BY sla_compliance_percentage ASC;


-- 5. Individual requests that breached SLA
SELECT
    request_id,
    request_date,
    location,
    service_type,
    team,
    priority,
    resolution_hours,
    sla_target_hours,
    resolution_hours - sla_target_hours AS hours_over_sla
FROM service_requests
WHERE status = 'Completed'
  AND resolution_hours > sla_target_hours
ORDER BY hours_over_sla DESC;


-- 6. SLA breach rate by service type
SELECT
    service_type,
    COUNT(*) AS completed_requests,
    COUNT(*) FILTER (
        WHERE resolution_hours > sla_target_hours
    ) AS sla_breaches,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE resolution_hours > sla_target_hours
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS sla_breach_percentage
FROM service_requests
WHERE status = 'Completed'
GROUP BY service_type
ORDER BY sla_breach_percentage DESC;


-- 7. Severity of SLA breaches
SELECT
    COUNT(*) AS total_sla_breaches,
    SUM(resolution_hours - sla_target_hours)
        AS total_hours_over_sla,
    ROUND(
        AVG(resolution_hours - sla_target_hours),
        2
    ) AS average_hours_over_sla,
    MAX(resolution_hours - sla_target_hours)
        AS largest_sla_breach_hours
FROM service_requests
WHERE status = 'Completed'
  AND resolution_hours > sla_target_hours;


-- 8. High-priority requests requiring attention
SELECT
    request_id,
    location,
    service_type,
    team,
    status,
    resolution_hours,
    sla_target_hours,
    CASE
        WHEN status = 'In Progress'
            THEN 'Outstanding'
        WHEN resolution_hours > sla_target_hours
            THEN 'SLA Breach'
        ELSE 'Within SLA'
    END AS attention_status
FROM service_requests
WHERE priority = 'High'
ORDER BY
    CASE
        WHEN status = 'In Progress' THEN 1
        WHEN resolution_hours > sla_target_hours THEN 2
        ELSE 3
    END,
    resolution_hours DESC;

