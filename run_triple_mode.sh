#!/bin/bash

# Triple Mode - Bitcoin + Ethereum + Solana Parallel Execution
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

echo "🔍 Triple: Bitcoin P71-P73 + Ethereum P71-P73 + Solana P71-P73 (${SEARCH_MODE})"

# Bitcoin
echo "▶️  Bitcoin..."
(PUZZLE_ID=71 node bitcoin/config/solver.js) &
BTC_P71=$!
sleep 5
(PUZZLE_ID=72 node bitcoin/config/solver.js) &
BTC_P72=$!
sleep 5
(PUZZLE_ID=73 node bitcoin/config/solver.js) &
BTC_P73=$!

# Ethereum (com delay maior para evitar rate limit)
echo "▶️  Ethereum..."
sleep 10
(PUZZLE_ID=71 node ethereum/config/solver.js) &
ETH_P71=$!
sleep 5
(PUZZLE_ID=72 node ethereum/config/solver.js) &
ETH_P72=$!
sleep 5
(PUZZLE_ID=73 node ethereum/config/solver.js) &
ETH_P73=$!

# Solana (com delay adicional)
echo "▶️  Solana..."
sleep 10
(PUZZLE_ID=71 node solana/config/solver.js) &
SOL_P71=$!
sleep 5
(PUZZLE_ID=72 node solana/config/solver.js) &
SOL_P72=$!
sleep 5
(PUZZLE_ID=73 node solana/config/solver.js) &
SOL_P73=$!

echo "✅ Todos iniciados (delays distribuídos para RPC throttling)"
wait $BTC_P71 $BTC_P72 $BTC_P73 $ETH_P71 $ETH_P72 $ETH_P73 $SOL_P71 $SOL_P72 $SOL_P73 2>/dev/null || true
