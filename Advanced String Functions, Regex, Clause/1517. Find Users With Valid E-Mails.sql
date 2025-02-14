Problem Link: https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50

SELECT *
FROM Users
WHERE mail REGEXP '(^[a-zA-Z][a-zA-Z0-9_.-]*)@leetcode\\.com$'
