# oMACase

oMACase is an opinionated setup of macOS, hugely influenced by Omakub, [Omarchy](https://github.com/basecamp/omarchy) and [Omamac](https://github.com/omacom-io/omamac)

It has been created to meet my needs. It might be useful to you but I would strongly suggest you fork your own version and make it yours.

I will make changes as I my needs require, at times without backwards compatibility. Again, if you think this repo will be useful, take your own fork, make it yours and keep control.

## Manual Steps

### Custom Root CA's

I often sit behind corporate firewalls/proxys that intercept HTTPS requests. Whilst most apps use the certificate chains in keychain, VS Code CLI (and Homebrew VS Code extension installs) need custom ca certs provided.

**Before** running the `install.sh` file, you should export the relevant root CAs to `~/.custom-ca-certificates.pem` (`chrome://settings/security` is our friend here)

Some of the applications and macOS settings cannot be automated. The following steps are needed to finish the setup of a new system

### Raycast

1. Disable `Cmd + Space` opening spotlight (We'll launch Raycast instead). System Preferences --> Keyboard --> Keyboard Shortcuts --> Spotlight
2. Disable the Convert to Chinese shortcuts (These can interfere with the Hyper Key config). System Preferences --> Keyboard --> Keyboard Shortcuts --> Services --> Text
3. Open Raycast and configure it to open on login
4. Ensure you grant Raycast access to your files and folders and Accessibility (required for Hyper key)
5. Import the Raycast config from `~/.config/raycast`

## Usage

### Raycast

| Hotkey | Action |
| ------ | ------ |
| `Left Cmd + Space` | Launcher |
| `Right Cmd` | Hyper (`Ctrl + Option + Shift + Command`) |
| `Hyper + Return` | Launch Ghostty |
| `Hyper + Space` | Launch Browser (MS Edge) |

## License

OmacASE is released under the [MIT License](https://opensource.org/license/MIT)
