select a.id as {TABLE1}_id, m.id as {TABLE2}_id
from gcp_cset_links.{TABLE1}_metadata_norm a
inner join
gcp_cset_links.{TABLE2}_metadata_norm m
on ((a.year = m.year) and (a.year is not null) and
   (a.abstract_trunc_norm = m.abstract_trunc_norm) and
   (m.abstract_trunc_norm is not null) and (a.abstract_trunc_norm != ""))
