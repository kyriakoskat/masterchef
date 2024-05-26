1. 

SELECT 
    n.nationality_name,
    AVG(jr.total_rating) AS average_rating
FROM 
    chef c
JOIN 
    chef_expertise ce ON c.chef_id = ce.chef_id
JOIN 
    nationality n ON ce.nationality_id = n.nationality_id
JOIN 
    judge_rating jr ON c.chef_id = jr.chef_id
GROUP BY 
    n.nationality_id;

SELECT 
    c.chef_id,
    AVG(jr.total_rating) AS average_rating
FROM 
    chef c
JOIN 
    judge_rating jr ON c.chef_id = jr.chef_id
GROUP BY 
    c.chef_id;

2.

DELIMITER $$

CREATE PROCEDURE GetChefsByCuisineAndYear(IN cuisine_name VARCHAR(255), IN year INT)
BEGIN
    SET @start_episode = (year - 1) * 10 + 1;
    SET @end_episode = year * 10;

    SELECT c.first_name, c.last_name,
           IFNULL(GROUP_CONCAT(e.episode_id ORDER BY e.episode_id SEPARATOR ', '), 'No Participation') AS episodes_participated
    FROM chef c
    LEFT JOIN chef_expertise ce ON c.chef_id = ce.chef_id
    LEFT JOIN nationality n ON ce.nationality_id = n.nationality_id
    LEFT JOIN chef_participation cp ON c.chef_id = cp.chef_id
    LEFT JOIN episode e ON cp.episode_id = e.episode_id AND e.episode_id BETWEEN @start_episode AND @end_episode
    WHERE n.nationality_name = cuisine_name
    GROUP BY c.chef_id, c.first_name, c.last_name;
END$$

DELIMITER ;


3. 
SELECT c.chef_id, c.first_name, c.last_name, c.age, COUNT(DISTINCT cp.recipe_id) AS total_recipes
FROM chef c
JOIN chef_participation cp ON c.chef_id = cp.chef_id
WHERE c.age < 30
GROUP BY c.chef_id, c.first_name, c.last_name, c.age
ORDER BY total_recipes DESC;

4. 

SELECT c.chef_id, c.first_name, c.last_name
FROM chef c
LEFT JOIN judge_participation jp ON c.chef_id = jp.judge_id
WHERE jp.judge_id IS NULL;

5.
DELIMITER ;;
CREATE PROCEDURE q5(IN year int)
BEGIN
    SET @start_episode = (year - 1) * 10 + 1;
    SET @end_episode = year * 10;       
    SELECT judge_id, COUNT(episode_id) AS appearances
    FROM judge_participation
    WHERE episode_id BETWEEN @start_episode AND @end_episode
    GROUP BY judge_id
    HAVING appearances > 3
    ORDER BY appearances DESC;
END;;

DELIMITER ;

6. 
(xwris index)
SELECT rl1.label_id AS Label1, rl2.label_id AS Label2, COUNT(*) AS Frequency
FROM recipe_label rl1
JOIN recipe_label rl2 ON rl1.recipe_id = rl2.recipe_id AND rl1.label_id < rl2.label_id
JOIN chef_participation cp ON rl1.recipe_id = cp.recipe_id
GROUP BY Label1, Label2
ORDER BY Frequency DESC
LIMIT 3;

(me index)
ALTER TABLE label ADD INDEX idx_label_id (label_id);
CREATE INDEX idx_recipe_id_label ON recipe_label (recipe_id, label_id);
SELECT l1.label_name AS Label1, l2.label_name AS Label2, COUNT(*) AS Frequency
FROM recipe_label rl1 FORCE INDEX (idx_recipe_id_label)
JOIN recipe_label rl2 FORCE INDEX (idx_recipe_id_label) ON rl1.recipe_id = rl2.recipe_id AND rl1.label_id < rl2.label_id
JOIN label l1 FORCE INDEX (idx_label_id) ON rl1.label_id = l1.label_id
JOIN label l2 FORCE INDEX (idx_label_id) ON rl2.label_id = l2.label_id
JOIN chef_participation cp ON rl1.recipe_id = cp.recipe_id
GROUP BY Label1, Label2
ORDER BY Frequency DESC
LIMIT 3;

