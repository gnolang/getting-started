package hello

// message is a global variable that stores the message to be displayed.
var message string = "Hello, Gno!"

// Render is used by gnoweb to display dynamic content.
func Render(path string) string {
	return `# ` + message + `

This is a simple Gno realm that demonstrates basic functionality.
Try it out with gnokey:

	gnokey add myaccount
	gnokey list

[And click here](/r/demo/hello$help&func=Set&newMsg=Hello%20from%20Gnokey!)
	`
}

func Set(newMsg string) {
	// update the 'message' global variable stored in the realm's state.
	message = newMsg
}

func Get() string {
	return message
}

// Try it yourself! With gnodev (make dev) running, you can modify this file
// and see your changes instantly in the browser. For example, try changing
// the initial message above or adding new functions!
