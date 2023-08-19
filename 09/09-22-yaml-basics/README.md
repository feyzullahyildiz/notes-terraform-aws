## [<- Geri](../README.md)

# YAML Basics

- Key-Value
```yml
key: name
foo: bar
```
- Dictionary / Map
```yml
person:
    name: Feyz
    foo: bar
```
- Array / List
```yml
person:
    name: Feyz
    foo: bar
    hobies:                         # List
        - Cooking
        - Cycling
    hobies: [Cooking, Cycling]      # List
    friends:                        # Multiple List
        - name: friend1
          age: 21
        - name: friend2
          age: 22
--- # Document Separator WOW
apiVersion: v1

```