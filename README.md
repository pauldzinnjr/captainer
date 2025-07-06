# captainer
Your container-savvy CLI companion to help you at the helm of your homelab. 

# 🧠 IT Mentor – FOSS Edition (v0.4.0)

This is version **v0.4.0** and is **not yet user-tested**.

---

**Captainer** is designed to be a reusable system prompt that you can even use on your iPhone with Terminus and Tailscale (a great way to manage your server on the go 😉). The original reason for this script is to leverage LLMs to manage servers, helping you learn server hosting best practices and benefit from a professionally built network.

## 🚀 Quick Start

1. **Install** the discovery script on each remote host (Linux/macOS/Windows).
2. **Run** the script (`captainer-discover.sh` or `captainer-discover.ps1`) to generate context.
3. **Copy** the contents of `captainer-core-prompt.md` into your LLM session.
4. **Paste** into the chat:
   - **Local Terminal Context** (e.g., “iPhone using Terminus via Tailscale SSH”)
   - **Host Info** (output from discovery script)
   - **Task / Goal** (e.g., “Install Nextcloud on my Proxmox VM”)

---

## 📦 What's in This Repo

| File                          | Purpose                                                            |
|-------------------------------|--------------------------------------------------------------------|
| `README.md`                   | You're reading it—install instructions & overview.                 |
| `captainer-core-prompt.md`    | The reusable prompt to paste into any LLM to start mentoring.      |
| `captainer-session-template.md` | Template for structuring each new session with Captainer.         |
| `captainer-discover.sh`       | POSIX shell script (Linux/macOS/BSD) that prints host info & saves to `captainer-context.txt`. |
| `captainer-discover.ps1`      | PowerShell script (Windows) that prints host info & saves to `captainer-context.txt`. |
| `LICENSE`                     | MIT License (recommended).                                         |

---

## 🛠️ Installation

### Linux / macOS

```bash
sudo mkdir -p /opt/captainer
sudo curl -fsSL https://YOUR_REPO_URL/captainer-discover.sh \
  -o /opt/captainer/captainer-discover.sh
sudo chmod +x /opt/captainer/captainer-discover.sh
sudo ln -sf /opt/captainer/captainer-discover.sh /usr/local/bin/captainer-discover

# Generate context
captainer-discover
```

### Windows PowerShell

```powershell
New-Item -Path 'C:\ProgramData\captainer' -ItemType Directory -Force
Invoke-WebRequest -Uri 'https://YOUR_REPO_URL/captainer-discover.ps1' `
  -OutFile 'C:\ProgramData\captainer\captainer-discover.ps1'
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Generate context
& 'C:\ProgramData\captainer\captainer-discover.ps1'
```

Each script will print a summary to your terminal and save context to:
- `~/captainer-context.txt` (Linux/macOS)
- `$env:USERPROFILE\captainer-context.txt` (Windows)

Paste the contents of that file into your chat window along with your local context and goal.

---

## 📚 License

This project is released under the [MIT License](LICENSE).

---

## 🧩 Example Use Case

```text
1. LOCAL TERMINAL CONTEXT:
   I’m on iPhone using Terminus with Tailscale SSH

2. HARDWARE & LLM DETAILS:
   Managing a Proxmox host and two Docker VMs via ChatGPT

3. REMOTE HOST CONTEXT:
   (Output of captainer-discover.sh or .ps1 and contents of captainer-context.txt)

4. TASK / GOAL:
   Install and harden a Docker container for Nextcloud
```

Your mentor will guide you step-by-step from here. Happy homelabbing!
```
