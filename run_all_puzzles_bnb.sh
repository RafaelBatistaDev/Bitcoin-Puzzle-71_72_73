#!/bin/bash

# BNB Puzzles - Parallel Execution
# Uso: SEARCH_MODE=sequential ./run_all_puzzles_bnb.sh
#      SEARCH_MODE=random ./run_all_puzzles_bnb.sh

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
export BNB_DELAY_MS=2500
echo "⏱️  Delay do BNB ajustado para 2.5s para execução paralela segura"

echo "🔍 BNB: P71 P72 P73 (${SEARCH_MODE})"

(PUZZLE_ID=71 node bnb/config/solver.js) &
PID71=$!

sleep 20

(PUZZLE_ID=72 node bnb/config/solver.js) &
PID72=$!

sleep 20

(PUZZLE_ID=73 node bnb/config/solver.js) &
PID73=$!

wait $PID71 $PID72 $PID73 2>/dev/null || true
