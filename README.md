# Linux Setup 

Script de automação para configuração rápida de ambiente de desenvolvimento em distros baseadas em Ubuntu/Debian.

## O script instala e configura as seguintes ferramentas utilizando o melhor método para cada uma (Flatpak, APT ou Gerenciadores de Versão):

| Ferramenta | Método | Descrição |
| :--- | :--- | :--- |
| **VS Code** | Flatpak | Editor de código com isolamento e atualizações rápidas. |
| **Docker** | APT (Oficial) | Engine de containers e Docker Compose para infraestrutura. |
| **Node.js (LTS)** | NVM | Gerenciador de versões para evitar conflitos de permissão. |
| **Git** | APT | Controle de versão essencial. |
| **GitHub CLI** | APT (Oficial) | Ferramenta de linha de comando para gerenciar repositórios. |
| **React / React Native** | NPM | Configuração de ambiente global (Expo CLI). |

## Como usar

1.  **Crie o arquivo do script:**
    ```bash
    nano setup_dev.sh
    ```
    Cole o conteúdo do script fornecido e salve com Ctrl+O, Enter, Ctrl+X.

2.  **Dê permissão de execução:**
    ```bash
    chmod +x setup_dev.sh
    ```

3.  **Execute o script:**
    ```bash
    ./setup_dev.sh
    ```

4.  **Pós-instalação:**
    - **Reinicie sua sessão** (Logout/Login) para aplicar as permissões do grupo Docker.
    - Autentique no GitHub: `gh auth login`.
