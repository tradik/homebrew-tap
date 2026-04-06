# tradik/homebrew-tap

Homebrew tap for [MDDB](https://github.com/tradik/mddb) — Markdown Database.

## Install

```bash
brew tap tradik/tap
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `mddb` | MDDB server daemon (`mddbd`) |
| `mddb-cli` | MDDB command-line client |
| `mddb-panel` | MDDB admin panel (static web UI) |

## Usage

### MDDB Server

```bash
brew install tradik/tap/mddb

# Run as service
brew services start tradik/tap/mddb

# Or run manually
mddbd
```

### MDDB CLI

```bash
brew install tradik/tap/mddb-cli

mddb --help
```

### MDDB Panel

```bash
brew install tradik/tap/mddb-panel

# Then run mddbd pointing to panel files:
mddbd --panel-dir $(brew --prefix tradik/tap/mddb-panel)
```

## Updating

```bash
brew update
brew upgrade tradik/tap/mddb
brew upgrade tradik/tap/mddb-cli
brew upgrade tradik/tap/mddb-panel
```
