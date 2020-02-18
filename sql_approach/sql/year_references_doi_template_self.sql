select a.id as {TABLE1}1_id, m.id as {TABLE2}2_id
from gcp_cset_links.{TABLE1}_metadata_norm a
inner join
gcp_cset_links.{TABLE2}_metadata_norm m
on ((a.year = m.year) and (a.year is not null) and
    (a.references = m.references) and (a.references is not null) and (a.references != "") and
    (a.clean_doi = m.clean_doi) and (a.clean_doi is not null) and (a.clean_doi != ""))