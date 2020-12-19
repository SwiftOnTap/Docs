# ButtonStyle

This protocol is used to create a custom button style.

The `ButtonStyle` protocol provides a template to create a reusable style for your buttons. It also provides data about the button and its interaction state.

To make a custom style, create a new structure that conforms to `ButtonStyle`. Your structure only needs to implement one method: `PrimitiveButtonStyle/makeBody(configuration:)`. This new style can be easily reused across your application. The style adapts to the user's current interaction state (i.e. on press, on release).

To change the style of your `Button`, use the `View/buttonStyle(_:)` method. This method accepts a `ButtonStyle`.


    struct ExampleView: View {
        var body: some View {
            Button("🍌🍌")
                .buttonStyle(MyButtonStyle(color: .orange))
        }
    }

    struct MyButtonStyle: ButtonStyle {
        var color: Color
        func makeBody(configuration: Self.Configuration) -> some View {
            ConfiguredButton(configuration: configuration, color: color)
        }
        
        struct ConfiguredButton: View {
            let configuration: MyButtonStyle.Configuration
            let color: Color
            
            var body: some View {
                configuration.label
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(color))
            }
        }
    }


Button style applies to all buttons within a view hierarchy. For example, you could apply `ButtonStyle` to a `VStack`. 


    struct ExampleView: View {
        var body: some View {
            VStack {
                Button("🍌🍌")
                Button("🍏🍏")
                Button("🍑🍑")
            }
            .buttonStyle(MyButtonStyle(color: .orange))
        }
    }

    struct MyButtonStyle: ButtonStyle {
        var color: Color
        func makeBody(configuration: Self.Configuration) -> some View {
            ConfiguredButton(configuration: configuration, color: color)
        }
        
        struct ConfiguredButton: View {
            let configuration: MyButtonStyle.Configuration
            let color: Color
            
            var body: some View {
                configuration.label
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(color))
            }
        }
    }


For more on how to customize your button style body, check out `PrimitiveButtonStyle/makeBody(configuration:)`.
