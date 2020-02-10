import argparse

from google.cloud import bigquery

from utils import create_dataset, mk_tables


def get_sql_sequence(sql_sequence_file, dataset_name):
    table_queries = []
    for line in open(sql_sequence_file):
        if len(line.strip()) == 0:
            continue
        table_name, query_file = line.strip().split("\t")
        query_template = open(query_file).read().strip()
        query = query_template.replace("{DATASET}", dataset_name)
        table_queries.append((table_name, query))
    return table_queries


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("dataset_name")
    parser.add_argument("--sql_sequence_file", default="sequences/generate_metadata.tsv")
    args = parser.parse_args()

    client = bigquery.Client()
    # TODO: make a decision about how to handle recreating vs overwriting old datasets/tables
    create_dataset(args.dataset_name, client)

    sql_sequence = get_sql_sequence(args.sql_sequence_file, args.dataset_name)
    mk_tables(client, args.dataset_name, sql_sequence)
