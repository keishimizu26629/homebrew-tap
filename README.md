# Homebrew Tap for keishimizu26629

This is a [Homebrew](https://brew.sh/) tap for CLI tools by keishimizu26629.

## Installation

```bash
# Add the tap
brew tap keishimizu26629/tap

# Install toggle-subdisplay
brew install toggle-subdisplay
```

## Available Formulas

### toggle-subdisplay

CLI to toggle Mac subdisplay settings between mirror and extended modes.

```bash
# Check current state
toggle-subdisplay --query

# Toggle between mirror and extended modes
toggle-subdisplay
```

**Requirements:**
- macOS 10.15+
- Internal display + 1 external display

## Usage

```bash
# Install
brew install keishimizu26629/tap/toggle-subdisplay

# Use
toggle-subdisplay -q    # Check state: "on" / "off" / "none"
toggle-subdisplay       # Toggle mode
```

## Repository

- **CLI Source**: [toggle-subdisplay](https://github.com/keishimizu26629/toggle-subdisplay)
- **Homebrew Tap**: [homebrew-tap](https://github.com/keishimizu26629/homebrew-tap)
