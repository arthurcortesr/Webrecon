# Webrecon

O script ```webrecon.sh``` é uma ferramenta de reconhecimento web projetada em bash para identificar diretórios e arquivos em uma determinada URL usando uma lista de palavras-chave fornecida. Ele utiliza a ferramenta de linha de comando curl para enviar requisições HEAD e analisar os códigos de resposta.

Este repositório também possui o arquivo [melhorias](https://github.com/arthurcortesr/Webrecon/blob/main/melhorias.md) que é usado para adicionar anotações de possíveis melhorias a serem implementadas no no script.

<br>

---

<br>

## **Modo de uso**

```bash
./webrecon.sh <url> <tipo de arquivo> <wordlist> [-u user-agent]
```

## **Exemplo**

```bash
./webrecon.sh businesscorp.com.br php lista.txt -u 'Firefox'
```

## **Exemplo de saída**

```bash
------------------------------------
| Pk's Academy - Web Recon |
------------------------------------
Resultado encontrado: businesscorp.com.br/diretorio1 (Código de Status: 200)
Resultado encontrado: businesscorp.com.br/diretorio2 (Código de Status: 301)
------------------------------------
```

<br>

---

<br>

## **Funcionalidades**

1. Busca por diretórios e arquivos na URL fornecida.
2. Suporte para especificar um tipo de arquivo alvo.
3. Opção para personalizar o user agent usado nas requisições.
4. Suporte a HTTPS: O script é capaz de lidar com URLs usando HTTPS, garantindo que funcione para ambas as versões do protocolo.

<br>

---

<br>

## **Observaçoes**

* O script utiliza o curl para realizar requisições HTTP HEAD e analisar os códigos de resposta para identificar diretórios e arquivos existentes.

<br>

---

<br>

## **Avisos**

1. O uso indevido desta ferramenta pode violar leis e regulamentos locais. Certifique-se de compreender e seguir as leis antes de realizar qualquer teste de segurança.
2. Este script deve ser usado apenas em ambientes autorizados e para fins educacionais.
3. Certifique-se de ter permissão adequada antes de realizar testes em sistemas ou redes.
4. A utilização irresponsável de ferramentas de reconhecimento web pode resultar em consequências legais.

























