#!/bin/zsh
## NEW POST

## 1. CATEGORY
cd posts
categories=($(ls -d */))
echo "----------------------------------------"
echo "1. Category?"
select category in "${categories[@]}"
do
  break
done

# remove the trailing slash
category=${category%/}

## 2. TITLE
echo "----------------------------------------"
vared -p "2. Title? " -c title

## 3. SLUG
slug0=${title:gs/ /-}
slug0=$( tr '[A-Z]' '[a-z]' <<< $slug0)
echo "----------------------------------------"
vared -p "3. Slug? (default:$slug0) " -c slug

if [[ -z "$slug" ]]; then
   slug=$slug0
fi

## 4. DATE
echo "----------------------------------------"
today=`date +%Y-%m-%d`
echo "4. Date = $today"

## OUTPUT
fname=$category/_posts/$today-$slug.md
cat <<EOF > $fname
---
layout      : post
title       : $title
date        : $today 00:00:00
permalink   : $slug.html
category    : $category
#has_excerpt : true
---
EOF

## OPEN
atom $fname
