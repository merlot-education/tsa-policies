package example.cacheEvent

default success = false

result := cache.get(input.key, input.namespace, input.scope)
resultKey := "resultKey"
resultNamespace := "resultNamespace"
resultScope := "resultScope"

success = true {
    msg := cache.set(resultKey, resultNamespace, resultScope, result)
    msg == "success"
}
