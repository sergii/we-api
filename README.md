# words-api
Simple web API with 2 endpoints

To run app (5000 port):
```
foreman start
```


To parse string:
```
curl -d  'string=@Hi! My name is (what?), my name is (who?), my name is Slim Shady' http://localhost:5000/word_counter

```

To parse file:
```
curl -F 'file=@/home/user/repos/lemonade/words-api/public/files/alice.txt' http://localhost:5000/word_counter
```


To get word appearance:
```
curl http://localhost:5000/word_statistics\?word\=hello

```
