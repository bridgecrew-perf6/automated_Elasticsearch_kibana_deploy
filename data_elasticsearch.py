from datetime import datetime
from elasticsearch import Elasticsearch
from env import *

es = Elasticsearch(['http://10.255.255.88:9200'],
                   http_auth=(elastic_user, elastic_password))

doc = {
    "Host": "localhost:8000",
    "IP": "127.0.0.1",
    "DS_Usuario": "anonymous",
    "SQ_Usuario": "None",
    "Path": "/comercial/lista_atributo",
    "Modulo": "comercial",
    "Endpoint": "lista_atributo",
    "Inicio": "05/26/2022, 16:06:51",
    "Termino": "05/26/2022, 16:06:51"
}
res = es.index(index=index_name, body=doc)
print(res['result'])

res = es.get(index=index_name, id=1)
print(res['_source'])

es.indices.refresh(index=index_name)

res = es.search(index=index_name, body={"query": {"match_all": {}}})
print("Got %d Hits:" % res['hits']['total']['value'])
for hit in res['hits']['hits']:
    print(hit)
