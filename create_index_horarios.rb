#!/bin/bash"
curl -XPUT --silent "localhost:9200/horas_v1?pretty" -H 'Content-Type: application/json' -d '
{
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas": 1
  },
  "mappings":{
  	"doc":{
  		"properties": {
           "date":{"type":"date",
           	"format" :  "yyyy-MM-dd"
           },
           "hours": {"type": "integer"}
  		}
  	}
  }'
