    SELECT
        skills.skill_id,
        skills.skills,

        COUNT(*) as skill_count
    FROM
        skills_job_dim as skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    INNER JOIN skills_dim AS skills ON skills.skill_id = skills_to_job.skill_id

    WHERE
        job_postings.job_work_from_home = True AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skills.skill_id,skills.skills
    ORDER BY
    skill_count DESC
    LIMIT 5


SELECT
    skills.skill_id,
    skills.skills,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5