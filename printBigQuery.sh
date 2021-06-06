SELECT
  category,
  COUNT(*) c
FROM
  `qwiklabs-gcp-00-b52ab1664a9d.news_classification_dataset.article_data`
GROUP BY
  category
ORDER BY
  c DESC

