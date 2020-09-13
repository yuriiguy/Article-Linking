-- get digital science author last names
select
  id,
  ARRAY(select last_name from UNNEST(author_affiliations) where last_name is not null) as last_names
from gcp_cset_digital_science.dimensions_publications_latest
