#!/bin/bash

# Sair se qualquer comando falhar
set -e

echo "Iniciando a configuração do ambiente..."

# 1. Atualizar repositórios
sudo apt update

# 2. Instalar Git e ferramentas de rede (Melhor via APT)
echo "Instalando Git e ferramentas essenciais..."
sudo apt install -y git curl build-essential libssl-dev

# 3. Instalar VS Code (Melhor via Flatpak no Zorin)
echo "Instalando VS Code via Flatpak..."
flatpak install flathub com.visualstudio.code -y

# 4. Instalar Node.js via NVM (Melhor para evitar conflitos de permissão)
# Isso permite gerenciar versões do Node sem usar 'sudo' no npm
echo "Instalando NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Carregar NVM para uso imediato no script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "Installing Node.js LTS..."
nvm install --lts

# 5. Configurar React e React Native (CLI global)
echo "Configurando ambiente React e React Native..."
npm install -g tree-kill # Util para alguns processos de build
npm install -g expo-cli  # Recomendado para desenvolvimento mobile moderno

# 6. GitHub CLI (Melhor via repositório oficial para integração total)
echo "Instalando GitHub CLI..."
if ! command -v gh &> /dev/null; then
    type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
    sudo mkdir -p -m 755 /etc/apt/keyrings && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null && \
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/weekly/github-cli.list > /dev/null && \
    sudo apt update && \
    sudo apt install gh -y
fi

echo "✅ Ambiente configurado com sucesso!"
echo "⚠️  DICA: Reinicie seu terminal para que o comando 'nvm', 'node' e 'npm' fiquem disponíveis."
echo "Para logar no GitHub, use: gh auth login"
