package example.examplePolicy

default allow = false

allow{
    input.message == "example"
}
