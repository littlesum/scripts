#/bin/sh
# this is a truenas api check script
#truenas api token
#1-i8tQ0guckADx1pbv4xsFwoP8vpmEUbq3Ztn1trOb8aZWApRDYhmFb4LzkBnyTpTU
#
curl -X POST -H "Authorization: Bearer token" \
 	"https://yourtruenas.com/api/v2.0/certificate" \ 
	 -k -vv -d '{"var1":data1,"var2":data2}
'
curl -X GET -H "Authorization: Bearer token" \
 	"https://yourtruenas.com/api/v2.0/alert/list" \ 
	-k 
