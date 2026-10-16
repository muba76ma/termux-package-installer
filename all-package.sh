


#!/data/data/com.termux/files/usr/bin/bash

# Colors
R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
B='\033[0;34m'
C='\033[0;36m'
N='\033[0m'

clear
echo -e "${C}"
cat << "EOF"
  ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝
     ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ 
     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ 
     ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝
EOF
echo -e "${N}"
echo -e "\( {Y}        Improved Termux Package Installer \){N}"
echo -e "\( {B}              by muba76ma \){N}\n"
sleep 1

install_pkg() {
    printf "\( {B}[+] %-20s \){N}" "$1"
    if pkg install -y "$1" > /dev/null 2>&1; then
        echo -e "\( {G}✓ \){N}"
    else
        echo -e "\( {R}✗ \){N}"
    fi
}

# 1. Update
echo -e "\( {Y}[1/5] Updating & Upgrading... \){N}"
pkg update -y && pkg upgrade -y
echo -e "\( {G}✓ Done \){N}\n"

# 2. Essentials
echo -e "\( {Y}[2/5] Installing Essentials... \){N}"
for p in git curl wget nano vim zip unzip tar proot proot-distro termux-api termux-tools; do
    install_pkg "$p"
done
echo

# 3. Programming
echo -e "\( {Y}[3/5] Installing Programming Tools... \){N}"
for p in python python-pip clang make cmake nodejs golang rust ruby php openjdk-17; do
    install_pkg "$p"
done
echo

# 4. Extra Tools
echo -e "\( {Y}[4/5] Installing Extra Tools... \){N}"
for p in htop neofetch tree jq bat fd ripgrep fzf tmux screen openssh nmap; do
    install_pkg "$p"
done
echo

# 5. Python packages
echo -e "\( {Y}[5/5] Installing Python packages... \){N}"
pip install --upgrade pip > /dev/null 2>&1
for p in requests colorama pyfiglet mechanize rich tqdm; do
    printf "\( {B}[+] pip %-15s \){N}" "$p"
    if pip install "$p" > /dev/null 2>&1; then
        echo -e "\( {G}✓ \){N}"
    else
        echo -e "\( {R}✗ \){N}"
    fi
done

# Finish
clear
echo -e "\n${G}╔════════════════════════════════════════╗"
echo -e "║      Installation Complete! ✓          ║"
echo -e "╚════════════════════════════════════════╝${N}\n"

echo -e "\( {C}What was installed: \){N}"
echo -e "  • Essentials      → git, curl, vim, proot, termux-api..."
echo -e "  • Programming     → Python, Node, Go, Rust, Java, PHP..."
echo -e "  • Tools           → htop, neofetch, nmap, fzf, tmux..."
echo -e "  • Python libs     → requests, rich, colorama, pyfiglet...\n"

echo -e "\( {Y}Useful next steps: \){N}"
echo -e "  termux-setup-storage          # Storage access"
echo -e "  pkg install x11-repo          # For GUI apps"
echo -e "  pkg search <name>             # Find more packages\n"

echo -e "${R}Repo: \( {Y}https://github.com/muba76ma/termux-package-installer \){N}\n"
