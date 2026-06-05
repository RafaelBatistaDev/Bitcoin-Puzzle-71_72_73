#!/bin/bash

# Dual Mode - Bitcoin + Ethereum Parallel Execution
set -e

# Função para verificar internet
check_internet() {
  while ! curl -s -m 5 --connect-timeout 5 https://1.1.1.1 > /dev/null 2>&1; do
    echo "⚠️  Internet indisponível. Aguardando reconexão..."
    sleep 10
  done
  echo "✅ Internet OK"
}

# Verificar internet ao iniciar
echo "🌐 Verificando conexão internet..."
check_internet

# Carregar variáveis do .env
if [ -f ".env" ]; then
  source .env
  echo "✅ Configurações carregadas de .env"
fi

export SEARCH_MODE="${SEARCH_MODE:-sequential}"

echo "🔍 Dual: Bitcoin P71-P73 + Ethereum P71-P73 (${SEARCH_MODE})"

# Bitcoin
echo "▶️  Bitcoin..."
(PUZZLE_ID=71 node bitcoin/config/solver.js) &
BTC_P71=$!
sleep 7
(PUZZLE_ID=72 node bitcoin/config/solver.js) &
BTC_P72=$!
sleep 7
(PUZZLE_ID=73 node bitcoin/config/solver.js) &
BTC_P73=$!

# Ethereum (com delay maior para evitar rate limit na API Cloudflare)
echo "▶️  Ethereum..."
(PUZZLE_ID=71 node ethereum/config/solver.js) &
ETH_P71=$!
sleep 15
(PUZZLE_ID=72 node ethereum/config/solver.js) &
ETH_P72=$!
sleep 15
(PUZZLE_ID=73 node ethereum/config/solver.js) &
ETH_P73=$!

echo "✅ Todos iniciados (Ethereum com delays de 15s entre inicializações)"
wait $BTC_P71 $BTC_P72 $BTC_P73 $ETH_P71 $ETH_P72 $ETH_P73 2>/dev/null || true
