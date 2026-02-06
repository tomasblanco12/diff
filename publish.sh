#!/usr/bin/env bash
set -e

# Ajusta estos valores si es necesario
OWNER="tomasblanco12"
REPO="plastico-contaminacion"
VISIBILITY="public"

# Comprueba comando gh
if ! command -v gh >/dev/null 2>&1; then
  echo "Error: 'gh' no está instalado. Instálalo desde https://cli.github.com/ e inténtalo de nuevo."
  exit 1
fi

# Comprueba que estamos en un repo git o carpeta que contenga archivos
echo "Preparando commit..."
git init >/dev/null 2>&1 || true
git add .
git commit -m "Initial commit - PlasticScan" || true
git branch -M main

# Crear repo en GitHub y pushear
echo "Creando repositorio ${OWNER}/${REPO} en GitHub y haciendo push..."
gh repo create "${OWNER}/${REPO}" --"${VISIBILITY}" --source=. --remote=origin --push

echo "Repositorio creado y contenido subido."
echo "Si GitHub Pages no se habilitó automáticamente, ejecútalo desde la web o usa:"
echo "  gh pages enable --branch main --path /"
echo ""
echo "URL esperada (unos segundos después de activar): https://${OWNER}.github.io/${REPO}/"