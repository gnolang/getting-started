package hello

import (
	"strings"
	"testing"
)

func TestSetAndGet(cur realm, t *testing.T) {
	// Test initial state
	if got := Get(); got != "Hello, Gno!" {
		t.Errorf("Expected default message, got %s", got)
	}

	// Test setting a new message
	Set(cross(cur), "Hello, Test!")
	if got := Get(); got != "Hello, Test!" {
		t.Errorf("Expected 'Hello, Test!', got %s", got)
	}
}

// Render is the realm's entire public surface — it is what gnoweb calls for
// every page view — so always have a test that actually calls it. A realm with
// an untested Render only fails once it is on-chain.
func TestRender(t *testing.T) {
	out := Render("")
	if !strings.Contains(out, Get()) {
		t.Errorf("Render() should show the message %q, got:\n%s", Get(), out)
	}
}
