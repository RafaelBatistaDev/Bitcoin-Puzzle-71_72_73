#!/bin/bash

# 🚀 MASTER - Executa todos os 5 networks em paralelo
# Bitcoin, Ethereum, Solana, Polygon, BNB
# Modo: SEARCH_MODE=sequential (obrigatório)

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

# SEARCH_MODE forçado como sequential
export SEARCH_MODE="sequential"

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🚀 MASTER - 5 NETWORKS PARALELOS                         ║"
echo "║  Bitcoin + Ethereum + Solana + Polygon + BNB              ║"
echo "║  Mode: SEARCH_MODE=sequential                             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# ============ BITCOIN ============
echo "▶️  [1/5] Bitcoin P71-P73..."
(PUZZLE_ID=71 node puzzle_solver.js) &
BTC_P71=$!
sleep 7
(PUZZLE_ID=72 node puzzle_solver.js) &
BTC_P72=$!
sleep 7
(PUZZLE_ID=73 node puzzle_solver.js) &
BTC_P73=$!

# ============ ETHEREUM ============
echo "▶️  [2/5] Ethereum P71-P73..."
sleep 3
(PUZZLE_ID=71 node puzzle_solver_ethereum.js) &
ETH_P71=$!
sleep 7
(PUZZLE_ID=72 node puzzle_solver_ethereum.js) &
ETH_P72=$!
sleep 7
(PUZZLE_ID=73 node puzzle_solver_ethereum.js) &
ETH_P73=$!

# ============ SOLANA ============
echo "▶️  [3/5] Solana P71-P73..."
sleep 3
(PUZZLE_ID=71 node puzzle_solver_solana.js) &
SOL_P71=$!
sleep 7
(PUZZLE_ID=72 node puzzle_solver_solana.js) &
SOL_P72=$!
sleep 7
(PUZZLE_ID=73 node puzzle_solver_solana.js) &
SOL_P73=$!

# ============ POLYGON ============
echo "▶️  [4/5] Polygon P71-P73..."
sleep 3
(PUZZLE_ID=71 node puzzle_solver_polygon.js) &
POLY_P71=$!
sleep 7
(PUZZLE_ID=72 node puzzle_solver_polygon.js) &
POLY_P72=$!
sleep 7
(PUZZLE_ID=73 node puzzle_solver_polygon.js) &
POLY_P73=$!

# ============ BNB ============
echo "▶️  [5/5] BNB P71-P73..."
sleep 3
(PUZZLE_ID=71 node puzzle_solver_bnb.js) &
BNB_P71=$!
sleep 7
(PUZZLE_ID=72 node puzzle_solver_bnb.js) &
BNB_P72=$!
sleep 7
(PUZZLE_ID=73 node puzzle_solver_bnb.js) &
BNB_P73=$!

echo ""
echo "📊 Aguardando conclusão de todos os processos..."
echo ""

# Aguardar todos os processos
wait $BTC_P71 $BTC_P72 $BTC_P73 \
     $ETH_P71 $ETH_P72 $ETH_P73 \
     $SOL_P71 $SOL_P72 $SOL_P73 \
     $POLY_P71 $POLY_P72 $POLY_P73 \
     $BNB_P71 $BNB_P72 $BNB_P73 2>/dev/null || true

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  ✅ MASTER CONCLUÍDO - Todos os 15 puzzles foram executados  ║"
echo "╚════════════════════════════════════════════════════════════╝"
