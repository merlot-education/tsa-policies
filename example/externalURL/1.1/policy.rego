package example.externalURL

_ := http.send({
    "method": "post",
    "url": "https://vault.vereign.com/tsa/policy/policy/policies/example/resolve/1.0/evaluation",
    "body": {"did": "did:key:z6Mkfriq1MqLBoPWecGoDLjguo1sB9brj6wT3qZ5BxkKpuP6"}
})
