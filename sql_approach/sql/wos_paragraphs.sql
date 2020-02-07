SELECT id, STRING_AGG(paragraph_text, "\n" ORDER BY CAST(paragraph_id AS INT64) ASC) as abstract
FROM gcp_cset_clarivate.wos_abstract_paragraphs_latest
WHERE abstract_id = "1"
GROUP BY id;