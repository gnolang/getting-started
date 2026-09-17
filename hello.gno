package hello

// message is a global variable that stores the message to be displayed.
var message string = "Hello, Gno!"

// Render is used by gnoweb to display dynamic content.
func Render(path string) string {
	return `# ` + message + `

This page is what Render returns. Edit hello.gno while "make dev" is running
and it reloads with your change.

Add $help to this page's URL to call Set from your browser.
`
}

func Set(_ realm, newMsg string) {
	// update the 'message' global variable stored in the realm's state.
	message = newMsg
}

func Get() string {
	return message
}

// Try it yourself! With gnodev (make dev) running, you can modify this file
// and see your changes instantly in the browser. For example, try changing
// the initial message above or adding new functions!
