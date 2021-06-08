bq query 'SELECT locale,COUNT(locale) as lcount FROM image_classification_dataset.image_text_detail GROUP BY locale ORDER BY lcount DESC'
