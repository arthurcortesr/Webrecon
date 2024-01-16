#!/bin/bash

# Definindo códigos de cor ANSI
COR_PKAS="\033[38;5;220m"  # FEB63E
COR_RECON="\033[38;5;197m"  # F5055C
COR_VERDE="\033[92m"  # 00FF00
COR_ERRO="\033[38;5;196m"  # E10406
RESET="\033[0m"  # Reset para as configurações padrão de cor

# Variáveis padrão
url=""
tipo_arquivo=""
lista_arquivo=""
user_agent="PksAcademy"

# Função para exibir a mensagem de ajuda
exibir_mensagem_ajuda() {
    echo "------------------------------------------------------------------------------------"
    echo -e "${COR_PKAS}Pk's Academy${RESET} - ${COR_RECON}Web Recon${RESET}"
    echo "------------------------------------------------------------------------------------"
    echo "Modo de uso: ./webrecon.sh <url> <tipo de arquivo> <wordlist> [-u user-agent]"
    echo "------------------------------------------------------------------------------------"
    echo "Exemplo: ./webrecon.sh businesscorp.com.br php lista.txt -u 'Firefox'"
    echo "------------------------------------------------------------------------------------"
    echo "Comandos:"
    echo "  -u          user-agent"
    echo "  Ex:        -u 'Firefox'"
    echo "------------------------------------------------------------------------------------"
}

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -lt 3 ]; then
    exibir_mensagem_ajuda
    exit 1
fi

# Processa os argumentos
while [ "$#" -gt 0 ]; do
    case "$1" in
        -u)
            shift
            user_agent="$1"
            ;;
        *)
            if [ -z "$url" ]; then
                url="$1"
            elif [ -z "$tipo_arquivo" ]; then
                tipo_arquivo="$1"
            elif [ -z "$lista_arquivo" ]; then
                lista_arquivo="$1"
            fi
            ;;
    esac
    shift
done

# Verifica se o arquivo de lista existe
if [ ! -f "$lista_arquivo" ]; then
    echo -e "${COR_ERRO}Erro: O arquivo de lista '$lista_arquivo' não existe.${RESET}"
    exit 1
fi

# Lê as palavras do arquivo de lista para um array
readarray -t palavras < "$lista_arquivo"

# Exibe a mensagem de cabeçalho
echo "------------------------------------"
echo -e "| ${COR_PKAS}Pk's Academy${RESET} - ${COR_RECON}Web Recon${RESET} |"
echo "------------------------------------"

# Itera sobre o array para buscar diretórios e arquivos
for palavra in "${palavras[@]}"; do
    resposta=$(curl -s -I -H "User-Agent: $user_agent" "$url/$palavra" | head -n 1 | cut -d ' ' -f 2)

    # Verifica se a resposta é um código de sucesso (2xx) ou redirecionamento (3xx)
    if [[ "$resposta" =~ ^2[0-9][0-9]$ || "$resposta" =~ ^3[0-9][0-9]$ ]]; then
        echo -e "Resultado encontrado: $url/$palavra (Código de Status: ${COR_VERDE}$resposta${RESET})"
    fi
done
echo "------------------------------------"
