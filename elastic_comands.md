# Elastic Comands

***
```bash
sudo service elasticsearch stop
```
_(cerrar el ES)_
```json
sudo service elasticsearch start
```
_(matar el ES sin docker)_

docker run -p 9200:9200 elasticsearch
(Iniciar el elasticsearch )

curl -X GET "localhost:9200/_cat/health?v"
(Ver tu cluster)

curl -X GET "localhost:9200/_cat/nodes?v"
(ver tus nodos)

curl -X PUT "localhost:9200/customer?pretty"
(crear un index, el index “customer”)

curl -X POST "localhost:9200/customer/_doc?pretty" -H 'Content-Type: application/json' -d'
{
  "name": "Jane Doe"
}
'
(agregar datos a un index sin ID)

curl -X PUT "localhost:9200/customer/employee/2?pretty" -H 'Content-Type: application/json' -d'
{
    "first_name" : "saul",
    "last_name" :  "Smith",
    "age" :        20,
    "about" :      "I love to go rock climbing",
    "interests": [ "sports", "music" ]
}
' 
(agregar datos a un index)(indexear)

curl -X GET "localhost:9200/megacorp/employee/1"
(consultar datos de un index especifico, type especifico y id del type especifico)

curl -X GET "localhost:9200/megacorp/employee/_search"
(hacer una busqueda en un index específico y type especifico)

curl -X GET "localhost:9200/megacorp/employee/_search?q=last_name:Smith" | jq
(primera manera)(Hacer querys con datos que pueden tener varios types )

curl -X GET "localhost:9200/megacorp/employee/_search?pretty" -H 'Content-Type: application/json' -d'
{
    "query" : {
        "match" : {
            "last_name" : "Smith"
        }
    }
}
'
(segunda manera)(Hacer querys con datos que pueden tener varios types )



curl -X GET "localhost:9200/megacorp/employee/_search?pretty"   -H 'Content-Type: application/json' -d'
{
    "query" : {
        "bool" : {
            "must" : {
                "match" : {
                    "last_name" : "smith"
                }
            },
            "filter" : {
                "range" : {
                    "age" : { "gt" : 30 }
                }
            }
        }
    }
}
'
(filtrar y hacer búsquedas)

curl -X GET "localhost:9200/megacorp/employee/_search?pretty" -H 'Content-Type: application/json' -d'
{
    "query" : {
        "match" : {
            "about" : "rock climbing"
        }
    }
}
'
(segunda manera)(Hacer querys con datos que pueden tener varios types con palabras clave)
curl -X GET "localhost:9200/megacorp/employee/_search" -H 'Content-Type: application/json' -d'
{
    "aggs" : {
        "all_interests" : {
            "terms" : { "field" : "interests" },
            "aggs" : {
                "avg_age" : {
                    "avg" : { "field" : "age" }
                }
            }
        }
    }
}
'


