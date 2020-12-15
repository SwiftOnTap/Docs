#  Documentation Template

1. Summary 
The first line of the file is the symbol's summary. The summary is 1 complete sentence with a period at the end. The summary sentence makes sense out of context (i.e. if the summary appears on another page). In general, the summary is as short as possible while fully explaining the essence of the symbol.

The summary is the first line of the documentation comment, and it's separated from the overview by one empty line.

2. Overview
The overview is a distinct section from the summary, and should make sense on its own. It should not rely on the summary as its first sentence.

Every symbol has an overview. The overview has 6 parts: 
1. The overview begins with a complete explanation of what the symbol does.

2. Explain any and all requirements of using the symbol.

3. (Optional) Explain any implementation needed to use the symbol. For example, clearly identify required properties to initialize a struct. 

4. **A crystal clear & runnable example**. All examples should either compile into a view, or a command line output. 

5. (Optional) Explain any non-obvious details. For example, `buttonStyle` can both inherit from an individual view or from a view hierarchy. A view heirarchy example should be included. 

6. Helpful resources. These include web links to tutorials and references to other relavent symbols. 


- Rule: You should use the personal pronoun "your" (i.e. your function), as well as command phrases (i.e. use this view). You should never the word "you" (i.e. if you want to) or the passive voice (i.e. the button is pressed).
    Incorrect:
        *If you want* to change the style of your `Button`, *you can* use the `View/buttonStyle(_:)` method.
    Incorrect:
        The `Button` style *is changed with* the `View/buttonStyle(_:)` method.
    Correct:
        **To change the style of your** `Button`, **use** the `View/ButtonStyle(_:)` method.


- Rule: Any time you reference another symbol, you should make it a link. Links are specified using the usual `Symbol` notation, with backticks on each side. They also must specify the full path of the symbol, including any parent symbols in which it's declared. For example, if we have header code like this,

        protocol View {
            var body: some View { get }
        }
        
        extension View {
            func foregroundColor(_ color: Color) { ... }
        }
        
then a link to view is referenced by typing `View`, and links to body and foreground color are `View/body` and `View/foregroundColor(_:)`. The documentation parser will automatically know to display the words "body" and "foregroundColor(_:)" rather than the full path. 
    

- Rule: **Do not write incorrect code**. **All** code examples must be run on a simulator before they are added to the documentation.


- Rule: Examples should be designed for clarity.


- Rule: Code examples should have no extra information beyond what the user needs to fully understand how to use the symbol.
    - Incorrect:
    
            struct BananaView: View {
                var body: some View {
                    VStack {
                        Button("🍌🔥") { print("banana") }
                        Button("🍎🔥") { print("apple") }
                        Button("🍑🔥") { print("peach") }
                    }
                    .buttonStyle(BananaButtonStyle(color: .yellow))
                }
            }
            
    - Correct:
    
            struct BananaView: View {
                var body: some View {
                    VStack {
                        Button("🍌🔥") 
                        Button("🍎🔥") 
                        Button("🍑🔥") 
                    }
                    .buttonStyle(BananaButtonStyle(color: .yellow))
                }
            }


- Rule: Each variable, structure, function, and any other type that is necessary to understand the core concept of a symbol should be given a clear and distinct name. That name should describe its particular purpose in the specific context where it is declared. Any type that is not central to the core idea of the symbol, should employ the "Banana"+Type naming convention. See the Banana naming convention section for more. 
 - Incorrect: ExampleView should be "BananaView""
 
         struct ExampleView: View {
             var color: Color
             
             var body: some View {
                 Button("🍌🔥")
                    .foregroundColor(color)
             }
         }
         
- Incorrect: Hello world should be "🍌🔥"
         
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
                  Button("🍌🔥")
                      .foregroundColor(foo)
              }
          }

- Correct: 

        struct BananaView: View {
            var color: Color
            
            var body: some View {
                Button("🍌🔥")
                    .foregroundColor(color)
            }
        }


- Rule: All naming not central to the core idea of the symbol at hand should use the "Banana", "Apple", "Peach" prefix nomenclature scheme. The suffix is always the type. An example would include BananaView, or PeachApp. 

A symbol that requires a string, should follow: 
1. 🍌🍌
2. 🍎🍎
3. 🍑🍑

A symbol that requires a name, should follow:
1. Banana
2. Apple 
3. Peach 

A symbol that requires a color, should follow: 
1. `Color.yellow` 
2. `Color.red` 
3. `Color.orange`


- Rule: Comments can be very useful inside of example code blocks, especially in two cases:
    - Displaying the **exact** output of a print statement
    
            print(projectName) //"Banana Docs"
        
    - Displaying the value of a variable as it is assigned
        
            let linesInProject = module.sourceFile.lines //23,067


- Rule: Example code does not need its language specified, since it is implied by the source code. Examples should also use code block tab-indent formatting rather than triple backtick (```) indenting:

Incorrect:
            
/// ```swift
/// struct BananaView {
///     var child: String
/// }
/// ```

Correct: 

///     struct BananaView {
///         var child: String
///     }


- Rule: When in doubt, write another example 


- Rule: No paragraph has more than 6 sentences. 


- Rule: Use `var` and `let` properly. 
