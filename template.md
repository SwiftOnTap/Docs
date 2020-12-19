#  Documentation Template

1. Summary 
The first line of the documentation comment is the symbol's summary. The summary is 1 complete sentence with a period at the end. The summary sentence makes sense out of context (i.e. if the summary appears on another page). In general, the summary is as short as possible while fully explaining the essence of the symbol.

The summary is separated from the overview by one empty line.

2. Overview
The overview is a distinct section from the summary, and should make sense on its own. It should not rely on the summary as its first sentence.

Every symbol has an overview. The overview has up to 5 parts: 
1. The overview begins with a complete explanation of what the symbol does.

2. Explain any and all requirements of using the symbol.  For example, `makeBody` is a required property of the `ButtonStyle` protocol and should therefore be mentioned. If a struct has a singular initializer it can be metioned here, but if it has multiple initializers those should be reserved for the topics section. 

3. **A crystal clear & runnable example**. Each symbols has an example that clearly explains how to use it. The example can have several parts, but the most outer level structure must conform to the `View` protocol. 

4. (Optional) Explain any non-obvious details. For example, the `ButtonStyle` protocol is only used in conjunction with the `buttonStyle()` modifier. 

5. Helpful resources. These include web links to tutorials and references to other relavent symbols. 


- Rule A): You should use the personal pronoun "your" (i.e. your function), as well as command phrases (i.e. use this view). You should never the word "you" (i.e. if you want to) or the passive voice (i.e. the button is pressed).
    Incorrect:
        *If you want* to change the style of your `Button`, *you can* use the `View/buttonStyle(_:)` method.
    Incorrect:
        The `Button` style *is changed with* the `View/buttonStyle(_:)` method.
    Correct:
        **To change the style of your** `Button`, **use** the `View/ButtonStyle(_:)` method.


- Rule B): Any time you reference another symbol, you should make it a link. Links are specified using the usual `Symbol` notation, with backticks on each side. They also must specify the full path of the symbol, including any parent symbols in which it's declared. For example, if we have header code like this,

        protocol View {
            var body: some View { get }
        }
        
        extension View {
            func foregroundColor(_ color: Color) { ... }
        }
        
then a link to view is referenced by typing `View`, and links to body and foreground color are `View/body` and `View/foregroundColor(_:)`. We will provide an explicit path list for duplicative paths (i.e. `Text/init(_:)`).  The documentation parser will automatically know to display the words "body" and "foregroundColor(_:)" rather than the full path. 
    

- Rule C): **Do not write incorrect code**. **All** code examples must be run on a simulator before they are added to the documentation. All code examples should follow best practices. There should be no *errors* or *warnings*.


- Rule D): Examples should be designed for clarity.


- Rule E): Code examples should have no extra information beyond what the user needs to fully understand how to use the symbol.
    - Incorrect:
    
            struct BananaView: View {
                var body: some View {
                    VStack {
                        Button("🍌🍌") { print("banana") }
                        Button("🍎🍎") { print("apple") }
                        Button("🍑🍑") { print("peach") }
                    }
                    .buttonStyle(BananaButtonStyle(color: .yellow))
                }
            }
            
    - Correct:
    
            struct BananaView: View {
                var body: some View {
                    VStack {
                        Button("🍌🍌") 
                        Button("🍎🍎") 
                        Button("🍑🍑") 
                    }
                    .buttonStyle(BananaButtonStyle(color: .yellow))
                }
            }


- Rule F): Each variable, structure, function, and any other type that is necessary to understand the core concept of a symbol should be named after what they are trying to accomplish.  Strings should adhere to the Banana naming ruleset. 

 - Incorrect: BananaView should be "ExampleView""
 
         struct BananaView: View {
             var color: Color
             
             var body: some View {
                 Button("🍌🍌")
                    .foregroundColor(color)
             }
         }
         
- Incorrect: Hello world should be "🍌🍌"
         
         struct BananaView: View {
             var color: Color
             
             var body: some View {
                 Button("Hello World")
                    .foregroundColor(color)
             }
         }
         
- Incorrect: foo should be color
                  
          struct ExampleView: View {
              var foo: Color
              
              var body: some View {
                  Button("🍌🍌")
                      .foregroundColor(foo)
              }
          }

- Correct: 

        struct ExampleView: View {
            var color: Color
            
            var body: some View {
                Button("🍌🍌")
                    .foregroundColor(color)
            }
        }


- Rule G): All strings should use the "Banana", "Apple", "Peach" prefix nomenclature scheme. 

A symbol that requires a string, should follow: 
1. 🍌🍌
2. 🍏🍏
3. 🍑🍑


- Rule G2) All colors should follow the following scheme: 

1. `Color.orange` 
2. `Color.green` 
3. `Color.pink`


- Rule: Add helpful comments inside of example code blocks, especially in two cases:
    - Displaying the **exact** output of a print statement
    
            print(projectName) //"Banana🍌 Docs"
        
    - Displaying the value of a variable as it is assigned
        
            let linesInProject = module.sourceFile.lines //23,067


- Rule H): Example code does not need its language specified, since it is implied by the source code. Examples should also use code block tab-indent formatting rather than triple backtick (```) indenting:

Incorrect:
            
 ```swift
 struct BananaView {
     var child: String
}
```

Correct: 

    struct BananaView {
         var child: String
    }


- Rule I): When in doubt, write another example 


- Rule J): No paragraph should have more than 6 sentences. 


- Rule K): Every sentence should sound natural if spoken. 
