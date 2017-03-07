# docker-hbase-standalone

## Build

```
docker build -t quay.io/pires/docker-hbase-standalone:1.3.0 .
```

## Usage

```
docker run --name hbase -d -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 quay.io/pires/docker-hbase-standalone:1.3.0
```