7.

CREATE INDEX idx_chef_id ON chef_participation(chef_id);
CREATE INDEX idx_chef_name ON chef(first_name, last_name);

SELECT c.chef_id, c.first_name, c.last_name
FROM chef c
JOIN (
    SELECT chef_id, COUNT(*) AS total_appearances
    FROM chef_participation
    GROUP BY chef_id
    ORDER BY total_appearances DESC
    LIMIT 1
) AS max_appearances ON c.chef_id <> max_appearances.chef_id
LEFT JOIN (
    SELECT chef_id, COUNT(*) AS total_appearances
    FROM chef_participation
    GROUP BY chef_id
) AS all_appearances ON c.chef_id = all_appearances.chef_id
WHERE max_appearances.total_appearances - COALESCE(all_appearances.total_appearances, 0) >= 5;

8. 

CREATE INDEX idx_episode_id ON chef_participation (episode_id);
CREATE INDEX idx_recipe_id ON recipe_equipment (recipe_id);
CREATE INDEX idx_equipment_id ON equipment (equipment_id);


SELECT ep.episode_id, COUNT(DISTINCT eq.equipment_id) AS equipment_count
FROM episode ep
JOIN chef_participation cp ON ep.episode_id = cp.episode_id
JOIN recipe_equipment re ON cp.recipe_id = re.recipe_id
JOIN equipment eq ON re.equipment_id = eq.equipment_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC
LIMIT 1;


SELECT ep.episode_id, COUNT(DISTINCT eq.equipment_id) AS equipment_count
FROM episode ep
JOIN chef_participation cp FORCE INDEX (idx_episode_id) ON ep.episode_id = cp.episode_id
JOIN recipe_equipment re FORCE INDEX (idx_recipe_id) ON cp.recipe_id = re.recipe_id
JOIN equipment eq FORCE INDEX (idx_equipment_id) ON re.equipment_id = eq.equipment_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC
LIMIT 1;


EXPLAIN SELECT ep.episode_id, COUNT(DISTINCT eq.equipment_id) AS equipment_count
FROM episode ep
JOIN chef_participation cp ON ep.episode_id = cp.episode_id
JOIN recipe_equipment re ON cp.recipe_id = re.recipe_id
JOIN equipment eq ON re.equipment_id = eq.equipment_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC
LIMIT 1;

EXPLAIN SELECT ep.episode_id, COUNT(DISTINCT eq.equipment_id) AS equipment_count
FROM episode ep
JOIN chef_participation cp FORCE INDEX (idx_episode_id) ON ep.episode_id = cp.episode_id
JOIN recipe_equipment re FORCE INDEX (idx_recipe_id) ON cp.recipe_id = re.recipe_id
JOIN equipment eq FORCE INDEX (idx_equipment_id) ON re.equipment_id = eq.equipment_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC
LIMIT 1;

9. 
WITH episode_years AS (
    SELECT 
        episode_id, 
        CEILING(episode_id / 10) AS year
    FROM episode
),
carb_per_episode AS (
    SELECT 
        cp.episode_id,
        di.carbohydrates
    FROM 
        chef_participation cp
    JOIN diet_info di ON cp.recipe_id = di.recipe_id
)
SELECT 
    ey.year,
    AVG(cpe.carbohydrates) AS avg_carbohydrates
FROM 
    episode_years ey
JOIN carb_per_episode cpe ON ey.episode_id = cpe.episode_id
GROUP BY 
    ey.year
ORDER BY 
    ey.year;

10. 
WITH episode_years AS (
    SELECT 
        episode_id, 
        CEILING(episode_id / 10) AS year
    FROM episode
),
participations_per_year AS (
    SELECT 
        ey.year,
        cp.nationality_id,
        COUNT(*) AS participation_count
    FROM 
        episode_years ey
    JOIN chef_participation cp ON ey.episode_id = cp.episode_id
    GROUP BY 
        ey.year, cp.nationality_id
),
filtered_participations AS (
    SELECT 
        * 
    FROM 
        participations_per_year 
    WHERE 
        participation_count >= 3
),
consecutive_years AS (
    SELECT 
        fp1.nationality_id,
        fp1.year AS year1,
        fp1.participation_count AS count1,
        fp2.year AS year2,
        fp2.participation_count AS count2
    FROM 
        filtered_participations fp1
    JOIN filtered_participations fp2 
        ON fp1.nationality_id = fp2.nationality_id
        AND fp1.year = fp2.year - 1
)
SELECT 
    n.nationality_name
