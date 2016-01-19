#!/bin/sh
wget http://www.goodreads.com/user/show/6403898.xml?key=ns4kzJMQkyXogLfo5OyZA -O goodreads.xml
python xml2json.py goodreads.xml -o goodreads.json

wget http://2pattes.tiborstanko.sk/api/read -O 2pattes.xml
python xml2json.py 2pattes.xml -o 2pattes.json