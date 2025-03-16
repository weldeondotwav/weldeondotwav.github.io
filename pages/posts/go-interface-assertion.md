---
page-description: "a handy go snippet"
page-title: "explicitly assert interface implementation in go"
page-date: 2025-03-16
---

# a little peace of mind

go doesn't give a way to explicitly say that a struct should implement an interface.
this isn't *really* a problem.... if you try to use a struct that doesn't implement the correct interface, you do indeed get an error:

```go
type ExampleInterface interface {
	doSomething(input string) error
}

type exampleStruct struct{}

func useInterface(x ExampleInterface) {
	x.doSomething("hello")
}

func main() {
	inst := exampleStruct{}
	useInterface(inst) // ... exampleStruct does not implement ExampleInterface (missing method doSomething)
}
```

sometimes though I know I want my type to implement some interface before I've ever consumed it (don't yell at me for this)

something to document that a struct should implement an interface in the code, but have it be more........  

sturdy?

i stumbled across something for this online a while back and have been using it here and there since:

```go
var _ ExampleInterface = (*exampleStruct)(nil)
```

this allows you to declare that interface implementation and let the compiler throw an error at you until you've done it, before you've even tried to use the struct.

```go
type ExampleInterface interface {
	doSomething(input string) error
}

type exampleStruct struct{}
// *exampleStruct does not implement ExampleInterface (missing method doSomething)
var _ ExampleInterface = (*exampleStruct)(nil)

```

this is especially handy if you have [goimpl](https://github.com/sasha-s/goimpl), vscode will give you a quick-action on the error to generate stubs for the interface on your struct.