FROM 
    consecutive_years cy
JOIN nationality n ON cy.nationality_id = n.nationality_id
WHERE 
    cy.count1 = cy.count2;

11. 
SELECT 
    j.first_name AS judge_name,
    c.first_name AS chef_name,
    SUM(jr.rating) AS total_score
FROM 
    judge_rating_with_judges jr
JOIN 
    judge j ON jr.judge_id = j.judge_id
JOIN 
    chef c ON jr.chef_id = c.chef_id
GROUP BY 
    jr.judge_id, jr.chef_id
ORDER BY 
    total_score DESC
LIMIT 5;


12. 
WITH episode_years AS (
    SELECT 
        episode_id, 
        CEILING(episode_id / 10) AS year
    FROM episode
),
episode_difficulty AS (
    SELECT
        ep.episode_id,
        ey.year,
        AVG(r.difficulty_level) AS avg_difficulty
    FROM 
        chef_participation cp
    JOIN recipe r ON cp.recipe_id = r.recipe_id
    JOIN episode_years ey ON cp.episode_id = ey.episode_id
    JOIN episode ep ON cp.episode_id = ep.episode_id
    GROUP BY ep.episode_id, ey.year
),
ranked_episodes AS (
    SELECT
        year,
        episode_id,
        avg_difficulty,
        RANK() OVER (PARTITION BY year ORDER BY avg_difficulty DESC) AS difficulty_rank
    FROM 
        episode_difficulty
)
SELECT 
    re.year,
    re.episode_id,
    re.avg_difficulty
FROM 
    ranked_episodes re
WHERE 
    re.difficulty_rank = 1
ORDER BY 
    re.year;

13. 

WITH chef_training AS (
    SELECT
        cp.episode_id,
        AVG(tlp.training_level_position_id) AS avg_chef_training
    FROM
        chef_participation cp
    JOIN
        chef c ON cp.chef_id = c.chef_id
    JOIN
        training_level_position tlp ON c.training_level = tlp.training_level
    GROUP BY
        cp.episode_id
),
judge_training AS (
    SELECT
        jp.episode_id,
        AVG(tlp.training_level_position_id) AS avg_judge_training
    FROM
        judge_participation jp
    JOIN
        judge j ON jp.judge_id = j.judge_id
    JOIN
        training_level_position tlp ON j.training_level = tlp.training_level
    GROUP BY
        jp.episode_id
),
episode_training AS (
    SELECT
        ct.episode_id,
        (ct.avg_chef_training + jt.avg_judge_training) / 2 AS avg_training_level
    FROM
        chef_training ct
    JOIN
        judge_training jt ON ct.episode_id = jt.episode_id
)
SELECT
    et.episode_id,
    et.avg_training_level
FROM
    episode_training et
ORDER BY
    et.avg_training_level ASC
LIMIT 1;

14. 

SELECT u.unit_name, COUNT(*) AS appearance_count
FROM units u
JOIN recipe_unit ur ON u.unit_id = ur.unit_id
JOIN chef_participation cp ON ur.recipe_id = cp.recipe_id
GROUP BY u.unit_name
ORDER BY appearance_count DESC
LIMIT 1;

15. 

SELECT ft.food_type_name
FROM food_type ft
WHERE ft.food_type_name NOT IN (
    SELECT DISTINCT ft.food_type_name
    FROM food_type ft
    JOIN ingredients i ON ft.food_type_id = i.food_type_id
    JOIN recipe_ingredient ri ON i.ingredient_name = ri.ingredient_name
    JOIN recipe r ON ri.recipe_id = r.recipe_id
    JOIN chef_participation cp ON r.recipe_id = cp.recipe_id
)
GROUP BY ft.food_type_name;