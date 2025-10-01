#!/bin/bash

# Define o tamanho máximo permitido em bytes (100 MB)
MAX_SIZE=$((100 * 1024 * 1024))

echo "Procurando arquivos maiores que 100 MB..."

# Lista arquivos grandes no repositório Git
LARGE_FILES=$(git ls-files -z | xargs -0 -n1 stat --printf="%s %n\n" | awk -v max=$MAX_SIZE '$1 > max {print $2}')

if [ -z "$LARGE_FILES" ]; then
  echo "Nenhum arquivo grande encontrado."
else
  echo "Removendo arquivos grandes do Git:"
  echo "$LARGE_FILES"
  
  # Remove os arquivos grandes do Git (mas mantém localmente)
  echo "$LARGE_FILES" | xargs git rm --cached -r

  echo "Criando commit de remoção de arquivos grandes..."
  git commit -m "Remove arquivos maiores que 100MB para GitHub"

  echo "Fazendo push..."
  git push -u origin main

  echo "Pronto! Arquivos grandes removidos do repositório."
fi

