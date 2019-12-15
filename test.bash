# Get the external ip for your service
kubectl get services simple-jwt-api -o wide

# Test: Use the external ip url to test the app


# 1
curl -X GET <EXTERNAL-IP>

# 2 /auth
export TOKEN=`curl -d '{"email":"wolf@thedoor.com","password":"huff-puff"}' -H "Content-Type: application/json" -X POST <EXTERNAL-IP URL>/auth  | jq -r '.token'`

# 3
echo $TOKEN

# 4 /contents
curl --request GET '<EXTERNAL-IP URL>/contents' -H "Authorization: Bearer ${TOKEN}" | jq
# curl --request GET 'http://127.0.0.1:8080/contents' -H "Authorization: Bearer ${TOKEN}" | jq .

</code>

**Save the external IP from above to provide to the reviewer when you submit your project.**
