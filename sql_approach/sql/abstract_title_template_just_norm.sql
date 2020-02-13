select a.id as {TABLE1}_id, m.id as {TABLE2}_id
from gcp_cset_links.{TABLE1}_metadata_norm a
inner join
gcp_cset_links.{TABLE2}_metadata_norm m
on ((a.title_norm = m.title_norm) and (a.title_norm is not null) and (a.title_norm != "") and
   (a.abstract_norm = m.abstract_norm) and
   (m.abstract_norm is not null) and (a.abstract_norm != ""))
