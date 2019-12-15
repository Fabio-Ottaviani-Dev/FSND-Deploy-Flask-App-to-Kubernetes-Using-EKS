# Get the external ip for your service
kubectl get services simple-jwt-api -o wide
# NAME             TYPE           CLUSTER-IP       EXTERNAL-IP                                                               PORT(S)        AGE   SELECTOR
# simple-jwt-api   LoadBalancer   10.100.205.118   a6dca99be1f7411ea9afa0ef7fb7c509-1833669863.us-west-2.elb.amazonaws.com   80:30613/TCP   10m   app=simple-jwt-api


# Test: Use the external ip url to test the app
# 1
curl -X GET 10.100.205.118:8080

# 2 /auth
export TOKEN=`curl -d '{"email":"wolf@thedoor.com","password":"huff-puff"}' -H "Content-Type: application/json" -X POST 10.100.205.118/auth  | jq -r '.token'`

# 3
echo $TOKEN

# 4 /contents
curl --request GET '<EXTERNAL-IP URL>/contents' -H "Authorization: Bearer ${TOKEN}" | jq
# curl --request GET 'http://127.0.0.1:8080/contents' -H "Authorization: Bearer ${TOKEN}" | jq .

</code>

**Save the external IP from above to provide to the reviewer when you submit your project.**
