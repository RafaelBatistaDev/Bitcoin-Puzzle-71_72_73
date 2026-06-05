# 🚀 QUICK START - Todos os Comandos

https://www.ankr.com/rpc/eth

https://www.ankr.com/rpc/solana

https://www.ankr.com/rpc/btc

https://www.ankr.com/rpc/bsc

https://www.ankr.com/rpc/polygon

## 📋 Índice
1. [Rodar Solvers](#rodar-solvers)
2. [Verificar Resultados](#verificar-resultados)
3. [Redes Individuais](#redes-individuais)
4. [Estrutura de Diretórios](#estrutura-de-diretórios)

---
# Chaves de API
https://www.ankr.com/rpc

# criar e entrar no toolbox
toolbox create puzzle-solver
toolbox enter puzzle-solver

# Executar baixar dependençias
./setup_toolbox.sh

# QuickStart
./quickstart.sh

## 🎯 Rodar Solvers

### **OPÇÃO 1: Rodar todos os 5 networks em paralelo (RECOMENDADO)**
```bash
./run_all_networks.sh
```
✅ Executa Bitcoin + Ethereum + Solana + Polygon + BNB  
✅ 15 puzzles (3×5) rodando ao mesmo tempo  
✅ Gera `batch_history.jsonl` em cada `PUZZLE_*`  
⏱️ Tempo: ~1-2 horas (depende da velocidade do RPC e CPU)

---

## ✅ Verificar Resultados

### **OPÇÃO 1: Verificar todos os 5 networks (RECOMENDADO)**
```bash
uv run check_all_networks.py
```
✅ Extrai endereços com saldo dos 5 networks  
✅ Gera 5 arquivos individuais + 1 consolidado  
✅ Output: `relatorio_final/`

__

### **OPÇÃO 2: Rodar networks individuais**

#### Bitcoin (3 puzzles)
```bash
./run_all_puzzles.sh
```

#### Ethereum (3 puzzles)
```bash
./run_all_puzzles_ethereum.sh
```

#### Solana (3 puzzles)
```bash
./run_all_puzzles_solana.sh
```

#### Polygon (3 puzzles)
```bash
./run_all_puzzles_polygon.sh
```

#### BNB (3 puzzles)
```bash
./run_all_puzzles_bnb.sh
```

---

### **OPÇÃO 3: Rodar um puzzle específico**

```bash
# Bitcoin - Puzzle 71
PUZZLE_ID=71 node puzzle_solver.js

# Bitcoin - Puzzle 72
PUZZLE_ID=72 node puzzle_solver.js

# Bitcoin - Puzzle 73
PUZZLE_ID=73 node puzzle_solver.js

# Ethereum - Puzzle 71
PUZZLE_ID=71 node puzzle_solver_ethereum.js

# Ethereum - Puzzle 72
PUZZLE_ID=72 node puzzle_solver_ethereum.js

# Ethereum - Puzzle 73
PUZZLE_ID=73 node puzzle_solver_ethereum.js

# Solana - Puzzle 71
PUZZLE_ID=71 node puzzle_solver_solana.js

# Polygon - Puzzle 71
PUZZLE_ID=71 node puzzle_solver_polygon.js

# BNB - Puzzle 71
PUZZLE_ID=71 node puzzle_solver_bnb.js
```

---

### **OPÇÃO 2: Verificar networks individuais**

```bash
uv run check_bitcoin.py      # Bitcoin
uv run check_ethereum.py     # Ethereum
uv run check_solana.py       # Solana
uv run check_polygon.py      # Polygon
uv run check_bnb.py          # BNB
```

---

### **OPÇÃO 3: Analisar arquivo consolidado**
```bash
cat relatorio_final/all_networks_consolidated.jsonl
```

### **OPÇÃO 4: Contar total de endereços encontrados**
```bash
wc -l relatorio_final/all_networks_consolidated.jsonl
```

### **OPÇÃO 5: Filtrar por network específico**
```bash
# Bitcoin
grep '"network": "bitcoin"' relatorio_final/all_networks_consolidated.jsonl

# Ethereum
grep '"network": "ethereum"' relatorio_final/all_networks_consolidated.jsonl

# Polygon
grep '"network": "polygon"' relatorio_final/all_networks_consolidated.jsonl

# BNB
grep '"network": "bnb"' relatorio_final/all_networks_consolidated.jsonl
```

---

## 🌐 Redes Individuais

### **Bitcoin**
```bash
# Rodar
./run_all_puzzles.sh

# Verificar
uv run check_bitcoin.py
```

### **Ethereum**
```bash
# Rodar
./run_all_puzzles_ethereum.sh

# Verificar
uv run check_ethereum.py
```

### **Solana**
```bash
# Rodar
./run_all_puzzles_solana.sh

# Verificar
uv run check_solana.py
```

### **Polygon** ⭐ NOVO
```bash
# Rodar
./run_all_puzzles_polygon.sh

# Verificar
uv run check_polygon.py
```

### **BNB** ⭐ NOVO
```bash
# Rodar
./run_all_puzzles_bnb.sh

# Verificar
uv run check_bnb.py
```

---

## 📂 Estrutura de Diretórios

```
/
├── puzzle_solver.js                    # Bitcoin master
├── puzzle_solver_ethereum.js           # Ethereum master
├── puzzle_solver_solana.js             # Solana master
├── puzzle_solver_polygon.js            # Polygon master ⭐
├── puzzle_solver_bnb.js                # BNB master ⭐
│
├── run_all_puzzles.sh                  # Bitcoin: P71, P72, P73
├── run_all_puzzles_ethereum.sh         # Ethereum: P71, P72, P73
├── run_all_puzzles_solana.sh           # Solana: P71, P72, P73
├── run_all_puzzles_polygon.sh          # Polygon: P71, P72, P73 ⭐
├── run_all_puzzles_bnb.sh              # BNB: P71, P72, P73 ⭐
├── run_all_networks.sh                 # MASTER: Todos os 5 em paralelo 🚀
│
├── check_bitcoin.py                    # Bitcoin checker
├── check_ethereum.py                   # Ethereum checker
├── check_solana.py                     # Solana checker
├── check_polygon.py                    # Polygon checker ⭐
├── check_bnb.py                        # BNB checker ⭐
├── check_all_networks.py               # MASTER checker (todos) 🚀
│
├── bitcoin/                            # Bitcoin config & cache
│   ├── config/                         # solver.js, utils.js, etc.
│   ├── cache/                          # puzzle_*.json
│   ├── logs/
│   ├── PUZZLE_71, 72, 73/
│
├── ethereum/                           # Ethereum config & cache
│   ├── config/                         # solver.js, utils.js, etc.
│   ├── cache/
│   ├── logs/
│   ├── PUZZLE_71, 72, 73/
│
├── solana/                             # Solana config & cache
│   ├── config/                         # solver.js, utils.js, etc.
│   ├── cache/
│   ├── logs/
│   ├── PUZZLE_71, 72, 73/
│
├── polygon/                            # Polygon config & cache ⭐
│   ├── config/                         # solver.js, utils.js, etc.
│   ├── cache/
│   ├── logs/
│   ├── PUZZLE_71, 72, 73/
│
├── bnb/                                # BNB config & cache ⭐
│   ├── config/                         # solver.js, utils.js, etc.
│   ├── cache/
│   ├── logs/
│   ├── PUZZLE_71, 72, 73/
│
└── relatorio_final/                    # Resultados consolidados
    ├── bitcoin_addresses_with_balance.jsonl
    ├── ethereum_addresses_with_balance.jsonl
    ├── solana_addresses_with_balance.jsonl
    ├── polygon_addresses_with_balance.jsonl ⭐
    ├── bnb_addresses_with_balance.jsonl ⭐
    └── all_networks_consolidated.jsonl 🚀
```

---

## 🔄 Workflow Recomendado

### **Execução Completa (SIMPLES)**

```bash
# 1. Rodar todos os solvers
./run_all_networks.sh

# 2. Verificar todos os resultados
uv run check_all_networks.py

# 3. Ver achados consolidados
cat relatorio_final/all_networks_consolidated.jsonl
```

### **Execução Modular (FLEXÍVEL)**

```bash
# Rodar apenas um network
./run_all_puzzles_polygon.sh

# Verificar apenas polygon
uv run check_polygon.py

# Ver resultados de polygon
cat relatorio_final/polygon_addresses_with_balance.jsonl
```

---

## ⚙️ Configuração

### **.env** (opcional)
Crie um arquivo `.env` na raiz para customizar:

```env
PUZZLE_ID=71
BATCH_SIZE=20
DELAY_MS=5000
MAX_REQ_24H=10000
RPC_ENDPOINT=https://rpc.ankr.com/eth
SEARCH_MODE=sequential
```

**NOTA**: `SEARCH_MODE=sequential` é **OBRIGATÓRIO** em todos os scripts!

---

## 📊 Outputs Esperados

### Bitcoin
```json
{
  "puzzle": "PUZZLE_71",
  "endereco": "0x...",
  "saldo": "0.5",
  "privHex": "0x...",
  "timestamp": "2026-06-05T..."
}
```

### Ethereum/Polygon/BNB (mesmo formato, diferentes moedas)
```json
{
  "network": "ethereum",
  "puzzle": "PUZZLE_71",
  "endereco": "0x...",
  "saldo": "2.5",  // ETH ou MATIC ou BNB
  "privHex": "0x...",
  "timestamp": "2026-06-05T..."
}
```

---

## 🆘 Troubleshooting

### Script não encontrado
```bash
chmod +x *.sh *.py
```

### Permissão negada
```bash
chmod +x ./run_all_networks.sh
chmod +x check_all_networks.py
```

### Módulo Node não encontrado
```bash
npm install
```

### Python 3 ou uv não encontrado
```bash
# Verificar versão de uv
uv --version

# Se uv não está instalado:
# Instale de: https://docs.astral.sh/uv/getting-started/
# ou com: pip install uv
```

---

## 🎯 Resumo de Comandos Essenciais

| Tarefa | Comando |
|--------|---------|
| **Rodar tudo** | `./run_all_networks.sh` |
| **Verificar tudo** | `uv run check_all_networks.py` |
| **Ver consolidado** | `cat relatorio_final/all_networks_consolidated.jsonl` |
| **Rodar Polygon** | `./run_all_puzzles_polygon.sh` |
| **Rodar BNB** | `./run_all_puzzles_bnb.sh` |
| **Check Polygon** | `uv run check_polygon.py` |
| **Check BNB** | `uv run check_bnb.py` |

---

**⭐ Networks Novos: Polygon e BNB**  
**🚀 Scripts Master: run_all_networks.sh e check_all_networks.py**

Criado: 5 de junho de 2026
